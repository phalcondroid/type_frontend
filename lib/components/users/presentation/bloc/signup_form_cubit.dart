import 'package:formz/formz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:typa_frontend/components/places/presentation/pages/places_page.dart';
import 'package:typa_frontend/core/common/animators/router_animator.dart';
import 'package:typa_frontend/components/users/domain/validators/phone.dart';
import 'package:typa_frontend/components/users/domain/validators/email.dart';
import 'package:typa_frontend/components/users/domain/validators/password.dart';
import 'package:typa_frontend/components/users/domain/validators/string_field.dart';
import 'package:typa_frontend/components/users/domain/services/signup_service.dart';
import 'package:typa_frontend/components/users/presentation/pages/signup_page.dart';
import 'package:typa_frontend/components/users/presentation/bloc/states/signup_form_state.dart';
import 'package:typa_frontend/components/users/presentation/bloc/exceptions/tyba_form_fields_failure.dart';

@singleton
class SignupFormCubit extends Cubit<SignupFormState> {
  SignupFormCubit(this._signupService) : super(const SignupFormState());
  final SignupService _signupService;

  void nameChanged(String value) {
    final name = StringField.dirty(value);
    emit(state.copyWith(
      name: name,
      status: Formz.validate([name, state.phone, state.username, state.email, state.password]),
    ));
  }

  void phoneChanged(String value) {
    final phone = Phone.dirty(value);
    emit(state.copyWith(
      phone: phone,
      status: Formz.validate([phone, state.name, state.username, state.email, state.password]),
    ));
  }

  void usernameChanged(String value) {
    final username = StringField.dirty(value);
    emit(state.copyWith(
      username: username,
      status: Formz.validate([username, state.name, state.phone, state.email, state.password]),
    ));
  }

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

  Future<void> registerUser(BuildContext context) async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await _signupService.registerUser(
        state.name.value,
        state.phone.value,
        state.username.value,
        state.email.value,
        state.password.value
      );
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
      RouterAnimator.doIt(context, const SignupPage(), const PlacesPage());
    } on TybaFormFieldsFailure catch (e) {
      print("here on catch");
      emit(state.copyWith(
        errorMessage: e.message,
        status: FormzStatus.submissionFailure,
      ));
    } catch (e, stacktrace) {
      print("here catch: $e - $stacktrace");
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}