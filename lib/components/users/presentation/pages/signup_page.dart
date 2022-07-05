import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:typa_frontend/core/injectable/configuration.dart';
import 'package:typa_frontend/components/users/presentation/pages/signup_view.dart';
import 'package:typa_frontend/components/users/presentation/bloc/signup_form_cubit.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<SignupFormCubit>())
      ],
      child: const SignupView(),
    );
  }
}