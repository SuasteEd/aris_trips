import 'package:aris_admin/core/error/failure.dart';
import 'package:aris_admin/features/auth/presentation/cubit/login_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/auth_fakes.dart';

void main() {
  late MockSignIn signIn;

  setUp(() => signIn = MockSignIn());

  blocTest<LoginCubit, LoginState>(
    'emits submitting then success',
    setUp: () =>
        when(() => signIn(email: 'a@b.mx', password: 'pw'))
            .thenReturn(TaskEither.right(testAdmin)),
    build: () => LoginCubit(signIn),
    act: (cubit) => cubit.submit(email: 'a@b.mx', password: 'pw'),
    expect: () => [
      const LoginState.submitting(),
      const LoginState.success(testAdmin),
    ],
  );

  for (final failure in [
    const Failure.invalidCredentials(),
    const Failure.notAdmin(),
    const Failure.network(),
  ]) {
    blocTest<LoginCubit, LoginState>(
      'emits submitting then failure for $failure',
      setUp: () => when(
        () => signIn(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenReturn(TaskEither.left(failure)),
      build: () => LoginCubit(signIn),
      act: (cubit) => cubit.submit(email: 'a@b.mx', password: 'pw'),
      expect: () => [
        const LoginState.submitting(),
        LoginState.failure(failure),
      ],
    );
  }

  blocTest<LoginCubit, LoginState>(
    'ignores a second submit while submitting',
    build: () => LoginCubit(signIn),
    seed: () => const LoginState.submitting(),
    act: (cubit) => cubit.submit(email: 'a@b.mx', password: 'pw'),
    expect: () => <LoginState>[],
    verify: (_) => verifyNever(
      () => signIn(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ),
  );
}
