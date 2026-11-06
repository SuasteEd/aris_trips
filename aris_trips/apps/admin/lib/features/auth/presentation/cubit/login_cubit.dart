import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/admin_user.dart';
import '../../domain/usecases/sign_in.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._signIn) : super(const LoginState.initial());

  final SignIn _signIn;

  Future<void> submit({required String email, required String password}) async {
    if (state is LoginSubmitting) return;
    emit(const LoginState.submitting());
    final result = await _signIn(email: email, password: password).run();
    if (isClosed) return;
    emit(result.match(LoginState.failure, LoginState.success));
  }
}
