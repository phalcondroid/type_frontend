import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:typa_frontend/components/users/presentation/bloc/signup_form_cubit.dart';
import 'package:typa_frontend/components/users/presentation/bloc/states/signup_form_state.dart';
import 'package:typa_frontend/core/common/widgets/custom_field.dart';

class UsernameTextField extends StatelessWidget {
  const UsernameTextField({
    Key? key,
    required this.labelText,
    required this.errorText,
  }) : super(key: key);

  final String labelText;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupFormCubit, SignupFormState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return CustomField(
            labelText: labelText,
            errorText: state.username.invalid ? errorText : null,
            onChanged: (username) => context.read<SignupFormCubit>().usernameChanged(username)
        );
      },
    );
  }
}