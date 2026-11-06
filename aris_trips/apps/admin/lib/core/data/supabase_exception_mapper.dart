import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show ClientException;
import 'package:supabase_flutter/supabase_flutter.dart';

import '../error/failure.dart';

/// Converts exceptions from Supabase (Auth, PostgREST, Storage) and the
/// network into [Failure]. Used only by the data layer.
Failure mapSupabaseException(Object error, {String logName = 'data'}) {
  final failure = _map(error);
  if (kDebugMode &&
      (failure is ServerFailure || failure is UnexpectedFailure)) {
    // Debug builds only: exception type, code and server message. Never log
    // emails, passwords, tokens or access codes.
    final (code, message) = switch (error) {
      AuthException(:final code, :final message) => (code, message),
      PostgrestException(:final code, :final message) => (code, message),
      StorageException(:final statusCode, :final message) => (
        statusCode,
        message,
      ),
      _ => (null, null),
    };
    developer.log(
      '${error.runtimeType} code=$code message=$message',
      name: logName,
    );
  }
  return failure;
}

Failure _map(Object error) {
  return switch (error) {
    AuthRetryableFetchException() ||
    SocketException() ||
    TimeoutException() ||
    ClientException() => const Failure.network(),
    AuthSessionMissingException() ||
    AuthException(statusCode: '401') => const Failure.unauthorized(),
    // PGRST116: .single() matched no rows (missing or hidden by RLS).
    PostgrestException(code: 'PGRST116') => const Failure.notFound(),
    // 42501: insufficient privilege / row-level security violation.
    PostgrestException(code: '42501') => const Failure.unauthorized(),
    StorageException(statusCode: '403') => const Failure.unauthorized(),
    StorageException(statusCode: '404') => const Failure.notFound(),
    AuthException(:final message, :final code) => Failure.server(
      message: message,
      code: code,
    ),
    PostgrestException(:final message, :final code) => Failure.server(
      message: message,
      code: code,
    ),
    StorageException(:final message, :final statusCode) => Failure.server(
      message: message,
      code: statusCode,
    ),
    _ => Failure.unexpected(message: error.runtimeType.toString()),
  };
}
