import 'dart:async';

import 'package:aris_admin/core/error/failure.dart';
import 'package:aris_admin/features/auth/presentation/cubit/session_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/auth_fakes.dart';

void main() {
  late MockGetCurrentAdmin getCurrentAdmin;
  late MockSignOut signOut;
  late MockWatchSignedOut watchSignedOut;
  late StreamController<Unit> signedOut;

  setUp(() {
    getCurrentAdmin = MockGetCurrentAdmin();
    signOut = MockSignOut();
    watchSignedOut = MockWatchSignedOut();
    signedOut = StreamController<Unit>.broadcast();
    when(() => watchSignedOut()).thenAnswer((_) => signedOut.stream);
  });

  tearDown(() => signedOut.close());

  SessionCubit build() =>
      SessionCubit(getCurrentAdmin, signOut, watchSignedOut);

  test('starts unknown', () {
    expect(build().state, const SessionState.unknown());
  });

  blocTest<SessionCubit, SessionState>(
    'check restores a stored admin session',
    setUp: () =>
        when(() => getCurrentAdmin())
            .thenReturn(TaskEither.right(some(testAdmin))),
    build: build,
    act: (cubit) => cubit.check(),
    expect: () => [
      const SessionState.unknown(),
      const SessionState.authenticated(testAdmin),
    ],
  );

  blocTest<SessionCubit, SessionState>(
    'check without session or admin row is unauthenticated',
    setUp: () =>
        when(() => getCurrentAdmin()).thenReturn(TaskEither.right(none())),
    build: build,
    act: (cubit) => cubit.check(),
    expect: () => [
      const SessionState.unknown(),
      const SessionState.unauthenticated(),
    ],
  );

  blocTest<SessionCubit, SessionState>(
    'check that cannot reach the server is a failure',
    setUp: () =>
        when(() => getCurrentAdmin())
            .thenReturn(TaskEither.left(const Failure.network())),
    build: build,
    act: (cubit) => cubit.check(),
    expect: () => [
      const SessionState.unknown(),
      const SessionState.failure(Failure.network()),
    ],
  );

  blocTest<SessionCubit, SessionState>(
    'retrying after a failure shows loading again',
    setUp: () =>
        when(() => getCurrentAdmin())
            .thenReturn(TaskEither.right(some(testAdmin))),
    build: build,
    seed: () => const SessionState.failure(Failure.network()),
    act: (cubit) => cubit.check(),
    expect: () => [
      const SessionState.unknown(),
      const SessionState.authenticated(testAdmin),
    ],
  );

  blocTest<SessionCubit, SessionState>(
    'signedIn authenticates',
    build: build,
    act: (cubit) => cubit.signedIn(testAdmin),
    expect: () => [const SessionState.authenticated(testAdmin)],
  );

  blocTest<SessionCubit, SessionState>(
    'signOut ends the session even if the server call fails',
    setUp: () =>
        when(() => signOut())
            .thenReturn(TaskEither.left(const Failure.network())),
    build: build,
    seed: () => const SessionState.authenticated(testAdmin),
    act: (cubit) => cubit.signOut(),
    expect: () => [const SessionState.unauthenticated()],
    verify: (_) => verify(() => signOut()).called(1),
  );

  blocTest<SessionCubit, SessionState>(
    'an external sign out (expired session) unauthenticates',
    build: build,
    seed: () => const SessionState.authenticated(testAdmin),
    act: (_) => signedOut.add(unit),
    expect: () => [const SessionState.unauthenticated()],
  );
}
