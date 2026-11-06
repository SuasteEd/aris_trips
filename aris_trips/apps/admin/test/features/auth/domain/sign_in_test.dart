import 'package:aris_admin/features/auth/domain/usecases/sign_in.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../helpers/auth_fakes.dart';

void main() {
  test('normalizes the email and keeps the password as typed', () async {
    final repository = MockAuthRepository();
    when(
      () => repository.signIn(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).thenReturn(TaskEither.right(testAdmin));

    await SignIn(repository)(
      email: '  Admin@ArisTrips.dev ',
      password: ' Pw ',
    ).run();

    verify(
      () => repository.signIn(email: 'admin@aristrips.dev', password: ' Pw '),
    ).called(1);
  });
}
