import 'package:aris_admin/core/config/config_error_app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('names the missing variables', (tester) async {
    await tester.pumpWidget(
      const ConfigErrorApp(missing: ['SUPABASE_URL', 'SUPABASE_ANON_KEY']),
    );

    expect(find.text('Falta la configuración'), findsOneWidget);
    expect(
      find.textContaining('SUPABASE_URL, SUPABASE_ANON_KEY'),
      findsOneWidget,
    );
    expect(
      find.textContaining('--dart-define-from-file=.env'),
      findsOneWidget,
    );
  });
}
