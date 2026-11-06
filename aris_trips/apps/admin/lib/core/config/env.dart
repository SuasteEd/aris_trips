/// Compile-time configuration from `--dart-define-from-file=env.json`.
class Env {
  const Env({
    required this.supabaseUrl,
    required this.supabaseAnonKey,
    required this.webBaseUrl,
  });

  /// Reads the values compiled into the app.
  factory Env.fromEnvironment() => const Env(
    supabaseUrl: String.fromEnvironment('SUPABASE_URL'),
    supabaseAnonKey: String.fromEnvironment('SUPABASE_ANON_KEY'),
    webBaseUrl: String.fromEnvironment('WEB_BASE_URL'),
  );

  final String supabaseUrl;

  /// Public (anon/publishable) key. The service_role key never goes here.
  final String supabaseAnonKey;

  final String webBaseUrl;

  /// Names of the variables that are empty or malformed.
  List<String> get problems => [
    if (!_isHttpUrl(supabaseUrl)) 'SUPABASE_URL',
    if (supabaseAnonKey.trim().isEmpty) 'SUPABASE_ANON_KEY',
    if (!_isHttpUrl(webBaseUrl)) 'WEB_BASE_URL',
  ];

  bool get isValid => problems.isEmpty;

  /// Throws a [StateError] naming every missing variable.
  void validate() {
    if (!isValid) {
      throw StateError(
        'Missing or invalid configuration: ${problems.join(', ')}. '
        'Run with --dart-define-from-file=env.json.',
      );
    }
  }

  static bool _isHttpUrl(String value) {
    final uri = Uri.tryParse(value.trim());
    return uri != null &&
        (uri.scheme == 'http' || uri.scheme == 'https') &&
        uri.host.isNotEmpty;
  }
}
