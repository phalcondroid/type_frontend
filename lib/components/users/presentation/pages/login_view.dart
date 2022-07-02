import 'package:flutter/material.dart';
import 'package:typa_frontend/components/users/presentation/widgets/button_login.dart';
import 'package:typa_frontend/components/users/presentation/widgets/email_login_field.dart';
import 'package:typa_frontend/components/users/presentation/widgets/password_login_field.dart';
import 'package:typa_frontend/core/common/widgets/base_scaffold.dart';

class LoginView extends StatelessWidget {
  const LoginView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: null,
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const Spacer(flex: 5),
            Expanded(
              child: Image.asset("assets/images/logo.png"),
              flex: 6
            ),
            const Spacer(flex: 5),
            const Expanded(
              child: EmailLoginField(),
              flex: 4
            ),
            const Spacer(),
            const Expanded(
              child: PasswordLoginField(),
              flex: 4
            ),
            const Spacer(),
            const Expanded(
              child: ButtonLogin(),
              flex: 3
            ),
            const Spacer(flex: 9)
          ]
        ),
      )
    );
  }
}