/// Lifecycle of a trip. Values match the `trips.status` check constraint.
enum TripStatus {
  draft('draft'),
  published('published'),
  archived('archived');

  const TripStatus(this.value);

  final String value;

  static TripStatus fromValue(String value) => TripStatus.values.firstWhere(
    (status) => status.value == value,
    orElse: () => throw ArgumentError.value(value, 'value', 'Unknown status'),
  );
}
