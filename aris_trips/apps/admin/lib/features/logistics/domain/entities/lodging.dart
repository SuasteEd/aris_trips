import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/time/zoned_time.dart';
import 'lodging_draft.dart';

part 'lodging.freezed.dart';

@freezed
abstract class Lodging with _$Lodging {
  const factory Lodging({
    required String id,
    required String tripId,
    required String name,
    String? address,
    double? latitude,
    double? longitude,
    required DateTime checkInAt,
    required DateTime checkOutAt,
    required String timezone,
  }) = _Lodging;

  const Lodging._();

  LodgingDraft toDraft() => LodgingDraft(
    name: name,
    address: address ?? '',
    latitude: latitude?.toString() ?? '',
    longitude: longitude?.toString() ?? '',
    checkInLocal: ZonedTime.toWallTime(checkInAt, timezone),
    checkOutLocal: ZonedTime.toWallTime(checkOutAt, timezone),
    timezone: timezone,
  );
}
