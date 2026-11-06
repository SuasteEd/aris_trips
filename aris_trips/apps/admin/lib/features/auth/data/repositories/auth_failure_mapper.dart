import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/data/supabase_exception_mapper.dart';
import '../../../../core/error/failure.dart';
import '../datasources/auth_remote_data_source.dart';

/// Auth-specific cases first, then the shared Supabase mapping.
Failure mapAuthException(Object error) {
  return switch (error) {
    NotAdminException() => const Failure.notAdmin(),
    AuthException(code: 'invalid_credentials') ||
    AuthException(
      message: 'Invalid login credentials',
    ) => const Failure.invalidCredentials(),
    _ => mapSupabaseException(error, logName: 'auth'),
  };
}
