import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/text/person_key.dart';

part 'passenger_draft.freezed.dart';

enum PassengerDraftIssue { firstNameRequired, lastNameRequired, emailInvalid }

/// Passenger data as typed or imported. No passport, birth date or payment
/// data is ever stored.
@freezed
abstract class PassengerDraft with _$PassengerDraft {
  const factory PassengerDraft({
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String email,
    @Default('') String phone,
  }) = _PassengerDraft;

  const PassengerDraft._();

  static final RegExp _email = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  Set<PassengerDraftIssue> get issues => {
    if (firstName.trim().isEmpty) PassengerDraftIssue.firstNameRequired,
    if (lastName.trim().isEmpty) PassengerDraftIssue.lastNameRequired,
    if (email.trim().isNotEmpty && !_email.hasMatch(email.trim()))
      PassengerDraftIssue.emailInvalid,
  };

  bool get isValid => issues.isEmpty;

  /// Trimmed copy with single spaces and a lowercase email.
  PassengerDraft normalized() {
    String clean(String value) => value.trim().replaceAll(RegExp(r'\s+'), ' ');
    return PassengerDraft(
      firstName: clean(firstName),
      lastName: clean(lastName),
      email: email.trim().toLowerCase(),
      phone: phone.trim(),
    );
  }

  /// Same person for the reuse rule: email, first and last name match,
  /// ignoring case, accents and spaces.
  String get identityKey =>
      '${personKey(email)}|${personKey(firstName)}|${personKey(lastName)}';
}
