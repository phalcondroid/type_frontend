import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:typa_frontend/components/users/presentation/bloc/login_cubit.dart';
import 'package:typa_frontend/components/users/presentation/bloc/states/login_state.dart';
import 'package:typa_frontend/core/common/colors/local_colors.dart';
import 'package:typa_frontend/core/common/translations/app_localizations.dart';

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state.status.isSubmissionInProgress) {
          return const SizedBox(
            height: 20.0,
            width: 58.0,
            child: CircularProgressIndicator(
              color: LocalColors.primary
            ),
          );
        }
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: ElevatedButton(
            key: const Key('loginForm_continue_raisedButton'),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              primary: Colors.amber,
            ),
            onPressed: state.status.isValidated
                ? () => context.read<LoginCubit>().logInWithCredentials(context)
                : null,
            child: Text(AppLocalizations.of(context).loginButton),
          ),
        );
      },
    );
  }
}