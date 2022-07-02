
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:typa_frontend/components/users/presentation/bloc/login_cubit.dart';
import 'package:typa_frontend/components/users/presentation/bloc/states/login_state.dart';
import 'package:typa_frontend/core/common/translations/app_localizations.dart';

class EmailLoginField extends StatelessWidget {
  const EmailLoginField({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_emailInput_textField'),
          onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(
                color: Colors.grey.shade200,
                width: 1.0
              )
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(
                color: Colors.grey.shade200,
                width: 1.0
              )
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1.0
              )
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(
                color: Colors.redAccent,
                width: 1.0
              )
            ),
            prefixIcon: const Padding(
              padding: EdgeInsets.all(2),
              child: Icon(Icons.person, color: Colors.grey)
            ),
            labelText: AppLocalizations.of(context).loginEmail,
              labelStyle: const TextStyle(
              color: Colors.grey
            ),
            helperText: '',
            errorText: state.email.invalid ? AppLocalizations.of(context).loginInvalidEmail : null,
          ),
        );
      },
    );
  }
}