import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:typa_frontend/core/common/widgets/custom_field.dart';
import 'package:typa_frontend/components/users/presentation/bloc/signup_form_cubit.dart';
import 'package:typa_frontend/components/users/presentation/bloc/states/signup_form_state.dart';

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    Key? key,
    required this.labelText,
    required this.errorText,
  }) : super(key: key);

  final String labelText;
  final String errorText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupFormCubit, SignupFormState>(
      buildWhen: (previous, current) => previous.phone != current.phone,
      builder: (context, state) {
        return CustomField(
            labelText: labelText,
            errorText: state.phone.invalid ? errorText : null,
            onChanged: (phone) => context.read<SignupFormCubit>().phoneChanged(phone)
        );
      },
    );
  }
}