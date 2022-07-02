import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:typa_frontend/components/users/presentation/bloc/login_cubit.dart';
import 'package:typa_frontend/components/users/presentation/pages/login_view.dart';
import 'package:typa_frontend/core/injectable/configuration.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginCubit>(),
      child: const LoginView(),
    );
  }
}