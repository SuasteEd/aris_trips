part of 'login_cubit.dart';

@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginInitial;

  const factory LoginState.submitting() = LoginSubmitting;

  const factory LoginState.success(AdminUser admin) = LoginSuccess;

  const factory LoginState.failure(Failure failure) = LoginFailure;
}
