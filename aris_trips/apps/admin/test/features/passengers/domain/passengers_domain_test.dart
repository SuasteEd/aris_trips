import 'package:aris_admin/core/error/failure.dart';
import 'package:aris_admin/features/passengers/domain/entities/booking.dart';
import 'package:aris_admin/features/passengers/domain/entities/passenger_draft.dart';
import 'package:aris_admin/features/passengers/domain/entities/passenger_import.dart';
import 'package:aris_admin/features/passengers/domain/services/import_preview_builder.dart';
import 'package:aris_admin/features/passengers/domain/usecases/assignment_usecases.dart';
import 'package:aris_admin/features/passengers/domain/usecases/passenger_usecases.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/passengers_fakes.dart';

void main() {
  setUpAll(registerPassengersFallbacks);

  group('PassengerDraft', () {
    test('requires names and validates email only when given', () {
      expect(const PassengerDraft().issues, {
        PassengerDraftIssue.firstNameRequired,
        PassengerDraftIssue.lastNameRequired,
      });
      expect(
        const PassengerDraft(firstName: 'A', lastName: 'B', email: 'x@').issues,
        {PassengerDraftIssue.emailInvalid},
      );
      expect(
        const PassengerDraft(firstName: 'A', lastName: 'B').isValid,
        isTrue,
      );
    });

    test('normalizes spaces and email case', () {
      final draft = const PassengerDraft(
        firstName: '  Ana   María ',
        lastName: 'López',
        email: ' ANA@Example.com ',
      ).normalized();
      expect(draft.firstName, 'Ana María');
      expect(draft.email, 'ana@example.com');
    });

    test('identity ignores case and accents', () {
      expect(
        const PassengerDraft(
          firstName: 'ana',
          lastName: 'LOPEZ',
          email: 'Ana@example.com',
        ).identityKey,
        ana.toDraft().identityKey,
      );
    });
  });

  group('Booking', () {
    test('search by name or email without accents', () {
      expect(anaBooking.matches('lopez'), isTrue);
      expect(anaBooking.matches('ANA@'), isTrue);
      expect(anaBooking.matches('luis'), isFalse);
      expect(anaBooking.matches('  '), isTrue);
    });

    test('knows its assignments', () {
      expect(anaBooking.hasFlight('f1'), isTrue);
      expect(anaBooking.hasLodging('l2'), isFalse);
    });
  });

  group('ImportPreviewBuilder', () {
    test('maps Spanish and English headers in any order', () {
      final preview = ImportPreviewBuilder.build([
        ['Phone', 'Apellido', 'NOMBRE', 'Correo electrónico'],
        ['555', 'Lara', 'Rita', 'rita@example.com'],
      ], existing: const []);
      expect(preview.missingColumns, isEmpty);
      final draft = preview.rows.single.draft;
      expect(draft.firstName, 'Rita');
      expect(draft.lastName, 'Lara');
      expect(draft.email, 'rita@example.com');
      expect(draft.phone, '555');
      expect(preview.rows.single.line, 2);
    });

    test('reports missing required columns', () {
      final preview = ImportPreviewBuilder.build([
        ['nombre', 'correo'],
        ['Ana', 'a@b.mx'],
      ], existing: const []);
      expect(preview.missingColumns, {ImportColumn.lastName});
      expect(preview.canImport, isFalse);
    });

    test('flags errors per row and skips blank lines', () {
      final preview = ImportPreviewBuilder.build(
        [
          ['nombre', 'apellido', 'correo'],
          ['Luis', 'Pérez', 'luis@example.com'],
          ['', 'SinNombre', ''],
          [' ', ' ', ' '],
          ['Mal', 'Correo', 'no-es-correo'],
          ['LUIS', 'perez', 'Luis@Example.com'],
          ['Ana', 'Lopez', 'ana@example.com'],
          ['Juan', 'Sin Correo', ''],
        ],
        existing: const [anaBooking],
      );

      final issues = {for (final r in preview.rows) r.line: r.issues};
      expect(issues, {
        2: <ImportIssue>{},
        3: {ImportIssue.firstNameRequired},
        5: {ImportIssue.emailInvalid},
        6: {ImportIssue.duplicateInFile},
        7: {ImportIssue.alreadyInTrip},
        8: <ImportIssue>{},
      });
      expect(preview.validRows.length, 2);
      expect(preview.invalidCount, 4);
      expect(preview.canImport, isTrue);
    });

    test('an empty file misses the required columns', () {
      expect(
        ImportPreviewBuilder.build(const [], existing: const []).missingColumns,
        ImportPreviewBuilder.required,
      );
    });
  });

  group('use cases', () {
    late MockPassengersRepository passengers;
    late MockAssignmentsRepository assignments;

    setUp(() {
      passengers = MockPassengersRepository();
      assignments = MockAssignmentsRepository();
    });

    test('ImportPassengers sends only valid rows', () async {
      when(
        () => passengers.addPassengers(any(), any()),
      ).thenReturn(TaskEither.right(const ImportResult(created: 1, reused: 0)));
      final preview = ImportPreviewBuilder.build([
        ['nombre', 'apellido'],
        ['Rita', 'Lara'],
        ['', 'X'],
      ], existing: const []);

      await ImportPassengers(passengers)('t1', preview).run();

      verify(
        () => passengers.addPassengers('t1', [
          const PassengerDraft(firstName: 'Rita', lastName: 'Lara'),
        ]),
      ).called(1);
    });

    test('ImportPassengers refuses a preview without valid rows', () async {
      final result = await ImportPassengers(passengers)(
        't1',
        const ImportPreview(),
      ).run();
      expect(result, left<Failure, ImportResult>(const Failure.invalidInput()));
    });

    test('AddNewPassenger validates and normalizes', () async {
      when(
        () => passengers.addPassengers(any(), any()),
      ).thenReturn(TaskEither.right(const ImportResult(created: 0, reused: 1)));

      final invalid = await AddNewPassenger(passengers)(
        't1',
        const PassengerDraft(firstName: 'A'),
      ).run();
      expect(invalid.isLeft(), isTrue);

      await AddNewPassenger(passengers)(
        't1',
        const PassengerDraft(
          firstName: ' Ana ',
          lastName: 'López',
          email: 'ANA@example.com',
        ),
      ).run();
      verify(
        () => passengers.addPassengers('t1', [
          const PassengerDraft(
            firstName: 'Ana',
            lastName: 'López',
            email: 'ana@example.com',
          ),
        ]),
      ).called(1);
    });

    test('SearchPassengers skips queries under 2 characters', () async {
      final result = await SearchPassengers(passengers)(' a ').run();
      expect(result.getOrElse((_) => [ana]), isEmpty);
      verifyZeroInteractions(passengers);
    });

    test('UpdateBooking stores blank notes as null', () async {
      when(
        () => passengers.updateBooking(
          any(),
          status: any(named: 'status'),
          notes: any(named: 'notes'),
        ),
      ).thenReturn(TaskEither.right(unit));

      await UpdateBooking(passengers)(
        'b1',
        status: BookingStatus.cancelled,
        notes: '   ',
      ).run();

      verify(
        () => passengers.updateBooking(
          'b1',
          status: BookingStatus.cancelled,
          notes: null,
        ),
      ).called(1);
    });

    test('SaveFlightAssignment creates or updates with clean values', () async {
      when(
        () => assignments.assignFlight(
          bookingId: any(named: 'bookingId'),
          flightId: any(named: 'flightId'),
          seat: any(named: 'seat'),
          recordLocator: any(named: 'recordLocator'),
        ),
      ).thenReturn(TaskEither.right(unit));
      when(
        () => assignments.updateFlightAssignment(
          any(),
          seat: any(named: 'seat'),
          recordLocator: any(named: 'recordLocator'),
        ),
      ).thenReturn(TaskEither.right(unit));
      final save = SaveFlightAssignment(assignments);

      await save(
        bookingId: 'b1',
        flightId: 'f1',
        seat: ' 12a ',
        recordLocator: ' ',
      ).run();
      verify(
        () => assignments.assignFlight(
          bookingId: 'b1',
          flightId: 'f1',
          seat: '12A',
          recordLocator: null,
        ),
      ).called(1);

      await save(
        bookingId: 'b1',
        flightId: 'f1',
        assignmentId: 'fa1',
        seat: '3c',
      ).run();
      verify(
        () => assignments.updateFlightAssignment(
          'fa1',
          seat: '3C',
          recordLocator: null,
        ),
      ).called(1);
    });

    test('BulkAssign skips bookings that already have it', () async {
      when(() => assignments.bulkAssignFlight(any(), any()))
          .thenReturn(TaskEither.right(1));

      final result = await BulkAssign(assignments)(
        target: BulkTarget.flight,
        targetId: 'f1',
        bookings: const [anaBooking, luisBooking],
      ).run();

      expect(result, right<Failure, int>(1));
      verify(() => assignments.bulkAssignFlight('f1', ['b2'])).called(1);
    });

    test(
      'BulkAssign without pending bookings does not call the server',
      () async {
        final result = await BulkAssign(assignments)(
          target: BulkTarget.lodging,
          targetId: 'l1',
          bookings: const [anaBooking],
        ).run();

        expect(result, right<Failure, int>(0));
        verifyZeroInteractions(assignments);
      },
    );
  });
}
