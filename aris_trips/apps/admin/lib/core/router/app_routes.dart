abstract final class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String trips = '/trips';
  static const String tripNew = '/trips/new';
  static String tripDetail(String id) => '/trips/$id';
  static String tripEdit(String id) => '/trips/$id/edit';

  /// Landing page after signing in.
  static const String home = trips;
}
