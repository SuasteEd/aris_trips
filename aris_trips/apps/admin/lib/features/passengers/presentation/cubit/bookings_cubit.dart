import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/presentation/items_cubit.dart';
import '../../domain/entities/booking.dart';
import '../../domain/usecases/passenger_usecases.dart';

export '../../../../core/presentation/items_cubit.dart';

/// Bookings (passengers) of one trip.
@injectable
class BookingsCubit extends ItemsCubit<Booking> {
  BookingsCubit(this._get, this._remove);

  final GetBookings _get;
  final RemoveBooking _remove;

  @override
  TaskEither<Failure, List<Booking>> fetch(String tripId) => _get(tripId);

  @override
  TaskEither<Failure, Unit> remove(Booking item) => _remove(item.id);

  @override
  String idOf(Booking item) => item.id;

  List<Booking> get bookings => switch (state) {
    ItemsLoaded(:final items) => items,
    _ => const [],
  };

  /// Booking id → passenger name, for per-passenger itinerary items.
  Map<String, String> get audience => {
    for (final booking in bookings) booking.id: booking.passenger.fullName,
  };
}
