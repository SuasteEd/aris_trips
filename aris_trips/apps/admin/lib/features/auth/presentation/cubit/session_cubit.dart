import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/admin_user.dart';
import '../../domain/usecases/get_current_admin.dart';
import '../../domain/usecases/sign_out.dart';
import '../../domain/usecases/watch_signed_out.dart';

part 'session_cubit.freezed.dart';
part 'session_state.dart';

/// App-wide session. The router redirects from this state.
@lazySingleton
class SessionCubit extends Cubit<SessionState> {
  SessionCubit(
    this._getCurrentAdmin,
    this._signOut,
    WatchSignedOut watchSignedOut,
  ) : super(const SessionState.unknown()) {
    _signedOutSubscription = watchSignedOut().listen((_) {
      if (state is! SessionUnauthenticated) {
        emit(const SessionState.unauthenticated());
      }
    });
  }

  final GetCurrentAdmin _getCurrentAdmin;
  final SignOut _signOut;
  late final StreamSubscription<void> _signedOutSubscription;

  /// Verifies the stored session against `admins`.
  Future<void> check() async {
    emit(const SessionState.unknown());
    final result = await _getCurrentAdmin().run();
    if (isClosed) return;
    emit(
      result.match(
        SessionState.failure,
        (admin) => admin.match(
          () => const SessionState.unauthenticated(),
          SessionState.authenticated,
        ),
      ),
    );
  }

  void signedIn(AdminUser admin) => emit(SessionState.authenticated(admin));

  /// The local session is always cleared, even if the server call fails.
  Future<void> signOut() async {
    await _signOut().run();
    if (!isClosed) emit(const SessionState.unauthenticated());
  }

  @override
  Future<void> close() async {
    await _signedOutSubscription.cancel();
    return super.close();
  }
}
