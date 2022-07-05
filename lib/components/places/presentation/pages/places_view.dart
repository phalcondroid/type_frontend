import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:typa_frontend/components/places/data/models/restaurant_item.dart';
import 'package:typa_frontend/components/places/presentation/bloc/places_cubit.dart';
import 'package:typa_frontend/components/places/presentation/bloc/states/places_state.dart';
import 'package:typa_frontend/components/places/presentation/widgets/row_places_item.dart';
import 'package:typa_frontend/core/common/translations/app_localizations.dart';
import 'package:typa_frontend/core/common/widgets/base_scaffold.dart';
import 'package:typa_frontend/core/common/widgets/custom_field.dart';

class PlacesView extends StatelessWidget {
  const PlacesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).cities),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: context.read<PlacesCubit>().handleClick,
              itemBuilder: (BuildContext context) {
                return {'Transactions', 'Logout'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<PlacesCubit, PlacesState>(
                  buildWhen: (previous, current) => previous.city != current.city,
                  builder: (context, state) {
                    return CustomField(
                        labelText: "cities",
                        errorText: state.city.isEmpty ? "Empty!" : null,
                        onChanged: (city) => context.read<PlacesCubit>().onChangeInputCity(city)
                    );
                  },
                ),
              ),
              Expanded(
                child: BlocBuilder<PlacesCubit, PlacesState>(
                  builder: (context, state) {
                    return ListView.builder(
                        itemCount: state.restaurantList.length,
                        itemBuilder: (context, int index) {
                          RestaurantItem item = state.restaurantList[index];
                          return RowPlacesItem(
                              placeName: item.restaurant,
                              photoReference: item.photo?.photoReference ?? ""
                          );
                        }
                    );
                  },
                ),
                flex: 10
              )
            ],
          ),
        )
    );
  }
}