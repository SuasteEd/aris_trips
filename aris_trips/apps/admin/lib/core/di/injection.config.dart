// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:aris_admin/core/di/supabase_module.dart' as _i761;
import 'package:aris_admin/core/media/image_picker_service.dart' as _i1043;
import 'package:aris_admin/features/auth/data/datasources/auth_remote_data_source.dart'
    as _i860;
import 'package:aris_admin/features/auth/data/repositories/auth_repository_impl.dart'
    as _i614;
import 'package:aris_admin/features/auth/domain/repositories/auth_repository.dart'
    as _i616;
import 'package:aris_admin/features/auth/domain/usecases/get_current_admin.dart'
    as _i233;
import 'package:aris_admin/features/auth/domain/usecases/sign_in.dart'
    as _i1051;
import 'package:aris_admin/features/auth/domain/usecases/sign_out.dart'
    as _i465;
import 'package:aris_admin/features/auth/domain/usecases/watch_signed_out.dart'
    as _i111;
import 'package:aris_admin/features/auth/presentation/cubit/login_cubit.dart'
    as _i649;
import 'package:aris_admin/features/auth/presentation/cubit/session_cubit.dart'
    as _i893;
import 'package:aris_admin/features/logistics/data/datasources/logistics_remote_data_source.dart'
    as _i61;
import 'package:aris_admin/features/logistics/data/repositories/logistics_repositories_impl.dart'
    as _i835;
import 'package:aris_admin/features/logistics/domain/repositories/logistics_repositories.dart'
    as _i139;
import 'package:aris_admin/features/logistics/domain/usecases/flight_usecases.dart'
    as _i262;
import 'package:aris_admin/features/logistics/domain/usecases/itinerary_usecases.dart'
    as _i1038;
import 'package:aris_admin/features/logistics/domain/usecases/lodging_usecases.dart'
    as _i400;
import 'package:aris_admin/features/logistics/presentation/cubit/item_form_cubit.dart'
    as _i967;
import 'package:aris_admin/features/logistics/presentation/cubit/items_cubit.dart'
    as _i297;
import 'package:aris_admin/features/passengers/data/datasources/passengers_remote_data_source.dart'
    as _i931;
import 'package:aris_admin/features/passengers/data/repositories/passengers_repositories_impl.dart'
    as _i548;
import 'package:aris_admin/features/passengers/domain/repositories/passengers_repositories.dart'
    as _i591;
import 'package:aris_admin/features/passengers/domain/usecases/assignment_usecases.dart'
    as _i395;
import 'package:aris_admin/features/passengers/domain/usecases/passenger_usecases.dart'
    as _i328;
import 'package:aris_admin/features/trips/data/datasources/trips_remote_data_source.dart'
    as _i78;
import 'package:aris_admin/features/trips/data/repositories/trips_repository_impl.dart'
    as _i865;
import 'package:aris_admin/features/trips/domain/repositories/trips_repository.dart'
    as _i182;
import 'package:aris_admin/features/trips/domain/usecases/change_trip_status.dart'
    as _i687;
import 'package:aris_admin/features/trips/domain/usecases/get_trip.dart'
    as _i668;
import 'package:aris_admin/features/trips/domain/usecases/get_trips.dart'
    as _i651;
import 'package:aris_admin/features/trips/domain/usecases/save_trip.dart'
    as _i264;
import 'package:aris_admin/features/trips/domain/usecases/set_trip_cover.dart'
    as _i622;
import 'package:aris_admin/features/trips/presentation/cubit/trip_detail_cubit.dart'
    as _i645;
import 'package:aris_admin/features/trips/presentation/cubit/trip_form_cubit.dart'
    as _i428;
import 'package:aris_admin/features/trips/presentation/cubit/trips_list_cubit.dart'
    as _i713;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final supabaseModule = _$SupabaseModule();
    gh.factory<_i328.BuildImportPreview>(
      () => const _i328.BuildImportPreview(),
    );
    gh.lazySingleton<_i454.SupabaseClient>(() => supabaseModule.client);
    gh.lazySingleton<_i1043.ImagePickerService>(
      () => _i1043.DeviceImagePickerService(),
    );
    gh.lazySingleton<_i78.TripsRemoteDataSource>(
      () => _i78.SupabaseTripsRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i860.AuthRemoteDataSource>(
      () => _i860.SupabaseAuthRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i61.LogisticsRemoteDataSource>(
      () => _i61.SupabaseLogisticsRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i931.PassengersRemoteDataSource>(
      () =>
          _i931.SupabasePassengersRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i616.AuthRepository>(
      () => _i614.AuthRepositoryImpl(gh<_i860.AuthRemoteDataSource>()),
    );
    gh.factory<_i233.GetCurrentAdmin>(
      () => _i233.GetCurrentAdmin(gh<_i616.AuthRepository>()),
    );
    gh.factory<_i1051.SignIn>(() => _i1051.SignIn(gh<_i616.AuthRepository>()));
    gh.factory<_i465.SignOut>(() => _i465.SignOut(gh<_i616.AuthRepository>()));
    gh.factory<_i111.WatchSignedOut>(
      () => _i111.WatchSignedOut(gh<_i616.AuthRepository>()),
    );
    gh.lazySingleton<_i139.FlightsRepository>(
      () => _i835.FlightsRepositoryImpl(gh<_i61.LogisticsRemoteDataSource>()),
    );
    gh.factory<_i262.GetFlights>(
      () => _i262.GetFlights(gh<_i139.FlightsRepository>()),
    );
    gh.factory<_i262.SaveFlight>(
      () => _i262.SaveFlight(gh<_i139.FlightsRepository>()),
    );
    gh.factory<_i262.DeleteFlight>(
      () => _i262.DeleteFlight(gh<_i139.FlightsRepository>()),
    );
    gh.lazySingleton<_i139.LodgingsRepository>(
      () => _i835.LodgingsRepositoryImpl(gh<_i61.LogisticsRemoteDataSource>()),
    );
    gh.lazySingleton<_i139.ItineraryRepository>(
      () => _i835.ItineraryRepositoryImpl(gh<_i61.LogisticsRemoteDataSource>()),
    );
    gh.factory<_i967.FlightFormCubit>(
      () => _i967.FlightFormCubit(gh<_i262.SaveFlight>()),
    );
    gh.lazySingleton<_i182.TripsRepository>(
      () => _i865.TripsRepositoryImpl(gh<_i78.TripsRemoteDataSource>()),
    );
    gh.lazySingleton<_i893.SessionCubit>(
      () => _i893.SessionCubit(
        gh<_i233.GetCurrentAdmin>(),
        gh<_i465.SignOut>(),
        gh<_i111.WatchSignedOut>(),
      ),
    );
    gh.lazySingleton<_i591.PassengersRepository>(
      () => _i548.PassengersRepositoryImpl(
        gh<_i931.PassengersRemoteDataSource>(),
      ),
    );
    gh.factory<_i400.GetLodgings>(
      () => _i400.GetLodgings(gh<_i139.LodgingsRepository>()),
    );
    gh.factory<_i400.SaveLodging>(
      () => _i400.SaveLodging(gh<_i139.LodgingsRepository>()),
    );
    gh.factory<_i400.DeleteLodging>(
      () => _i400.DeleteLodging(gh<_i139.LodgingsRepository>()),
    );
    gh.factory<_i297.FlightsCubit>(
      () =>
          _i297.FlightsCubit(gh<_i262.GetFlights>(), gh<_i262.DeleteFlight>()),
    );
    gh.lazySingleton<_i591.AssignmentsRepository>(
      () => _i548.AssignmentsRepositoryImpl(
        gh<_i931.PassengersRemoteDataSource>(),
      ),
    );
    gh.factory<_i328.GetBookings>(
      () => _i328.GetBookings(gh<_i591.PassengersRepository>()),
    );
    gh.factory<_i328.GetBooking>(
      () => _i328.GetBooking(gh<_i591.PassengersRepository>()),
    );
    gh.factory<_i328.SearchPassengers>(
      () => _i328.SearchPassengers(gh<_i591.PassengersRepository>()),
    );
    gh.factory<_i328.AddNewPassenger>(
      () => _i328.AddNewPassenger(gh<_i591.PassengersRepository>()),
    );
    gh.factory<_i328.AddExistingPassenger>(
      () => _i328.AddExistingPassenger(gh<_i591.PassengersRepository>()),
    );
    gh.factory<_i328.ImportPassengers>(
      () => _i328.ImportPassengers(gh<_i591.PassengersRepository>()),
    );
    gh.factory<_i328.UpdatePassenger>(
      () => _i328.UpdatePassenger(gh<_i591.PassengersRepository>()),
    );
    gh.factory<_i328.UpdateBooking>(
      () => _i328.UpdateBooking(gh<_i591.PassengersRepository>()),
    );
    gh.factory<_i328.RemoveBooking>(
      () => _i328.RemoveBooking(gh<_i591.PassengersRepository>()),
    );
    gh.factory<_i395.SaveFlightAssignment>(
      () => _i395.SaveFlightAssignment(gh<_i591.AssignmentsRepository>()),
    );
    gh.factory<_i395.SaveLodgingAssignment>(
      () => _i395.SaveLodgingAssignment(gh<_i591.AssignmentsRepository>()),
    );
    gh.factory<_i395.RemoveAssignment>(
      () => _i395.RemoveAssignment(gh<_i591.AssignmentsRepository>()),
    );
    gh.factory<_i395.BulkAssign>(
      () => _i395.BulkAssign(gh<_i591.AssignmentsRepository>()),
    );
    gh.factory<_i649.LoginCubit>(() => _i649.LoginCubit(gh<_i1051.SignIn>()));
    gh.factory<_i687.ChangeTripStatus>(
      () => _i687.ChangeTripStatus(gh<_i182.TripsRepository>()),
    );
    gh.factory<_i668.GetTrip>(() => _i668.GetTrip(gh<_i182.TripsRepository>()));
    gh.factory<_i651.GetTrips>(
      () => _i651.GetTrips(gh<_i182.TripsRepository>()),
    );
    gh.factory<_i264.SaveTrip>(
      () => _i264.SaveTrip(gh<_i182.TripsRepository>()),
    );
    gh.factory<_i622.SetTripCover>(
      () => _i622.SetTripCover(gh<_i182.TripsRepository>()),
    );
    gh.factory<_i1038.GetItinerary>(
      () => _i1038.GetItinerary(gh<_i139.ItineraryRepository>()),
    );
    gh.factory<_i1038.SaveItineraryItem>(
      () => _i1038.SaveItineraryItem(gh<_i139.ItineraryRepository>()),
    );
    gh.factory<_i1038.DeleteItineraryItem>(
      () => _i1038.DeleteItineraryItem(gh<_i139.ItineraryRepository>()),
    );
    gh.factory<_i297.LodgingsCubit>(
      () => _i297.LodgingsCubit(
        gh<_i400.GetLodgings>(),
        gh<_i400.DeleteLodging>(),
      ),
    );
    gh.factory<_i967.LodgingFormCubit>(
      () => _i967.LodgingFormCubit(gh<_i400.SaveLodging>()),
    );
    gh.factory<_i428.TripFormCubit>(
      () => _i428.TripFormCubit(gh<_i668.GetTrip>(), gh<_i264.SaveTrip>()),
    );
    gh.factory<_i297.ItineraryCubit>(
      () => _i297.ItineraryCubit(
        gh<_i1038.GetItinerary>(),
        gh<_i1038.DeleteItineraryItem>(),
      ),
    );
    gh.factory<_i645.TripDetailCubit>(
      () => _i645.TripDetailCubit(
        gh<_i668.GetTrip>(),
        gh<_i687.ChangeTripStatus>(),
        gh<_i622.SetTripCover>(),
        gh<_i1043.ImagePickerService>(),
      ),
    );
    gh.factory<_i713.TripsListCubit>(
      () => _i713.TripsListCubit(gh<_i651.GetTrips>()),
    );
    gh.factory<_i967.ItineraryFormCubit>(
      () => _i967.ItineraryFormCubit(gh<_i1038.SaveItineraryItem>()),
    );
    return this;
  }
}

class _$SupabaseModule extends _i761.SupabaseModule {}
