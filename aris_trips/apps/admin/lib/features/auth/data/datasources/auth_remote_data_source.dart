import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/entities/admin_user.dart';
import '../models/admin_model.dart';

/// Thrown when a valid account has no row in `admins`.
class NotAdminException implements Exception {
  const NotAdminException();
}

abstract interface class AuthRemoteDataSource {
  Future<AdminUser> signIn({required String email, required String password});

  Future<void> signOut();

  /// Null when there is no session or the user is not an admin.
  Future<AdminUser?> currentAdmin();

  Stream<void> signedOutChanges();
}

@LazySingleton(as: AuthRemoteDataSource)
class SupabaseAuthRemoteDataSource implements AuthRemoteDataSource {
  const SupabaseAuthRemoteDataSource(this._client);

  final SupabaseClient _client;

  @override
  Future<AdminUser> signIn({
    required String email,
    required String password,
  }) async {
    final response = await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
    final user = response.user;
    if (user == null) {
      throw const AuthException('Sign in returned no user');
    }

    final admin = await _fetchAdmin(user);
    if (admin == null) {
      await _client.auth.signOut();
      throw const NotAdminException();
    }
    return admin;
  }

  @override
  Future<void> signOut() => _client.auth.signOut();

  @override
  Future<AdminUser?> currentAdmin() async {
    final user = _client.auth.currentUser;
    if (_client.auth.currentSession == null || user == null) return null;

    final admin = await _fetchAdmin(user);
    if (admin == null) {
      // Access was removed while the session was stored on the device.
      await _client.auth.signOut();
    }
    return admin;
  }

  @override
  Stream<void> signedOutChanges() => _client.auth.onAuthStateChange.where(
    (state) => state.event == AuthChangeEvent.signedOut,
  );

  /// RLS only returns the row to an admin, so a non-admin gets null.
  Future<AdminUser?> _fetchAdmin(User user) async {
    final row = await _client
        .from('admins')
        .select(AdminModel.columns)
        .eq('user_id', user.id)
        .maybeSingle();
    if (row == null) return null;
    return AdminModel.fromJson(row).toEntity(email: user.email ?? '');
  }
}
