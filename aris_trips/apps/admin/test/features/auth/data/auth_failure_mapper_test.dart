import 'dart:async';
import 'dart:io';

import 'package:aris_admin/core/error/failure.dart';
import 'package:aris_admin/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:aris_admin/features/auth/data/repositories/auth_failure_mapper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  final cases = <String, (Object, Failure)>{
    'not admin': (const NotAdminException(), const Failure.notAdmin()),
    'invalid credentials code': (
      const AuthApiException(
        'Invalid login credentials',
        statusCode: '400',
        code: 'invalid_credentials',
      ),
      const Failure.invalidCredentials(),
    ),
    'invalid credentials message': (
      const AuthException('Invalid login credentials'),
      const Failure.invalidCredentials(),
    ),
    'retryable fetch': (
      AuthRetryableFetchException(message: 'offline'),
      const Failure.network(),
    ),
    'socket': (const SocketException('offline'), const Failure.network()),
    'timeout': (TimeoutException('slow'), const Failure.network()),
    'missing session': (
      AuthSessionMissingException(),
      const Failure.unauthorized(),
    ),
    'unconfirmed email stays a server error': (
      const AuthApiException(
        'Email not confirmed',
        statusCode: '400',
        code: 'email_not_confirmed',
      ),
      const Failure.server(
        message: 'Email not confirmed',
        code: 'email_not_confirmed',
      ),
    ),
    'postgrest': (
      const PostgrestException(message: 'boom', code: '500'),
      const Failure.server(message: 'boom', code: '500'),
    ),
    'unknown': (
      StateError('x'),
      const Failure.unexpected(message: 'StateError'),
    ),
  };

  for (final MapEntry(key: name, value: (error, expected)) in cases.entries) {
    test('maps $name', () => expect(mapAuthException(error), expected));
  }
}
