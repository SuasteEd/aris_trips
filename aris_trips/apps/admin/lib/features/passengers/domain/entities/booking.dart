import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/text/person_key.dart';
import 'passenger.dart';

part 'booking.freezed.dart';

/// Values match the `bookings.status` check constraint.
enum BookingStatus {
  pending('pending'),
  confirmed('confirmed'),
  cancelled('cancelled');

  const BookingStatus(this.value);

  final String value;

  static BookingStatus fromValue(String value) =>
      BookingStatus.values.firstWhere(
        (status) => status.value == value,
        orElse: () =>
            throw ArgumentError.value(value, 'value', 'Unknown status'),
      );
}

@freezed
abstract class FlightAssignment with _$FlightAssignment {
  const factory FlightAssignment({
    required String id,
    required String bookingId,
    required String flightId,
    String? seat,
    String? recordLocator,
  }) = _FlightAssignment;
}

@freezed
abstract class LodgingAssignment with _$LodgingAssignment {
  const factory LodgingAssignment({
    required String id,
    required String bookingId,
    required String lodgingId,
    String? room,
    String? confirmationNumber,
  }) = _LodgingAssignment;
}

/// A passenger on a trip, with their own assignments. Access credentials
/// (hashes) are never part of this entity.
@freezed
abstract class Booking with _$Booking {
  const factory Booking({
    required String id,
    required String tripId,
    required Passenger passenger,
    required BookingStatus status,
    String? notes,
    @Default([]) List<FlightAssignment> flightAssignments,
    @Default([]) List<LodgingAssignment> lodgingAssignments,
  }) = _Booking;

  const Booking._();

  /// Search by name or email, ignoring case and accents.
  bool matches(String query) {
    final key = personKey(query);
    if (key.isEmpty) return true;
    return personKey(passenger.fullName).contains(key) ||
        personKey(passenger.email).contains(key);
  }

  bool hasFlight(String flightId) =>
      flightAssignments.any((a) => a.flightId == flightId);

  bool hasLodging(String lodgingId) =>
      lodgingAssignments.any((a) => a.lodgingId == lodgingId);
}
