import 'dart:typed_data';

import 'package:aris_admin/core/media/image_picker_service.dart';
import 'package:aris_admin/features/trips/data/datasources/trips_remote_data_source.dart';
import 'package:aris_admin/features/trips/domain/entities/cover_image.dart';
import 'package:aris_admin/features/trips/domain/entities/trip.dart';
import 'package:aris_admin/features/trips/domain/entities/trip_draft.dart';
import 'package:aris_admin/features/trips/domain/entities/trip_status.dart';
import 'package:aris_admin/features/trips/domain/entities/trips_query.dart';
import 'package:aris_admin/features/trips/domain/repositories/trips_repository.dart';
import 'package:aris_admin/features/trips/domain/usecases/change_trip_status.dart';
import 'package:aris_admin/features/trips/domain/usecases/get_trip.dart';
import 'package:aris_admin/features/trips/domain/usecases/get_trips.dart';
import 'package:aris_admin/features/trips/domain/usecases/save_trip.dart';
import 'package:aris_admin/features/trips/domain/usecases/set_trip_cover.dart';
import 'package:aris_admin/features/trips/presentation/cubit/trip_detail_cubit.dart';
import 'package:aris_admin/features/trips/presentation/cubit/trip_form_cubit.dart';
import 'package:aris_admin/features/trips/presentation/cubit/trips_list_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

final testTrip = Trip(
  id: '00000000-0000-4000-8000-000000000001',
  name: 'Cancún Primavera 2027',
  destination: 'Cancún, Quintana Roo',
  description: 'Cinco noches con traslados.',
  startDate: DateTime(2027, 3, 20),
  endDate: DateTime(2027, 3, 25),
  status: TripStatus.published,
);

final otherTrip = Trip(
  id: '00000000-0000-4000-8000-000000000002',
  name: 'Oaxaca Muertos',
  destination: 'Oaxaca, Oaxaca',
  startDate: DateTime(2027, 10, 30),
  endDate: DateTime(2027, 11, 2),
  status: TripStatus.draft,
);

final validDraft = TripDraft(
  name: 'Mérida',
  destination: 'Mérida, Yucatán',
  startDate: DateTime(2027, 1, 10),
  endDate: DateTime(2027, 1, 15),
);

final testImage = CoverImage(
  bytes: Uint8List.fromList([1, 2, 3]),
  contentType: 'image/jpeg',
);

class MockTripsRepository extends Mock implements TripsRepository {}

class MockTripsRemoteDataSource extends Mock implements TripsRemoteDataSource {}

class MockGetTrips extends Mock implements GetTrips {}

class MockGetTrip extends Mock implements GetTrip {}

class MockSaveTrip extends Mock implements SaveTrip {}

class MockChangeTripStatus extends Mock implements ChangeTripStatus {}

class MockSetTripCover extends Mock implements SetTripCover {}

class MockImagePickerService extends Mock implements ImagePickerService {}

class MockTripsListCubit extends MockCubit<TripsListState>
    implements TripsListCubit {}

class MockTripDetailCubit extends MockCubit<TripDetailState>
    implements TripDetailCubit {}

class MockTripFormCubit extends MockCubit<TripFormState>
    implements TripFormCubit {}

void registerTripsFallbacks() {
  registerFallbackValue(const TripsQuery());
  registerFallbackValue(validDraft);
  registerFallbackValue(testTrip);
  registerFallbackValue(testImage);
  registerFallbackValue(TripStatus.draft);
}
