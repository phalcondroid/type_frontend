import 'package:formz/formz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:typa_frontend/core/common/widgets/rounder_button.dart';
import 'package:typa_frontend/core/common/widgets/green_circular_progress.dart';
import 'package:typa_frontend/components/users/presentation/bloc/signup_form_cubit.dart';
import 'package:typa_frontend/components/users/presentation/bloc/states/signup_form_state.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({
    Key? key,
    required this.buttonText
  }) : super(key: key);

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupFormCubit, SignupFormState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        if (state.status.isSubmissionInProgress) {
          return const GreenCircularProgress();
        }
        return RoundedButton(
            textButton: buttonText,
            onPressed: () {
              print("calling on pressedd register");
              context.read<SignupFormCubit>().registerUser(context);
            }
        );
      },
    );
  }
}