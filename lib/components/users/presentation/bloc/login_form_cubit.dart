import 'package:formz/formz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:typa_frontend/components/places/presentation/pages/places_page.dart';
import 'package:typa_frontend/core/common/animators/router_animator.dart';
import 'package:typa_frontend/components/users/domain/validators/email.dart';
import 'package:typa_frontend/components/users/domain/validators/password.dart';
import 'package:typa_frontend/components/users/presentation/pages/login_page.dart';
import 'package:typa_frontend/components/users/domain/services/login_service.dart';
import 'package:typa_frontend/components/users/presentation/bloc/states/login_form_state.dart';
import 'package:typa_frontend/components/users/presentation/bloc/exceptions/tyba_form_fields_failure.dart';

@singleton
class LoginFormCubit extends Cubit<LoginFormState> {
  LoginFormCubit(this._loginService) : super(const LoginFormState());
  final LoginService _loginService;

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
        status: FormzStatus.valid
    ));
  }

  Future<void> logInWithCredentials(BuildContext context) async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _loginService.getUserByLoginAndPass(state.email.value, state.password.value);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
      RouterAnimator.doIt(context, const LoginPage(), const PlacesPage());
    } on TybaFormFieldsFailure catch (e) {
      emit(state.copyWith(
        errorMessage: e.message,
        status: FormzStatus.submissionFailure
      ));
    } catch (e, stack) {
      print("exception: $e, $stack");
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}