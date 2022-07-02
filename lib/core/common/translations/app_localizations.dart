import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const _localizedValues = <String, Map<String, String>> {
    'en': {
      'title': 'Delivery Mouse',
      'login_button': 'Login',
      'login_email': 'Email',
      'login_invalid_email': 'Invalid email',
      'login_password': 'Password', 
      'login_invalid_password': 'Invalid password',
      'available_services_title': 'Available services'
    },
    'es': {
      'title': 'Delivery Mouse',
      'login_button': 'Ingresar',
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

  String get loginEmail {
    return _localizedValues[locale.languageCode]!['login_email']!;
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