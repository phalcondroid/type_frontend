import 'package:dartz/dartz.dart';
import 'package:google_place/google_place.dart';
import 'package:injectable/injectable.dart';
import 'package:typa_frontend/components/places/data/models/restaurant_item.dart';
import 'package:typa_frontend/components/places/data/repositories/place_repository_impl.dart';

@injectable
class PlacesService {

  PlacesService(this._placeRepository);

  final PlaceRepositoryImpl _placeRepository;

  Future<List<RestaurantItem>> getRestaurantsByCity(String city) async {
    Either<bool, List<RestaurantItem>> result = await _placeRepository.getNearRestaurants(city);
    List<RestaurantItem> resultPlace = [];
    result.fold((l) => {}, (r) { resultPlace = r; });
    return resultPlace;
  }
}