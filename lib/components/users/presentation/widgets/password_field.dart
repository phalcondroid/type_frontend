import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    Key? key,
    required this.labelText,
    required this.errorText,
    required this.onChanged
  }): super(key: key);

  final String labelText;
  final String? errorText;
  final dynamic onChanged;

  OutlineInputBorder _getOutlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(
        color: color,
        width: 1.0
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('loginForm_passwordInput_textField'),
      onChanged: onChanged,
      obscureText: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade100,
        border: _getOutlineInputBorder(Colors.grey.shade200),
        enabledBorder: _getOutlineInputBorder(Colors.grey.shade200),
        focusedBorder: _getOutlineInputBorder(Colors.grey),
        focusColor: Colors.indigo,
        focusedErrorBorder: _getOutlineInputBorder(Colors.redAccent),
        prefixIcon: const Padding(
          padding: EdgeInsets.all(2),
          child: Icon(Icons.lock_outline_rounded, color: Colors.grey),
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.grey
        ),
        helperText: '',
        errorText: errorText,
      ),
    );
  }
}