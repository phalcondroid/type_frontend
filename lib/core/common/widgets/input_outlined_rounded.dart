import 'package:flutter/material.dart';
import 'package:typa_frontend/core/common/colors/local_colors.dart';

class InputOutlinedRounded extends StatelessWidget {
  const InputOutlinedRounded({
    Key? key,
    required this.placeholder,
    this.isPassword,
    this.onPressed,
    this.prefixIcon,
    this.suffixIcon
  }) : super(key: key);

  final String placeholder;
  final bool? isPassword;
  final Function? onPressed;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4.0,
    	shadowColor: Colors.black45,
      borderRadius: const BorderRadius.all(
        Radius.circular(30)
      ),
      child: TextField(
        obscureText: isPassword ?? false,
        decoration: InputDecoration(
          filled: true,
          hintText: placeholder,
          hintStyle: TextStyle(color: Colors.grey[500]),
          fillColor: LocalColors.softGrey,
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
              color: Colors.grey.shade200,
              width: 1.0
            )
          ) ,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(2),
            child: Icon(prefixIcon)
          ),
          suffixIcon: suffixIcon != null ? IconButton(
            icon: Icon(
              suffixIcon,
              color: LocalColors.primary
            ),
            onPressed: () {
              onPressed!();
            }
          ) : null
        ),
      ),
    );
  }
}