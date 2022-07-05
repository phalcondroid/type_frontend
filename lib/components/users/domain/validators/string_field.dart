import 'package:formz/formz.dart';

enum StringFieldValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template email}
/// Form input for an name input.
/// {@endtemplate}
class StringField extends FormzInput<String, StringFieldValidationError> {
  /// {@macro text}
  const StringField.pure() : super.pure('');

  /// {@macro text}
  const StringField.dirty([String value = '']) : super.dirty(value);

  static final RegExp _stringFieldRegExp = RegExp(
    r'^\s*([A-Za-z]{1,}([\.,] |[-]|))+[A-Za-z]+\.?\s*$'
  );

  @override
  StringFieldValidationError? validator(String? value) {
    return _stringFieldRegExp.hasMatch(value ?? '')
        ? null
        : StringFieldValidationError.invalid;
  }
}