import 'package:flutter/material.dart';
import 'package:typa_frontend/core/common/colors/local_colors.dart';

class GreenCircularProgress extends StatelessWidget {

  const GreenCircularProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20.0,
      width: 58.0,
      child: CircularProgressIndicator(color: LocalColors.primary),
    );
  }
}