import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:typa_frontend/components/users/presentation/bloc/login_form_cubit.dart';
import 'package:typa_frontend/components/users/presentation/bloc/states/login_form_state.dart';
import 'package:typa_frontend/components/users/presentation/pages/signup_page.dart';
import 'package:typa_frontend/core/common/widgets/custom_field.dart';

import 'login_page.dart';
import 'package:flutter/material.dart';
import '../../../../core/common/animators/router_animator.dart';
import 'package:typa_frontend/core/common/colors/local_colors.dart';
import 'package:typa_frontend/core/common/widgets/base_scaffold.dart';
import 'package:typa_frontend/core/common/translations/app_localizations.dart';
import 'package:typa_frontend/components/users/presentation/widgets/button_login.dart';
import 'package:typa_frontend/components/users/presentation/widgets/password_field.dart';

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
              child: Image.asset("assets/images/tyba.png"),
              flex: 6
            ),
            const Spacer(flex: 5),
            Expanded(
              child: BlocBuilder<LoginFormCubit, LoginFormState>(
                buildWhen: (previous, current) => previous.email != current.email,
                builder: (context, state) {
                  return CustomField(
                      labelText: AppLocalizations.of(context).loginEmail,
                      errorText: state.email.invalid ? AppLocalizations.of(context).loginInvalidEmail : null,
                      onChanged: (email) => context.read<LoginFormCubit>().emailChanged(email)
                  );
                },
              ),
              flex: 4
            ),
            const Spacer(),
            Expanded(
              child: BlocBuilder<LoginFormCubit, LoginFormState>(
                  buildWhen: (previous, current) => previous.password != current.password,
                  builder: (context, state) {
                    return PasswordField(
                      labelText: AppLocalizations.of(context).loginPassword,
                      errorText: state.password.invalid ? AppLocalizations.of(context).loginInvalidPassword : null,
                      onChanged: (password) => context.read<LoginFormCubit>().passwordChanged(password),
                    );
                  }
              ),
              flex: 4
            ),
            const Spacer(),
            Expanded(
              child: ButtonLogin(
                buttonText: AppLocalizations.of(context).loginButton,
              ),
              flex: 3
            ),
            const Spacer(),
            Expanded(
              child: TextButton(
                child: Text(
                  AppLocalizations.of(context).loginRegister,
                  style: const TextStyle(color: LocalColors.primary, fontWeight: FontWeight.bold),
                ),
                onPressed: () => RouterAnimator.doIt(context, const LoginPage(), const SignupPage()),
              ),
              flex: 2
            ),
            const Spacer(flex: 6)
          ]
        ),
      )
    );
  }
}