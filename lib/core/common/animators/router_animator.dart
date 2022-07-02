import 'package:flutter/material.dart';
import 'package:typa_frontend/core/common/animations/enter_exit_route.dart';

class RouterAnimator {
  static doIt(BuildContext context, Widget origin, Widget destiny) {
    Navigator.of(context).push(
      EnterExitRouteAnitation(exitPage: origin, enterPage: destiny)
    );
  }
}