import 'dart:typed_data';

import 'package:aris_admin/core/error/failure.dart';
import 'package:aris_admin/core/media/image_picker_service.dart';
import 'package:aris_admin/features/trips/domain/entities/cover_image.dart';
import 'package:aris_admin/features/trips/domain/entities/trip_status.dart';
import 'package:aris_admin/features/trips/presentation/cubit/trip_detail_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/trips_fakes.dart';

void main() {
  late MockGetTrip getTrip;
  late MockChangeTripStatus changeStatus;
  late MockSetTripCover setCover;
  late MockImagePickerService picker;

  setUpAll(registerTripsFallbacks);
  setUp(() {
    getTrip = MockGetTrip();
    changeStatus = MockChangeTripStatus();
    setCover = MockSetTripCover();
    picker = MockImagePickerService();
  });

  TripDetailCubit build() =>
      TripDetailCubit(getTrip, changeStatus, setCover, picker);

  final archived = testTrip.copyWith(status: TripStatus.archived);
  final withCover = testTrip.copyWith(coverUrl: 'https://cdn/new.jpg');

  blocTest<TripDetailCubit, TripDetailState>(
    'load emits the trip',
    setUp: () =>
        when(() => getTrip(any())).thenReturn(TaskEither.right(testTrip)),
    build: build,
    act: (cubit) => cubit.load(testTrip.id),
    expect: () => [
      const TripDetailState.loading(),
      TripDetailState.loaded(trip: testTrip),
    ],
  );

  blocTest<TripDetailCubit, TripDetailState>(
    'load failure',
    setUp: () =>
        when(() => getTrip(any()))
            .thenReturn(TaskEither.left(const Failure.notFound())),
    build: build,
    act: (cubit) => cubit.load('missing'),
    expect: () => [
      const TripDetailState.loading(),
      const TripDetailState.failure(Failure.notFound()),
    ],
  );

  blocTest<TripDetailCubit, TripDetailState>(
    'changeStatus shows busy then the updated trip',
    setUp: () =>
        when(() => changeStatus(any(), any()))
            .thenReturn(TaskEither.right(archived)),
    build: build,
    seed: () => TripDetailState.loaded(trip: testTrip),
    act: (cubit) => cubit.changeStatus(TripStatus.archived),
    expect: () => [
      TripDetailState.loaded(trip: testTrip, busy: true),
      TripDetailState.loaded(trip: archived),
    ],
  );

  blocTest<TripDetailCubit, TripDetailState>(
    'changeStatus failure keeps the trip and reports the error',
    setUp: () =>
        when(() => changeStatus(any(), any()))
            .thenReturn(TaskEither.left(const Failure.network())),
    build: build,
    seed: () => TripDetailState.loaded(trip: testTrip),
    act: (cubit) => cubit.changeStatus(TripStatus.archived),
    expect: () => [
      TripDetailState.loaded(trip: testTrip, busy: true),
      TripDetailState.loaded(
        trip: testTrip,
        actionFailure: const Failure.network(),
      ),
    ],
  );

  blocTest<TripDetailCubit, TripDetailState>(
    'actions are ignored while busy',
    build: build,
    seed: () => TripDetailState.loaded(trip: testTrip, busy: true),
    act: (cubit) async {
      await cubit.changeStatus(TripStatus.archived);
      await cubit.pickCover();
    },
    expect: () => <TripDetailState>[],
    verify: (_) {
      verifyZeroInteractions(changeStatus);
      verifyZeroInteractions(picker);
    },
  );

  blocTest<TripDetailCubit, TripDetailState>(
    'pickCover does nothing when the admin cancels',
    setUp: () =>
        when(() => picker.pickFromGallery()).thenAnswer((_) async => null),
    build: build,
    seed: () => TripDetailState.loaded(trip: testTrip),
    act: (cubit) => cubit.pickCover(),
    expect: () => <TripDetailState>[],
    verify: (_) => verifyZeroInteractions(setCover),
  );

  blocTest<TripDetailCubit, TripDetailState>(
    'pickCover uploads the picked image',
    setUp: () {
      when(() => picker.pickFromGallery()).thenAnswer(
        (_) async => PickedImage(
          bytes: Uint8List.fromList([9]),
          contentType: 'image/png',
        ),
      );
      when(() => setCover(any(), any()))
          .thenReturn(TaskEither.right(withCover));
    },
    build: build,
    seed: () => TripDetailState.loaded(trip: testTrip),
    act: (cubit) => cubit.pickCover(),
    expect: () => [
      TripDetailState.loaded(trip: testTrip, busy: true),
      TripDetailState.loaded(trip: withCover),
    ],
    verify: (_) {
      final image =
          verify(() => setCover(testTrip, captureAny())).captured.single
              as CoverImage;
      expect(image.contentType, 'image/png');
      expect(image.bytes, [9]);
    },
  );
}
