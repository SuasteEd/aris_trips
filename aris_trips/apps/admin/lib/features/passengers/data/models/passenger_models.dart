import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/booking.dart';
import '../../domain/entities/passenger.dart';
import '../../domain/entities/passenger_draft.dart';

part 'passenger_models.freezed.dart';
part 'passenger_models.g.dart';

String? _blankToNull(String value) => value.isEmpty ? null : value;

@freezed
abstract class PassengerModel with _$PassengerModel {
  const factory PassengerModel({
    required String id,
    required String firstName,
    required String lastName,
    String? email,
    String? phone,
  }) = _PassengerModel;

  const PassengerModel._();

  factory PassengerModel.fromJson(Map<String, dynamic> json) =>
      _$PassengerModelFromJson(json);

  static const String columns = 'id, first_name, last_name, email, phone';

  static Map<String, dynamic> draftToJson(PassengerDraft draft) => {
    'first_name': draft.firstName,
    'last_name': draft.lastName,
    'email': _blankToNull(draft.email),
    'phone': _blankToNull(draft.phone),
  };

  Passenger toEntity() => Passenger(
    id: id,
    firstName: firstName,
    lastName: lastName,
    email: email,
    phone: phone,
  );
}

@freezed
abstract class FlightAssignmentModel with _$FlightAssignmentModel {
  const factory FlightAssignmentModel({
    required String id,
    required String bookingId,
    required String flightId,
    String? seat,
    String? recordLocator,
  }) = _FlightAssignmentModel;

  const FlightAssignmentModel._();

  factory FlightAssignmentModel.fromJson(Map<String, dynamic> json) =>
      _$FlightAssignmentModelFromJson(json);

  static const String columns =
      'id, booking_id, flight_id, seat, record_locator';

  FlightAssignment toEntity() => FlightAssignment(
    id: id,
    bookingId: bookingId,
    flightId: flightId,
    seat: seat,
    recordLocator: recordLocator,
  );
}

@freezed
abstract class LodgingAssignmentModel with _$LodgingAssignmentModel {
  const factory LodgingAssignmentModel({
    required String id,
    required String bookingId,
    required String lodgingId,
    String? room,
    String? confirmationNumber,
  }) = _LodgingAssignmentModel;

  const LodgingAssignmentModel._();

  factory LodgingAssignmentModel.fromJson(Map<String, dynamic> json) =>
      _$LodgingAssignmentModelFromJson(json);

  static const String columns =
      'id, booking_id, lodging_id, room, confirmation_number';

  LodgingAssignment toEntity() => LodgingAssignment(
    id: id,
    bookingId: bookingId,
    lodgingId: lodgingId,
    room: room,
    confirmationNumber: confirmationNumber,
  );
}

/// Row of `public.bookings` with embedded passenger and assignments.
/// `token_hash` and `code_hash` are never selected (and not granted).
@freezed
abstract class BookingModel with _$BookingModel {
  const factory BookingModel({
    required String id,
    required String tripId,
    required String status,
    String? notes,
    required PassengerModel passenger,
    @Default([]) List<FlightAssignmentModel> flightAssignments,
    @Default([]) List<LodgingAssignmentModel> lodgingAssignments,
  }) = _BookingModel;

  const BookingModel._();

  factory BookingModel.fromJson(Map<String, dynamic> json) =>
      _$BookingModelFromJson(json);

  static const String columns =
      'id, trip_id, status, notes, '
      'passenger:passengers!inner(${PassengerModel.columns}), '
      'flight_assignments(${FlightAssignmentModel.columns}), '
      'lodging_assignments(${LodgingAssignmentModel.columns})';

  Booking toEntity() => Booking(
    id: id,
    tripId: tripId,
    passenger: passenger.toEntity(),
    status: BookingStatus.fromValue(status),
    notes: notes,
    flightAssignments: [for (final a in flightAssignments) a.toEntity()],
    lodgingAssignments: [for (final a in lodgingAssignments) a.toEntity()],
  );
}
