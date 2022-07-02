import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:typa_frontend/components/users/presentation/bloc/login_cubit.dart';
import 'package:typa_frontend/components/users/presentation/bloc/states/login_state.dart';
import 'package:typa_frontend/core/common/translations/app_localizations.dart';

class PasswordLoginField extends StatelessWidget {
  const PasswordLoginField({
    Key? key,
  }): super(key: key);

  OutlineInputBorder _getOutlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide(
        color: color,
        width: 1.0
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          onChanged: (password) => context.read<LoginCubit>().passwordChanged(password),
          obscureText: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade100,
            border: _getOutlineInputBorder(Colors.grey.shade200),
            enabledBorder: _getOutlineInputBorder(Colors.grey.shade200),
            focusedBorder: _getOutlineInputBorder(Colors.grey),
            focusColor: Colors.indigo,
            focusedErrorBorder: _getOutlineInputBorder(Colors.redAccent),
            prefixIcon: const Padding(
              padding: EdgeInsets.all(2),
              child: Icon(Icons.lock_outline_rounded, color: Colors.grey),
            ),
            labelText: AppLocalizations.of(context).loginPassword,
            labelStyle: const TextStyle(
              color: Colors.grey
            ),
            helperText: '',
            errorText: state.password.invalid ? AppLocalizations.of(context).loginInvalidPassword : null,
          ),
        );
      },
    );
  }
}