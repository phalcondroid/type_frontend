import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:typa_frontend/components/places/domain/actions/places_service.dart';
import 'package:typa_frontend/components/places/presentation/bloc/states/places_state.dart';

@injectable
class PlacesCubit extends Cubit<PlacesState> {
  PlacesCubit(this._placesService) : super(const PlacesState(city: "", restaurantList: []));

  final PlacesService _placesService;

  onChangeInputCity(String city) async {
    var results = await _placesService.getRestaurantsByCity(city);
    emit(state.copyWith(
        city: city,
        restaurantList: results
    ));
  }

  handleClick(value) {
    switch (value) {
      case 'Logout':
        break;
      case 'Settings':
        break;
    }
  }
}