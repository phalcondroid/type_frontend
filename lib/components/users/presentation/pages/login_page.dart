import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:typa_frontend/components/users/presentation/bloc/login_form_cubit.dart';
import 'package:typa_frontend/core/injectable/configuration.dart';
import 'package:typa_frontend/components/users/presentation/pages/login_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<LoginFormCubit>())
      ],
      child: const LoginView(),
    );
  }
}