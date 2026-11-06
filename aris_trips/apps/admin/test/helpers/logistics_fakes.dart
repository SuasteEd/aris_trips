import 'package:aris_admin/features/logistics/data/datasources/logistics_remote_data_source.dart';
import 'package:aris_admin/features/logistics/domain/entities/flight.dart';
import 'package:aris_admin/features/logistics/domain/entities/flight_draft.dart';
import 'package:aris_admin/features/logistics/domain/entities/itinerary_draft.dart';
import 'package:aris_admin/features/logistics/domain/entities/itinerary_item.dart';
import 'package:aris_admin/features/logistics/domain/entities/lodging.dart';
import 'package:aris_admin/features/logistics/domain/entities/lodging_draft.dart';
import 'package:aris_admin/features/logistics/domain/repositories/logistics_repositories.dart';
import 'package:aris_admin/features/logistics/domain/usecases/flight_usecases.dart';
import 'package:aris_admin/features/logistics/domain/usecases/itinerary_usecases.dart';
import 'package:aris_admin/features/logistics/domain/usecases/lodging_usecases.dart';
import 'package:aris_admin/features/logistics/presentation/cubit/item_form_cubit.dart';
import 'package:aris_admin/features/logistics/presentation/cubit/items_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

const tripId = '00000000-0000-4000-8000-000000000001';

/// MEX 08:00 (UTC-6) → CUN 11:15 (UTC-5): 2 h 15 min.
final testFlight = Flight(
  id: 'f1',
  tripId: tripId,
  airline: 'Aeroméxico',
  flightNumber: 'AM 523',
  origin: 'MEX',
  destination: 'CUN',
  departsAt: DateTime.utc(2027, 3, 20, 14),
  departureTz: 'America/Mexico_City',
  arrivesAt: DateTime.utc(2027, 3, 20, 16, 15),
  arrivalTz: 'America/Cancun',
  terminal: 'T2',
);

final testLodging = Lodging(
  id: 'l1',
  tripId: tripId,
  name: 'Hotel Laguna Azul',
  address: 'Blvd. Kukulcán km 12',
  latitude: 21.0945,
  longitude: -86.7673,
  checkInAt: DateTime.utc(2027, 3, 20, 20),
  checkOutAt: DateTime.utc(2027, 3, 25, 17),
  timezone: 'America/Cancun',
);

final testItem = ItineraryItem(
  id: 'i1',
  tripId: tripId,
  startsAt: DateTime.utc(2027, 3, 21, 14),
  endsAt: DateTime.utc(2027, 3, 21, 22),
  timezone: 'America/Cancun',
  title: 'Excursión a Isla Mujeres',
  location: 'Muelle Playa Langosta',
);

final validFlightDraft = FlightDraft(
  airline: 'Aeroméxico',
  flightNumber: 'am 523',
  origin: 'mex',
  destination: 'cun',
  departsLocal: DateTime(2027, 3, 20, 8),
  departureTz: 'America/Mexico_City',
  arrivesLocal: DateTime(2027, 3, 20, 11, 15),
  arrivalTz: 'America/Cancun',
);

final validLodgingDraft = LodgingDraft(
  name: 'Hotel Laguna Azul',
  checkInLocal: DateTime(2027, 3, 20, 15),
  checkOutLocal: DateTime(2027, 3, 25, 12),
  timezone: 'America/Cancun',
);

final validItineraryDraft = ItineraryDraft(
  title: 'Excursión',
  startsLocal: DateTime(2027, 3, 21, 9),
  timezone: 'America/Cancun',
);

class MockLogisticsRemoteDataSource extends Mock
    implements LogisticsRemoteDataSource {}

class MockFlightsRepository extends Mock implements FlightsRepository {}

class MockGetFlights extends Mock implements GetFlights {}

class MockDeleteFlight extends Mock implements DeleteFlight {}

class MockSaveFlight extends Mock implements SaveFlight {}

class MockGetLodgings extends Mock implements GetLodgings {}

class MockDeleteLodging extends Mock implements DeleteLodging {}

class MockSaveLodging extends Mock implements SaveLodging {}

class MockSaveItineraryItem extends Mock implements SaveItineraryItem {}

class MockFlightsCubit extends MockCubit<ItemsState<Flight>>
    implements FlightsCubit {}

class MockLodgingsCubit extends MockCubit<ItemsState<Lodging>>
    implements LodgingsCubit {}

class MockItineraryCubit extends MockCubit<ItemsState<ItineraryItem>>
    implements ItineraryCubit {}

class MockFlightFormCubit
    extends MockCubit<ItemFormState<Flight, FlightDraftIssue>>
    implements FlightFormCubit {}

class MockLodgingFormCubit
    extends MockCubit<ItemFormState<Lodging, LodgingDraftIssue>>
    implements LodgingFormCubit {}

class MockItineraryFormCubit
    extends MockCubit<ItemFormState<ItineraryItem, ItineraryDraftIssue>>
    implements ItineraryFormCubit {}

void registerLogisticsFallbacks() {
  registerFallbackValue(testFlight);
  registerFallbackValue(testLodging);
  registerFallbackValue(testItem);
  registerFallbackValue(validFlightDraft);
  registerFallbackValue(validLodgingDraft);
  registerFallbackValue(validItineraryDraft);
  registerFallbackValue(LogisticsTable.flights);
}
