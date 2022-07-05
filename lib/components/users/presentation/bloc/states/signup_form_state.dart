
import 'package:formz/formz.dart';
import 'package:equatable/equatable.dart';
import 'package:typa_frontend/components/users/domain/validators/password.dart';
import 'package:typa_frontend/components/users/domain/validators/email.dart';
import 'package:typa_frontend/components/users/domain/validators/phone.dart';
import 'package:typa_frontend/components/users/domain/validators/string_field.dart';

class SignupFormState extends Equatable {
  const SignupFormState({
    this.name = const StringField.pure(),
    this.phone = const Phone.pure(),
    this.address = const StringField.pure(),
    this.username = const StringField.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage,
  });

  final StringField name;
  final Phone phone;
  final StringField address;
  final StringField username;
  final Email email;
  final Password password;
  final FormzStatus status;
  final String? errorMessage;

  @override
  List<Object> get props => [name, phone, address, username, email, password, status];

  SignupFormState copyWith({
    StringField? name,
    Phone? phone,
    StringField? address,
    StringField? username,
    Email? email,
    Password? password,
    FormzStatus? status,
    String? errorMessage,
  }) {
    return SignupFormState(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}