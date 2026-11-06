import 'package:aris_admin/core/config/env.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Env', () {
    test('is valid with complete configuration', () {
      const env = Env(
        supabaseUrl: 'https://abc.supabase.co',
        supabaseAnonKey: 'sb_publishable_key',
        webBaseUrl: 'http://localhost:3000',
      );

      expect(env.isValid, isTrue);
      expect(env.validate, returnsNormally);
    });

    test('reports every missing or malformed variable', () {
      const env = Env(
        supabaseUrl: 'not a url',
        supabaseAnonKey: ' ',
        webBaseUrl: '',
      );

      expect(env.problems, [
        'SUPABASE_URL',
        'SUPABASE_ANON_KEY',
        'WEB_BASE_URL',
      ]);
      expect(env.validate, throwsStateError);
    });

    test('defaults to empty values when no dart-define is passed', () {
      expect(Env.fromEnvironment().isValid, isFalse);
    });
  });
}
