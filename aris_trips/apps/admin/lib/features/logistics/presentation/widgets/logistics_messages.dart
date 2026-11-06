import '../../domain/entities/flight_draft.dart';
import '../../domain/entities/itinerary_draft.dart';
import '../../domain/entities/lodging_draft.dart';

extension FlightDraftIssueUi on FlightDraftIssue {
  String get message => switch (this) {
    FlightDraftIssue.airlineRequired => 'Escribe la aerolínea.',
    FlightDraftIssue.flightNumberRequired => 'Escribe el número de vuelo.',
    FlightDraftIssue.originRequired => 'Escribe el origen.',
    FlightDraftIssue.destinationRequired => 'Escribe el destino.',
    FlightDraftIssue.departureRequired => 'Elige la salida.',
    FlightDraftIssue.arrivalRequired => 'Elige la llegada.',
    FlightDraftIssue.departureTzInvalid ||
    FlightDraftIssue.arrivalTzInvalid => 'Elige una zona horaria válida.',
    FlightDraftIssue.arrivalNotAfterDeparture =>
      'La llegada debe ser después de la salida (revisa las zonas).',
  };
}

extension LodgingDraftIssueUi on LodgingDraftIssue {
  String get message => switch (this) {
    LodgingDraftIssue.nameRequired => 'Escribe el nombre del hospedaje.',
    LodgingDraftIssue.checkInRequired => 'Elige el check-in.',
    LodgingDraftIssue.checkOutRequired => 'Elige el check-out.',
    LodgingDraftIssue.timezoneInvalid => 'Elige una zona horaria válida.',
    LodgingDraftIssue.checkOutNotAfterCheckIn =>
      'El check-out debe ser después del check-in.',
    LodgingDraftIssue.latitudeInvalid => 'Latitud entre -90 y 90.',
    LodgingDraftIssue.longitudeInvalid => 'Longitud entre -180 y 180.',
    LodgingDraftIssue.coordinatesIncomplete =>
      'Escribe latitud y longitud, o deja ambas vacías.',
  };
}

extension ItineraryDraftIssueUi on ItineraryDraftIssue {
  String get message => switch (this) {
    ItineraryDraftIssue.titleRequired => 'Escribe el título.',
    ItineraryDraftIssue.startRequired => 'Elige el inicio.',
    ItineraryDraftIssue.timezoneInvalid => 'Elige una zona horaria válida.',
    ItineraryDraftIssue.endBeforeStart =>
      'El fin no puede ser antes del inicio.',
  };
}
