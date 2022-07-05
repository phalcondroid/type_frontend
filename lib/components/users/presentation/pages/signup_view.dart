import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:typa_frontend/components/users/presentation/bloc/signup_form_cubit.dart';
import 'package:typa_frontend/components/users/presentation/bloc/states/signup_form_state.dart';
import 'package:typa_frontend/core/common/colors/local_colors.dart';
import 'package:typa_frontend/core/common/widgets/base_scaffold.dart';
import 'package:typa_frontend/core/common/animators/router_animator.dart';
import 'package:typa_frontend/core/common/translations/app_localizations.dart';
import 'package:typa_frontend/components/users/presentation/pages/login_page.dart';
import 'package:typa_frontend/components/users/presentation/pages/signup_page.dart';
import 'package:typa_frontend/components/users/presentation/widgets/signup_button.dart';
import 'package:typa_frontend/components/users/presentation/widgets/password_field.dart';
import 'package:typa_frontend/components/users/presentation/widgets/name_text_field.dart';
import 'package:typa_frontend/components/users/presentation/widgets/phone_text_field.dart';
import 'package:typa_frontend/components/users/presentation/widgets/username_text_field.dart';
import 'package:typa_frontend/core/common/widgets/custom_field.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        appBar: null,
        body: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
              children: [
                const Spacer(),
                Expanded(
                    child: Image.asset("assets/images/tyba.png"),
                    flex: 4
                ),
                const Spacer(),
                Expanded(
                    child: NameTextField(
                      labelText: AppLocalizations.of(context).labelName,
                      errorText: AppLocalizations.of(context).labelErrorName,
                    ),
                    flex: 4
                ),
                const Spacer(),
                Expanded(
                    child: PhoneTextField(
                        labelText: AppLocalizations.of(context).labelPhone,
                        errorText: AppLocalizations.of(context).labelErrorPhone
                    ),
                    flex: 4
                ),
                const Spacer(),
                Expanded(
                    child: UsernameTextField(
                        labelText: AppLocalizations.of(context).labelUsername,
                        errorText: AppLocalizations.of(context).labelErrorUsername
                    ),
                    flex: 4
                ),
                const Spacer(),
                Expanded(
                    child: BlocBuilder<SignupFormCubit, SignupFormState>(
                      buildWhen: (previous, current) => previous.email != current.email,
                      builder: (context, state) {
                        return CustomField(
                            labelText: AppLocalizations.of(context).loginEmail,
                            errorText: state.email.invalid ? AppLocalizations.of(context).loginInvalidEmail : null,
                            onChanged: (email) => context.read<SignupFormCubit>().emailChanged(email)
                        );
                      },
                    ),
                    flex: 4
                ),
                const Spacer(),
                Expanded(
                    child: BlocBuilder<SignupFormCubit, SignupFormState>(
                      buildWhen: (previous, current) => previous.password != current.password,
                      builder: (context, state) {
                        return PasswordField(
                          labelText: AppLocalizations.of(context).loginPassword,
                          errorText: state.password.invalid ? AppLocalizations.of(context).loginInvalidPassword : null,
                          onChanged: (password) => context.read<SignupFormCubit>().passwordChanged(password)
                        );
                      }
                    ),
                    flex: 4
                ),
                const Spacer(),
                Expanded(
                    child: SignupButton(
                        buttonText: AppLocalizations.of(context).signUpButton
                    ),
                    flex: 3
                ),
                const Spacer(),
                Expanded(
                    child: TextButton(
                      child: Text(
                        AppLocalizations.of(context).signUpToLogin,
                        style: const TextStyle(color: LocalColors.primary, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () => {
                        RouterAnimator.doIt(context, const SignupPage(), const LoginPage())
                      },
                    ),
                    flex: 2
                ),
                const Spacer(flex: 2)
              ]
          ),
        )
    );
  }
}