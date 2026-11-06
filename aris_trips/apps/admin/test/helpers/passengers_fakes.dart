import 'package:aris_admin/core/media/file_picker_service.dart';
import 'package:aris_admin/features/passengers/data/datasources/passengers_remote_data_source.dart';
import 'package:aris_admin/features/passengers/domain/entities/booking.dart';
import 'package:aris_admin/features/passengers/domain/entities/passenger.dart';
import 'package:aris_admin/features/passengers/domain/entities/passenger_draft.dart';
import 'package:aris_admin/features/passengers/domain/entities/passenger_import.dart';
import 'package:aris_admin/features/passengers/domain/repositories/passengers_repositories.dart';
import 'package:aris_admin/features/passengers/domain/usecases/assignment_usecases.dart';
import 'package:aris_admin/features/passengers/domain/usecases/passenger_usecases.dart';
import 'package:aris_admin/features/passengers/presentation/cubit/add_passenger_cubit.dart';
import 'package:aris_admin/features/passengers/presentation/cubit/booking_cubit.dart';
import 'package:aris_admin/features/passengers/presentation/cubit/bookings_cubit.dart';
import 'package:aris_admin/features/passengers/presentation/cubit/bulk_assign_cubit.dart';
import 'package:aris_admin/features/passengers/presentation/cubit/import_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

import 'logistics_fakes.dart';

const ana = Passenger(
  id: 'p1',
  firstName: 'Ana',
  lastName: 'López',
  email: 'ana@example.com',
  phone: '+525511111111',
);

const luis = Passenger(id: 'p2', firstName: 'Luis', lastName: 'Martínez');

const anaBooking = Booking(
  id: 'b1',
  tripId: tripId,
  passenger: ana,
  status: BookingStatus.confirmed,
  notes: 'Vegetariana',
  flightAssignments: [
    FlightAssignment(
      id: 'fa1',
      bookingId: 'b1',
      flightId: 'f1',
      seat: '12A',
      recordLocator: 'QWERTY',
    ),
  ],
  lodgingAssignments: [
    LodgingAssignment(
      id: 'la1',
      bookingId: 'b1',
      lodgingId: 'l1',
      room: '1204',
    ),
  ],
);

const luisBooking = Booking(
  id: 'b2',
  tripId: tripId,
  passenger: luis,
  status: BookingStatus.pending,
);

class MockPassengersRemoteDataSource extends Mock
    implements PassengersRemoteDataSource {}

class MockPassengersRepository extends Mock implements PassengersRepository {}

class MockAssignmentsRepository extends Mock implements AssignmentsRepository {}

class MockGetBookings extends Mock implements GetBookings {}

class MockGetBooking extends Mock implements GetBooking {}

class MockRemoveBooking extends Mock implements RemoveBooking {}

class MockSearchPassengers extends Mock implements SearchPassengers {}

class MockAddNewPassenger extends Mock implements AddNewPassenger {}

class MockAddExistingPassenger extends Mock implements AddExistingPassenger {}

class MockImportPassengers extends Mock implements ImportPassengers {}

class MockUpdatePassenger extends Mock implements UpdatePassenger {}

class MockUpdateBooking extends Mock implements UpdateBooking {}

class MockSaveFlightAssignment extends Mock implements SaveFlightAssignment {}

class MockSaveLodgingAssignment extends Mock implements SaveLodgingAssignment {}

class MockRemoveAssignment extends Mock implements RemoveAssignment {}

class MockBulkAssign extends Mock implements BulkAssign {}

class MockFilePickerService extends Mock implements FilePickerService {}

class MockBookingsCubit extends MockCubit<ItemsState<Booking>>
    implements BookingsCubit {}

class MockAddPassengerCubit extends MockCubit<AddPassengerState>
    implements AddPassengerCubit {}

class MockBookingCubit extends MockCubit<BookingState>
    implements BookingCubit {}

class MockBulkAssignCubit extends MockCubit<BulkAssignState>
    implements BulkAssignCubit {}

class MockImportCubit extends MockCubit<ImportState> implements ImportCubit {}

void registerPassengersFallbacks() {
  registerFallbackValue(const PassengerDraft());
  registerFallbackValue(anaBooking);
  registerFallbackValue(ana);
  registerFallbackValue(BookingStatus.pending);
  registerFallbackValue(BulkTarget.flight);
  registerFallbackValue(const ImportPreview());
  registerFallbackValue(anaBooking.flightAssignments.first);
  registerFallbackValue(anaBooking.lodgingAssignments.first);
}
