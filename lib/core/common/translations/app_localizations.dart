import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const _localizedValues = <String, Map<String, String>> {
    'en': {
      'title': 'Tyba',
      'cities': 'Restaurants by city',
      'signup_register': 'Register',
      'lbl_name': 'Name',
      'lbl_phone': 'Phone',
      'lbl_address': 'Address',
      'lbl_username': 'Username',
      'lbl_error_name': 'Wring name!',
      'lbl_error_phone': 'Wrong phone!',
      'lbl_error_address': 'Wrong address',
      'lbl_error_username': 'Wrong username',
      'signup_to_login': 'Or, Login!',
      'login_button': 'Login',
      'login_register': 'Or, Sign up!',
      'login_email': 'Email',
      'login_invalid_email': 'Invalid email',
      'login_password': 'Password', 
      'login_invalid_password': 'Invalid password',
      'available_services_title': 'Available services'
    },
    'es': {
      'title': 'Tyba test',
      'cities': 'Restaurantes por ciudad',
      'lbl_name': 'Nombre',
      'lbl_phone': 'Celular',
      'lbl_address': 'Dirección',
      'lbl_username': 'Usuario',
      'lbl_error_name': 'Error ingresando nombre',
      'lbl_error_phone': 'Error ingresando celular',
      'lbl_error_address': 'Error ingresando dirección',
      'lbl_error_username': 'Error ingresando usuario',
      'signup_register': 'Registrar',
      'signup_to_login': 'O, Inicia sesión!',
      'login_button': 'Ingresar',
      'login_register': 'O, Registrate!',
      'login_email': 'Correo electrónico',
      'login_invalid_email': 'Correo incorrecto',
      'login_password': 'Contraseña', 
      'login_invalid_password': 'Contraseña incorrecta',
      'available_services_title': 'Servicios disponibles'
    },
  };

  static List<String> languages() => _localizedValues.keys.toList();

  String get title {
    return _localizedValues[locale.languageCode]!['title']!;
  }

  String get cities {
    return _localizedValues[locale.languageCode]!['cities']!;
  }

  String get labelName {
    return _localizedValues[locale.languageCode]!['lbl_name']!;
  }

  String get labelErrorName {
    return _localizedValues[locale.languageCode]!['lbl_error_name']!;
  }

  String get labelPhone {
    return _localizedValues[locale.languageCode]!['lbl_phone']!;
  }

  String get labelErrorPhone {
    return _localizedValues[locale.languageCode]!['lbl_error_phone']!;
  }

  String get labelAddress {
    return _localizedValues[locale.languageCode]!['lbl_address']!;
  }

  String get labelErrorAddress {
    return _localizedValues[locale.languageCode]!['lbl_error_address']!;
  }

  String get labelUsername {
    return _localizedValues[locale.languageCode]!['lbl_username']!;
  }

  String get labelErrorUsername {
    return _localizedValues[locale.languageCode]!['lbl_error_username']!;
  }

  String get loginEmail {
    return _localizedValues[locale.languageCode]!['login_email']!;
  }

  String get loginRegister {
    return _localizedValues[locale.languageCode]!['login_register']!;
  }

  String get signUpButton {
    return _localizedValues[locale.languageCode]!['signup_register']!;
  }

  String get signUpToLogin {
    return _localizedValues[locale.languageCode]!['signup_to_login']!;
  }

  String get loginInvalidEmail {
    return _localizedValues[locale.languageCode]!['login_invalid_email']!;
  }

  String get loginPassword {
    return _localizedValues[locale.languageCode]!['login_password']!;
  }

  String get loginInvalidPassword {
    return _localizedValues[locale.languageCode]!['login_invalid_password']!;
  }

  String get loginButton {
    return _localizedValues[locale.languageCode]!['login_button']!;
  }

  String get availableServicesTitle {
    return _localizedValues[locale.languageCode]!['available_services_title']!;
  }
}