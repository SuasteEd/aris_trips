import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/trip.dart';
import '../../domain/entities/trip_draft.dart';
import '../../domain/entities/trip_status.dart';
import 'date_only_converter.dart';

part 'trip_model.freezed.dart';
part 'trip_model.g.dart';

/// Row of `public.trips`.
@freezed
abstract class TripModel with _$TripModel {
  const factory TripModel({
    required String id,
    required String name,
    required String destination,
    String? description,
    String? coverPath,
    @DateOnlyConverter() required DateTime startDate,
    @DateOnlyConverter() required DateTime endDate,
    required String status,
  }) = _TripModel;

  const TripModel._();

  factory TripModel.fromJson(Map<String, dynamic> json) =>
      _$TripModelFromJson(json);

  /// Columns read by the app.
  static const String columns =
      'id, name, destination, description, cover_path, start_date, end_date, status';

  /// Insert/update payload for the editable fields. The draft must be valid.
  static Map<String, dynamic> draftToJson(TripDraft draft) {
    assert(draft.isValid, 'Only valid drafts reach the data layer');
    const dates = DateOnlyConverter();
    return {
      'name': draft.name,
      'destination': draft.destination,
      'description': draft.description,
      'start_date': dates.toJson(draft.startDate!),
      'end_date': dates.toJson(draft.endDate!),
      'status': draft.status.value,
    };
  }

  Trip toEntity({String? coverUrl}) => Trip(
    id: id,
    name: name,
    destination: destination,
    description: description,
    coverPath: coverPath,
    coverUrl: coverUrl,
    startDate: startDate,
    endDate: endDate,
    status: TripStatus.fromValue(status),
  );
}
