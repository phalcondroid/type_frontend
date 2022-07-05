import 'package:formz/formz.dart';
import 'package:equatable/equatable.dart';
import 'package:typa_frontend/components/users/domain/validators/email.dart';
import 'package:typa_frontend/components/users/domain/validators/password.dart';

class LoginFormState extends Equatable {
  const LoginFormState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage
  }): super();

  final Email email;
  final Password password;
  final FormzStatus status;
  final String? errorMessage;

  @override
  List<Object> get props => [email, password, status];

  LoginFormState copyWith({
    Email? email,
    Password? password,
    FormzStatus? status,
    String? errorMessage,
  }) {
    return LoginFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}