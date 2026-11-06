import 'package:aris_admin/core/data/supabase_exception_mapper.dart';
import 'package:aris_admin/core/error/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  test('storage not found', () {
    expect(
      mapSupabaseException(const StorageException('gone', statusCode: '404')),
      const Failure.notFound(),
    );
  });

  test('other storage errors are server failures', () {
    expect(
      mapSupabaseException(
        const StorageException('too large', statusCode: '413'),
      ),
      const Failure.server(message: 'too large', code: '413'),
    );
  });

  test('invalid credentials are not special outside auth', () {
    expect(
      mapSupabaseException(
        const AuthApiException('bad', statusCode: '400', code: 'invalid_credentials'),
      ),
      const Failure.server(message: 'bad', code: 'invalid_credentials'),
    );
  });
}
