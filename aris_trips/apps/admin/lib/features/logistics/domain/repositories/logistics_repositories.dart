import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../entities/flight.dart';
import '../entities/flight_draft.dart';
import '../entities/itinerary_draft.dart';
import '../entities/itinerary_item.dart';
import '../entities/lodging.dart';
import '../entities/lodging_draft.dart';

/// Drafts reaching these repositories are already valid and normalized.

abstract interface class FlightsRepository {
  /// Ordered by departure.
  TaskEither<Failure, List<Flight>> getFlights(String tripId);

  TaskEither<Failure, Flight> createFlight(String tripId, FlightDraft draft);

  TaskEither<Failure, Flight> updateFlight(String id, FlightDraft draft);

  TaskEither<Failure, Unit> deleteFlight(String id);
}

abstract interface class LodgingsRepository {
  /// Ordered by check-in.
  TaskEither<Failure, List<Lodging>> getLodgings(String tripId);

  TaskEither<Failure, Lodging> createLodging(String tripId, LodgingDraft draft);

  TaskEither<Failure, Lodging> updateLodging(String id, LodgingDraft draft);

  TaskEither<Failure, Unit> deleteLodging(String id);
}

abstract interface class ItineraryRepository {
  /// Ordered by start.
  TaskEither<Failure, List<ItineraryItem>> getItinerary(String tripId);

  TaskEither<Failure, ItineraryItem> createItem(
    String tripId,
    ItineraryDraft draft,
  );

  TaskEither<Failure, ItineraryItem> updateItem(
    String id,
    ItineraryDraft draft,
  );

  TaskEither<Failure, Unit> deleteItem(String id);
}
