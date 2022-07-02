import 'package:flutter/material.dart';
import 'package:typa_frontend/core/common/colors/local_colors.dart';

class TopSnackBar {

  final BuildContext context;
  final double height;
  final String message;

  TopSnackBar({
    required this.context,
    required this.height,
    required this.message
  });

  void show() {
    ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          left: 10.0,
          right: 10.0,
          bottom: height * 0.85
        ),
        backgroundColor: LocalColors.primary,
        content: Text(message)
      ));
  }
}