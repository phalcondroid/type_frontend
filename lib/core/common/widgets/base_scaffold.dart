
import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {

  final AppBar? appBar;
  final Widget? body;

  const BaseScaffold({
    Key? key,
    required this.appBar,
    this.body
  }) : super(key: key);

  Widget _getBody() {
    if (body == null) {
      return Container();
    }
    return body as Widget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.95,
              child: _getBody()
            )
          )
        ),
      )
    );
  }
}