import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {

  const CustomField({
    Key? key,
    required this.labelText,
    required this.errorText,
    required this.onChanged
  }) : super(key: key);

  final String labelText;
  final String? errorText;
  final dynamic onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: const Key('loginForm_emailInput_textField'),
      onChanged: onChanged,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
                color: Colors.grey.shade200,
                width: 1.0
            )
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
                color: Colors.grey.shade200,
                width: 1.0
            )
        ),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
                color: Colors.grey,
                width: 1.0
            )
        ),
        focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
                color: Colors.redAccent,
                width: 1.0
            )
        ),
        prefixIcon: const Padding(
            padding: EdgeInsets.all(2),
            child: Icon(Icons.person, color: Colors.grey)
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