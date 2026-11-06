import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_user.freezed.dart';

/// A signed-in member of the agency staff.
@freezed
abstract class AdminUser with _$AdminUser {
  const factory AdminUser({
    required String id,
    required String email,
    required String fullName,
  }) = _AdminUser;
}
