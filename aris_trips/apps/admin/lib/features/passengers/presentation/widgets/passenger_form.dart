import 'package:flutter/material.dart';

import '../../../../core/theme/app_tokens.dart';
import '../../domain/entities/passenger_draft.dart';
import 'passenger_ui.dart';

/// Name, last name, email and phone fields bound to [controllers].
class PassengerFields extends StatelessWidget {
  const PassengerFields({
    super.key,
    required this.controllers,
    required this.issues,
    this.enabled = true,
  });

  final PassengerControllers controllers;
  final Set<PassengerDraftIssue> issues;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    String? error(PassengerDraftIssue issue) =>
        issues.contains(issue) ? issue.message : null;
    return Column(
      children: [
        TextField(
          key: const Key('passenger_first_name'),
          controller: controllers.firstName,
          enabled: enabled,
          textCapitalization: TextCapitalization.words,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: 'Nombre',
            errorText: error(PassengerDraftIssue.firstNameRequired),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        TextField(
          key: const Key('passenger_last_name'),
          controller: controllers.lastName,
          enabled: enabled,
          textCapitalization: TextCapitalization.words,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: 'Apellido',
            errorText: error(PassengerDraftIssue.lastNameRequired),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        TextField(
          key: const Key('passenger_email'),
          controller: controllers.email,
          enabled: enabled,
          keyboardType: TextInputType.emailAddress,
          autocorrect: false,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: 'Correo (opcional)',
            errorText: error(PassengerDraftIssue.emailInvalid),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        TextField(
          key: const Key('passenger_phone'),
          controller: controllers.phone,
          enabled: enabled,
          keyboardType: TextInputType.phone,
          decoration: const InputDecoration(
            labelText: 'Teléfono (opcional)',
            hintText: '+52 55 1234 5678',
          ),
        ),
      ],
    );
  }
}

class PassengerControllers {
  PassengerControllers([PassengerDraft draft = const PassengerDraft()])
    : firstName = TextEditingController(text: draft.firstName),
      lastName = TextEditingController(text: draft.lastName),
      email = TextEditingController(text: draft.email),
      phone = TextEditingController(text: draft.phone);

  final TextEditingController firstName;
  final TextEditingController lastName;
  final TextEditingController email;
  final TextEditingController phone;

  PassengerDraft get draft => PassengerDraft(
    firstName: firstName.text,
    lastName: lastName.text,
    email: email.text,
    phone: phone.text,
  );

  void dispose() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    phone.dispose();
  }
}
