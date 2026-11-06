import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/error/failure.dart';
import '../datasources/auth_remote_data_source.dart';

/// Converts exceptions from Supabase Auth and PostgREST into [Failure].
/// Messages never include credentials or tokens.
Failure mapAuthException(Object error) {
  final failure = _map(error);
  if (kDebugMode &&
      (failure is ServerFailure || failure is UnexpectedFailure)) {
    // Diagnostics for debug builds only: exception type, code and server
    // message. Never log emails, passwords, tokens or codes.
    final (code, message) = switch (error) {
      AuthException(:final code, :final message) => (code, message),
      PostgrestException(:final code, :final message) => (code, message),
      _ => (null, null),
    };
    developer.log(
      '${error.runtimeType} code=$code message=$message',
      name: 'auth',
    );
  }
  return failure;
}

Failure _map(Object error) {
  return switch (error) {
    NotAdminException() => const Failure.notAdmin(),
    AuthRetryableFetchException() ||
    SocketException() ||
    TimeoutException() => const Failure.network(),
    AuthException(code: 'invalid_credentials') ||
    AuthException(
      message: 'Invalid login credentials',
    ) => const Failure.invalidCredentials(),
    AuthSessionMissingException() ||
    AuthException(statusCode: '401') => const Failure.unauthorized(),
    AuthException(:final message, :final code) => Failure.server(
      message: message,
      code: code,
    ),
    PostgrestException(:final message, :final code) => Failure.server(
      message: message,
      code: code,
    ),
    _ => Failure.unexpected(message: error.runtimeType.toString()),
  };
}
