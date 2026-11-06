import 'package:aris_admin/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:aris_admin/features/auth/domain/entities/admin_user.dart';
import 'package:aris_admin/features/auth/domain/repositories/auth_repository.dart';
import 'package:aris_admin/features/auth/domain/usecases/get_current_admin.dart';
import 'package:aris_admin/features/auth/domain/usecases/sign_in.dart';
import 'package:aris_admin/features/auth/domain/usecases/sign_out.dart';
import 'package:aris_admin/features/auth/domain/usecases/watch_signed_out.dart';
import 'package:aris_admin/features/auth/presentation/cubit/login_cubit.dart';
import 'package:aris_admin/features/auth/presentation/cubit/session_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

const testAdmin = AdminUser(
  id: '00000000-0000-4000-8000-000000000001',
  email: 'admin@aristrips.dev',
  fullName: 'Ana Admin',
);

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockAuthRepository extends Mock implements AuthRepository {}

class MockSignIn extends Mock implements SignIn {}

class MockSignOut extends Mock implements SignOut {}

class MockGetCurrentAdmin extends Mock implements GetCurrentAdmin {}

class MockWatchSignedOut extends Mock implements WatchSignedOut {}

class MockSessionCubit extends MockCubit<SessionState>
    implements SessionCubit {}

class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}
