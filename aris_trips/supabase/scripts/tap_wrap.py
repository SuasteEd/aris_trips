"""Wraps a pgTAP script so it runs in one call and is always rolled back.

Reads a test file (begin; ... select * from finish(); rollback;) and prints a
SQL batch that defines pg_temp.run_tap() and calls it. Inside the function each
statement runs in a subtransaction: SELECT results are collected as TAP lines,
other statements are executed as-is, and a final exception rolls everything
back. plpgsql variables survive the rollback, so the TAP output is returned.
"""

import re
import sys

SKIP = re.compile(
    r"^(begin|rollback|select \* from finish\(\)|"
    r"create extension if not exists pgtap.*)$",
    re.IGNORECASE | re.DOTALL,
)


def strip_comments(line: str) -> str:
    # Test files only use full-line or trailing "--" comments outside strings.
    return "" if line.lstrip().startswith("--") else line


def split_statements(sql: str) -> list[str]:
    statements, current, in_dollar = [], [], False
    for raw in sql.splitlines():
        line = strip_comments(raw)
        if not line.strip():
            continue
        current.append(line)
        if line.count("$$") % 2 == 1:
            in_dollar = not in_dollar
        if not in_dollar and line.rstrip().endswith(";"):
            stmt = "\n".join(current).strip().rstrip(";").strip()
            current = []
            if stmt and not SKIP.match(stmt):
                statements.append(stmt)
    if current:
        raise SystemExit("unterminated statement at end of file")
    return statements


def quote(text: str, n: int) -> str:
    tag = f"$q{n}$"
    if tag in text:
        raise SystemExit(f"quote tag {tag} clashes with test content")
    return f"{tag}{text}{tag}"


def main(path: str) -> None:
    with open(path, encoding="utf-8") as f:
        statements = split_statements(f.read())

    body = []
    for n, stmt in enumerate(statements):
        if re.match(r"^select\b", stmt, re.IGNORECASE):
            wrapped = (
                "select coalesce(array_agg((select e.value from jsonb_each_text(to_jsonb(r)) e limit 1)), '{}') from ("
                + stmt
                + ") r"
            )
            body.append(f"    execute {quote(wrapped, n)} into v_lines;")
            body.append("    v_out := v_out || v_lines;")
        else:
            body.append(f"    execute {quote(stmt, n)};")

    print(
        "\n".join(
            [
                "create or replace function pg_temp.run_tap()",
                "returns setof text",
                "language plpgsql",
                "as $runner$",
                "declare",
                "  v_out text[] := '{}';",
                "  v_lines text[];",
                "begin",
                "  begin",
                "    create extension if not exists pgtap with schema extensions;",
                *body,
                "    v_out := v_out || array(select f from extensions.finish() f where f is not null);",
                "    raise exception using errcode = 'P0T01', message = 'rollback test';",
                "  exception",
                "    when sqlstate 'P0T01' then",
                "      null;",
                "    when others then",
                "      v_out := v_out || ('not ok - script error: ' || sqlerrm || ' [' || sqlstate || ']');",
                "  end;",
                "  return query select unnest(v_out);",
                "end;",
                "$runner$;",
                "",
                "select pg_temp.run_tap() as tap;",
            ]
        )
    )


if __name__ == "__main__":
    main(sys.argv[1])
