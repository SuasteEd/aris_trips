/// Form validators for the login screen. Return the error text or null.
abstract final class LoginValidators {
  static final RegExp _email = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  static String? email(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) return 'Escribe tu correo.';
    if (!_email.hasMatch(email)) return 'Escribe un correo válido.';
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) return 'Escribe tu contraseña.';
    return null;
  }
}
