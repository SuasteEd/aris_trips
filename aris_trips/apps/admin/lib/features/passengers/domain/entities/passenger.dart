import 'package:freezed_annotation/freezed_annotation.dart';

import 'passenger_draft.dart';

part 'passenger.freezed.dart';

@freezed
abstract class Passenger with _$Passenger {
  const factory Passenger({
    required String id,
    required String firstName,
    required String lastName,
    String? email,
    String? phone,
  }) = _Passenger;

  const Passenger._();

  String get fullName => '$firstName $lastName';

  PassengerDraft toDraft() => PassengerDraft(
    firstName: firstName,
    lastName: lastName,
    email: email ?? '',
    phone: phone ?? '',
  );
}
