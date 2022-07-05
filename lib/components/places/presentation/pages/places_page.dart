import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:typa_frontend/core/injectable/configuration.dart';
import 'package:typa_frontend/components/places/presentation/bloc/places_cubit.dart';
import 'package:typa_frontend/components/places/presentation/pages/places_view.dart';

class PlacesPage extends StatelessWidget {
  const PlacesPage({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<PlacesCubit>())
      ],
      child: const PlacesView(),
    );
  }
}