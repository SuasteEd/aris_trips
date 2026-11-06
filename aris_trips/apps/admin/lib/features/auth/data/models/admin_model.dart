import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/admin_user.dart';

part 'admin_model.freezed.dart';
part 'admin_model.g.dart';

/// Row of `public.admins`.
@freezed
abstract class AdminModel with _$AdminModel {
  const factory AdminModel({required String userId, required String fullName}) =
      _AdminModel;

  const AdminModel._();

  factory AdminModel.fromJson(Map<String, dynamic> json) =>
      _$AdminModelFromJson(json);

  /// Columns read by the app.
  static const String columns = 'user_id, full_name';

  AdminUser toEntity({required String email}) =>
      AdminUser(id: userId, email: email, fullName: fullName);
}
