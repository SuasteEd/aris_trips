abstract final class AppRoutes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String trips = '/trips';
  static const String tripNew = '/trips/new';
  static String tripDetail(String id) => '/trips/$id';
  static String tripEdit(String id) => '/trips/$id/edit';
  static String passengerNew(String tripId) => '/trips/$tripId/passengers/new';
  static String passengersImport(String tripId) =>
      '/trips/$tripId/passengers/import';
  static String passengersAssign(String tripId) =>
      '/trips/$tripId/passengers/assign';
  static String booking(String tripId, String bookingId) =>
      '/trips/$tripId/passengers/$bookingId';

  /// Landing page after signing in.
  static const String home = trips;
}
