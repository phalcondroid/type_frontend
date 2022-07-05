import 'package:flutter/material.dart';
import 'package:typa_frontend/core/common/colors/local_colors.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.textButton,
    this.onPressed
  }) : super(key: key);

  final String textButton;
  final dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: ElevatedButton(
        key: const Key('loginForm_continue_raisedButton'),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          primary: LocalColors.primary,
        ),
        onPressed: onPressed,
        child: Text(textButton),
      ),
    );
  }
}