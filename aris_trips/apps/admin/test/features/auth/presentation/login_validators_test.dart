import 'package:aris_admin/features/auth/presentation/widgets/login_validators.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('email validation', () {
    expect(LoginValidators.email(null), 'Escribe tu correo.');
    expect(LoginValidators.email('  '), 'Escribe tu correo.');
    expect(LoginValidators.email('ana@'), 'Escribe un correo válido.');
    expect(LoginValidators.email(' ana@aristrips.dev '), isNull);
  });

  test('password validation', () {
    expect(LoginValidators.password(''), 'Escribe tu contraseña.');
    expect(LoginValidators.password(' '), isNull);
  });
}
