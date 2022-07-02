import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:typa_frontend/components/users/data/models/email.dart';
import 'package:typa_frontend/components/users/data/models/password.dart';
import 'package:typa_frontend/components/users/presentation/bloc/exceptions/login_email_password_failure.dart';
import 'package:typa_frontend/components/users/presentation/bloc/states/login_state.dart';
import 'package:typa_frontend/components/users/presentation/pages/login_page.dart';
import 'package:typa_frontend/core/common/animators/router_animator.dart';

@singleton
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._session) : super(const LoginState());

  final SessionRepository _session;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([email, state.password]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status: FormzStatus.valid//Formz.validate([state.email, password]),
    ));
  }
  
  Future<void> logInWithCredentials(BuildContext context) async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      // User? user = await _session.start(state.email.value, state.password.value);
      // print("public id?: " + user!.getPublicId().toString());
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
      RouterAnimator.doIt(context, const LoginPage(), const Text("llegue"));
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(state.copyWith(
        errorMessage: e.message,
        status: FormzStatus.submissionFailure,
      ));
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}