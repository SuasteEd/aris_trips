import 'dart:convert';
import 'dart:typed_data';

import 'package:aris_admin/core/error/failure.dart';
import 'package:aris_admin/core/media/file_picker_service.dart';
import 'package:aris_admin/features/logistics/domain/entities/itinerary_item.dart';
import 'package:aris_admin/features/logistics/domain/usecases/flight_usecases.dart';
import 'package:aris_admin/features/logistics/domain/usecases/itinerary_usecases.dart';
import 'package:aris_admin/features/logistics/domain/usecases/lodging_usecases.dart';
import 'package:aris_admin/features/passengers/domain/entities/booking.dart';
import 'package:aris_admin/features/passengers/domain/entities/passenger_draft.dart';
import 'package:aris_admin/features/passengers/domain/entities/passenger_import.dart';
import 'package:aris_admin/features/passengers/domain/usecases/assignment_usecases.dart';
import 'package:aris_admin/features/passengers/domain/usecases/passenger_usecases.dart';
import 'package:aris_admin/features/passengers/presentation/cubit/add_passenger_cubit.dart';
import 'package:aris_admin/features/passengers/presentation/cubit/booking_cubit.dart';
import 'package:aris_admin/features/passengers/presentation/cubit/bulk_assign_cubit.dart';
import 'package:aris_admin/features/passengers/presentation/cubit/import_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/logistics_fakes.dart';
import '../../../helpers/passengers_fakes.dart';

class _MockGetItinerary extends Mock implements GetItinerary {}

class _MockGetFlights extends Mock implements GetFlights {}

class _MockGetLodgings extends Mock implements GetLodgings {}

void main() {
  setUpAll(() {
    registerPassengersFallbacks();
    registerLogisticsFallbacks();
  });

  group('AddPassengerCubit', () {
    late MockSearchPassengers search;
    late MockAddNewPassenger addNew;
    late MockAddExistingPassenger addExisting;

    setUp(() {
      search = MockSearchPassengers();
      addNew = MockAddNewPassenger();
      addExisting = MockAddExistingPassenger();
    });

    AddPassengerCubit build() =>
        AddPassengerCubit(search, addNew, addExisting)
          ..configure(tripId: tripId, onTrip: {'p1'});

    blocTest<AddPassengerCubit, AddPassengerState>(
      'search is debounced and shows results',
      setUp: () =>
          when(() => search(any())).thenReturn(TaskEither.right([ana, luis])),
      build: build,
      act: (cubit) => cubit
        ..search('a')
        ..search('an'),
      wait: AddPassengerCubit.searchDebounce + const Duration(milliseconds: 50),
      expect: () => [
        const AddPassengerState(query: 'a'),
        const AddPassengerState(query: 'an'),
        const AddPassengerState(query: 'an', searching: true),
        const AddPassengerState(query: 'an', results: [ana, luis]),
      ],
      verify: (cubit) {
        verify(() => search('an')).called(1);
        expect(cubit.isOnTrip(ana), isTrue);
        expect(cubit.isOnTrip(luis), isFalse);
      },
    );

    blocTest<AddPassengerCubit, AddPassengerState>(
      'a passenger already on the trip cannot be added again',
      build: build,
      act: (cubit) => cubit.addExisting(ana),
      expect: () => <AddPassengerState>[],
      verify: (_) => verifyZeroInteractions(addExisting),
    );

    blocTest<AddPassengerCubit, AddPassengerState>(
      'adds an existing passenger',
      setUp: () =>
          when(() => addExisting(any(), any()))
              .thenReturn(TaskEither.right('b9')),
      build: build,
      act: (cubit) => cubit.addExisting(luis),
      expect: () => [
        const AddPassengerState(submitting: true),
        const AddPassengerState(added: true),
      ],
      verify: (_) => verify(() => addExisting(tripId, 'p2')).called(1),
    );

    blocTest<AddPassengerCubit, AddPassengerState>(
      'new passenger with issues is not sent',
      build: build,
      act: (cubit) => cubit.addNew(const PassengerDraft(firstName: 'X')),
      expect: () => [
        const AddPassengerState(issues: {PassengerDraftIssue.lastNameRequired}),
      ],
      verify: (_) => verifyZeroInteractions(addNew),
    );

    blocTest<AddPassengerCubit, AddPassengerState>(
      'new passenger reports when it was reused',
      setUp: () => when(
        () => addNew(any(), any()),
      ).thenReturn(TaskEither.right(const ImportResult(created: 0, reused: 1))),
      build: build,
      act: (cubit) => cubit.addNew(
        const PassengerDraft(firstName: 'Rita', lastName: 'Lara'),
      ),
      expect: () => [
        const AddPassengerState(submitting: true),
        const AddPassengerState(
          added: true,
          result: ImportResult(created: 0, reused: 1),
        ),
      ],
    );
  });

  group('BookingCubit', () {
    late MockGetBooking getBooking;
    late _MockGetFlights getFlights;
    late _MockGetLodgings getLodgings;
    late _MockGetItinerary getItinerary;
    late MockUpdatePassenger updatePassenger;
    late MockUpdateBooking updateBooking;
    late MockRemoveBooking removeBooking;
    late MockSaveFlightAssignment saveFlight;
    late MockSaveLodgingAssignment saveLodging;
    late MockRemoveAssignment removeAssignment;

    final ownItem = testItem.copyWith(id: 'i9', bookingId: 'b1');
    final otherItem = testItem.copyWith(id: 'i8', bookingId: 'b2');

    setUp(() {
      getBooking = MockGetBooking();
      getFlights = _MockGetFlights();
      getLodgings = _MockGetLodgings();
      getItinerary = _MockGetItinerary();
      updatePassenger = MockUpdatePassenger();
      updateBooking = MockUpdateBooking();
      removeBooking = MockRemoveBooking();
      saveFlight = MockSaveFlightAssignment();
      saveLodging = MockSaveLodgingAssignment();
      removeAssignment = MockRemoveAssignment();
      when(() => getBooking(any())).thenReturn(TaskEither.right(anaBooking));
      when(() => getFlights(any())).thenReturn(TaskEither.right([testFlight]));
      when(() => getLodgings(any()))
          .thenReturn(TaskEither.right([testLodging]));
      when(() => getItinerary(any())).thenReturn(
        TaskEither.right(<ItineraryItem>[testItem, ownItem, otherItem]),
      );
    });

    BookingCubit build() => BookingCubit(
      getBooking,
      getFlights,
      getLodgings,
      getItinerary,
      updatePassenger,
      updateBooking,
      removeBooking,
      saveFlight,
      saveLodging,
      removeAssignment,
    );

    final details = BookingDetails(
      booking: anaBooking,
      flights: [testFlight],
      lodgings: [testLodging],
      activities: [ownItem],
    );

    blocTest<BookingCubit, BookingState>(
      'load gathers the booking, trip logistics and own activities',
      build: build,
      act: (cubit) => cubit.load(tripId: tripId, bookingId: 'b1'),
      expect: () => [
        const BookingState.loading(),
        BookingState.loaded(details),
      ],
      verify: (cubit) {
        final loaded = cubit.state as BookingLoaded;
        expect(loaded.details.unassignedFlights, isEmpty);
        expect(loaded.details.flight('f1'), testFlight);
      },
    );

    blocTest<BookingCubit, BookingState>(
      'saving an assignment reloads the booking',
      setUp: () => when(
        () => saveFlight(
          bookingId: any(named: 'bookingId'),
          flightId: any(named: 'flightId'),
          assignmentId: any(named: 'assignmentId'),
          seat: any(named: 'seat'),
          recordLocator: any(named: 'recordLocator'),
        ),
      ).thenReturn(TaskEither.right(unit)),
      build: build,
      act: (cubit) async {
        await cubit.load(tripId: tripId, bookingId: 'b1');
        await cubit.saveFlightAssignment(
          flightId: 'f1',
          assignmentId: 'fa1',
          seat: '14C',
        );
      },
      skip: 2,
      expect: () => [
        BookingState.loaded(details, busy: true),
        BookingState.loaded(details),
      ],
      verify: (_) {
        verify(
          () => saveFlight(
            bookingId: 'b1',
            flightId: 'f1',
            assignmentId: 'fa1',
            seat: '14C',
          ),
        ).called(1);
        verify(() => getBooking('b1')).called(2);
      },
    );

    blocTest<BookingCubit, BookingState>(
      'a failed action keeps the data and reports',
      setUp: () => when(
        () => updateBooking(
          any(),
          status: any(named: 'status'),
          notes: any(named: 'notes'),
        ),
      ).thenReturn(TaskEither.left(const Failure.network())),
      build: build,
      seed: () => BookingState.loaded(details),
      act: (cubit) async {
        await cubit.load(tripId: tripId, bookingId: 'b1');
        await cubit.updateBooking(status: BookingStatus.cancelled, notes: '');
      },
      skip: 2,
      expect: () => [
        BookingState.loaded(details, busy: true),
        BookingState.loaded(details, actionFailure: const Failure.network()),
      ],
    );

    blocTest<BookingCubit, BookingState>(
      'removing from the trip ends in removed',
      setUp: () =>
          when(() => removeBooking(any())).thenReturn(TaskEither.right(unit)),
      build: build,
      seed: () => BookingState.loaded(details),
      act: (cubit) => cubit.removeFromTrip(),
      expect: () => [
        BookingState.loaded(details, busy: true),
        const BookingState.removed(),
      ],
      verify: (_) => verify(() => removeBooking('b1')).called(1),
    );
  });

  group('BulkAssignCubit', () {
    late MockGetBookings getBookings;
    late _MockGetFlights getFlights;
    late _MockGetLodgings getLodgings;
    late MockBulkAssign bulkAssign;

    const cancelled = Booking(
      id: 'b3',
      tripId: tripId,
      passenger: luis,
      status: BookingStatus.cancelled,
    );

    setUp(() {
      getBookings = MockGetBookings();
      getFlights = _MockGetFlights();
      getLodgings = _MockGetLodgings();
      bulkAssign = MockBulkAssign();
      when(() => getBookings(any())).thenReturn(
        TaskEither.right(const [anaBooking, luisBooking, cancelled]),
      );
      when(() => getFlights(any())).thenReturn(TaskEither.right([testFlight]));
      when(() => getLodgings(any()))
          .thenReturn(TaskEither.right([testLodging]));
    });

    BulkAssignCubit build() =>
        BulkAssignCubit(getBookings, getFlights, getLodgings, bulkAssign);

    test('choosing a flight preselects active bookings without it', () async {
      final cubit = build();
      await cubit.load(tripId);
      cubit.chooseTarget('f1');

      final state = cubit.state as BulkAssignReady;
      expect(state.selected, {'b2'});
      expect(state.alreadyAssigned(anaBooking), isTrue);
      expect(state.selectable.map((b) => b.id), ['b2', 'b3']);
      expect(state.canSubmit, isTrue);

      cubit.selectAll(true);
      expect((cubit.state as BulkAssignReady).selected, {'b2', 'b3'});
      cubit.toggle('b3');
      expect((cubit.state as BulkAssignReady).selected, {'b2'});
      cubit.setTarget(BulkTarget.lodging);
      expect((cubit.state as BulkAssignReady).targetId, isNull);
      await cubit.close();
    });

    test('submit assigns the selection and reports how many', () async {
      when(
        () => bulkAssign(
          target: any(named: 'target'),
          targetId: any(named: 'targetId'),
          bookings: any(named: 'bookings'),
        ),
      ).thenReturn(TaskEither.right(1));
      final cubit = build();
      await cubit.load(tripId);
      cubit.chooseTarget('f1');
      await cubit.submit();

      final state = cubit.state as BulkAssignReady;
      expect(state.added, 1);
      expect(state.targetId, 'f1');
      verify(
        () => bulkAssign(
          target: BulkTarget.flight,
          targetId: 'f1',
          bookings: const [luisBooking],
        ),
      ).called(1);
      await cubit.close();
    });
  });

  group('ImportCubit', () {
    late MockFilePickerService files;
    late MockGetBookings getBookings;
    late MockImportPassengers importPassengers;

    setUp(() {
      files = MockFilePickerService();
      getBookings = MockGetBookings();
      importPassengers = MockImportPassengers();
      when(() => getBookings(any()))
          .thenReturn(TaskEither.right(const [anaBooking]));
    });

    ImportCubit build() => ImportCubit(
      files,
      getBookings,
      const BuildImportPreview(),
      importPassengers,
    )..configure(tripId);

    void pick(String csv) =>
        when(() => files.pickCsv(maxBytes: any(named: 'maxBytes'))).thenAnswer(
          (_) async => PickedFile(
            name: 'p.csv',
            bytes: Uint8List.fromList(utf8.encode(csv)),
          ),
        );

    blocTest<ImportCubit, ImportState>(
      'reads the file and previews against the trip bookings',
      setUp: () => pick(
        'nombre;apellido;correo\nAna;López;ana@example.com\nRita;Lara;\n',
      ),
      build: build,
      act: (cubit) => cubit.pickFile(),
      expect: () => [
        const ImportState.reading(),
        isA<ImportPreviewing>()
            .having((s) => s.preview.validRows.length, 'valid', 1)
            .having((s) => s.preview.rows.first.issues, 'first row', {
              ImportIssue.alreadyInTrip,
            }),
      ],
    );

    blocTest<ImportCubit, ImportState>(
      'cancelling keeps the current screen',
      setUp: () =>
          when(() => files.pickCsv(maxBytes: any(named: 'maxBytes')))
              .thenAnswer((_) async => null),
      build: build,
      act: (cubit) => cubit.pickFile(),
      expect: () => [const ImportState.reading(), const ImportState.idle()],
    );

    blocTest<ImportCubit, ImportState>(
      'a file over 1 MB is rejected',
      setUp: () =>
          when(() => files.pickCsv(maxBytes: any(named: 'maxBytes')))
              .thenThrow(const FileTooLargeException()),
      build: build,
      act: (cubit) => cubit.pickFile(),
      expect: () => [
        const ImportState.reading(),
        const ImportState.idle(fileError: ImportFileError.tooLarge),
      ],
    );

    blocTest<ImportCubit, ImportState>(
      'submit imports and finishes',
      setUp: () {
        pick('nombre,apellido\nRita,Lara\n');
        when(() => importPassengers(any(), any())).thenReturn(
          TaskEither.right(const ImportResult(created: 1, reused: 0)),
        );
      },
      build: build,
      act: (cubit) async {
        await cubit.pickFile();
        await cubit.submit();
      },
      skip: 2,
      expect: () => [
        isA<ImportPreviewing>().having((s) => s.importing, 'importing', true),
        const ImportState.done(ImportResult(created: 1, reused: 0)),
      ],
    );

    blocTest<ImportCubit, ImportState>(
      'an import failure keeps the preview',
      setUp: () {
        pick('nombre,apellido\nRita,Lara\n');
        when(() => importPassengers(any(), any()))
            .thenReturn(TaskEither.left(const Failure.conflict()));
      },
      build: build,
      act: (cubit) async {
        await cubit.pickFile();
        await cubit.submit();
      },
      skip: 3,
      expect: () => [
        isA<ImportPreviewing>()
            .having((s) => s.importing, 'importing', false)
            .having((s) => s.failure, 'failure', const Failure.conflict()),
      ],
    );
  });
}
