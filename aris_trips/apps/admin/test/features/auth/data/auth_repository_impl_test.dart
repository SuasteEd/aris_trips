import 'package:aris_admin/core/error/failure.dart';
import 'package:aris_admin/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:aris_admin/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:aris_admin/features/auth/domain/entities/admin_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../helpers/auth_fakes.dart';

void main() {
  late MockAuthRemoteDataSource remote;
  late AuthRepositoryImpl repository;

  setUp(() {
    remote = MockAuthRemoteDataSource();
    repository = AuthRepositoryImpl(remote);
  });

  group('signIn', () {
    test('returns the admin', () async {
      when(() => remote.signIn(email: 'a@b.mx', password: 'secret'))
          .thenAnswer((_) async => testAdmin);

      final result = await repository
          .signIn(email: 'a@b.mx', password: 'secret')
          .run();

      expect(result, right<Failure, AdminUser>(testAdmin));
    });

    test('maps a non-admin account to notAdmin', () async {
      when(
        () => remote.signIn(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenThrow(const NotAdminException());

      final result = await repository
          .signIn(email: 'a@b.mx', password: 'secret')
          .run();

      expect(result, left<Failure, AdminUser>(const Failure.notAdmin()));
    });

    test('maps wrong credentials', () async {
      when(
        () => remote.signIn(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenThrow(
        const AuthApiException(
          'Invalid login credentials',
          statusCode: '400',
          code: 'invalid_credentials',
        ),
      );

      final result = await repository
          .signIn(email: 'a@b.mx', password: 'bad')
          .run();

      expect(
        result,
        left<Failure, AdminUser>(const Failure.invalidCredentials()),
      );
    });

    test('maps network errors', () async {
      when(
        () => remote.signIn(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenThrow(AuthRetryableFetchException(message: 'offline'));

      final result = await repository
          .signIn(email: 'a@b.mx', password: 'secret')
          .run();

      expect(result, left<Failure, AdminUser>(const Failure.network()));
    });
  });

  group('currentAdmin', () {
    test('wraps the admin in some', () async {
      when(() => remote.currentAdmin()).thenAnswer((_) async => testAdmin);

      expect(
        await repository.currentAdmin().run(),
        right<Failure, Option<AdminUser>>(some(testAdmin)),
      );
    });

    test('returns none without session or admin row', () async {
      when(() => remote.currentAdmin()).thenAnswer((_) async => null);

      expect(
        await repository.currentAdmin().run(),
        right<Failure, Option<AdminUser>>(none<AdminUser>()),
      );
    });

    test('returns a failure when the check cannot run', () async {
      when(() => remote.currentAdmin())
          .thenThrow(AuthRetryableFetchException(message: 'offline'));

      expect(
        await repository.currentAdmin().run(),
        left<Failure, Option<AdminUser>>(const Failure.network()),
      );
    });
  });

  test('signOut returns unit', () async {
    when(() => remote.signOut()).thenAnswer((_) async {});

    expect(await repository.signOut().run(), right<Failure, Unit>(unit));
  });

  test('signedOutChanges forwards each event', () {
    when(() => remote.signedOutChanges())
        .thenAnswer((_) => Stream<void>.fromIterable([null, null]));

    expect(repository.signedOutChanges(), emitsInOrder([unit, unit]));
  });
}
