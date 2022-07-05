import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:google_place/google_place.dart';
import 'package:google_geocoding/google_geocoding.dart';
import 'package:typa_frontend/components/places/data/models/restaurant_item.dart';
import 'package:typa_frontend/components/places/domain/repositories/place_repository.dart';

@singleton
class PlaceRepositoryImpl extends PlaceRepository {
  PlaceRepositoryImpl() {
    // ADVERTENCIA: Esto no esta bien pero lo puse por velocidad
    geocoding = GoogleGeocoding("AIzaSyBIYhYXuJcYNEBEDHmQseaQ1tUFPd91xgE");
    // ADVERTENCIA: Esto no esta bien pero lo puse por velocidad
    place = GooglePlace("AIzaSyBIYhYXuJcYNEBEDHmQseaQ1tUFPd91xgE");
  }

  late final GoogleGeocoding geocoding;
  late final GooglePlace place;

  @override
  Future<Either<bool, List<RestaurantItem>>> getNearRestaurants(String value) async {
    TextSearchResponse? restaurants = await place.search.getTextSearch("restaurants in $value");
    if (restaurants == null || restaurants.results == null) {
      return const Left(false);
    }
    List<RestaurantItem> restaurantsResult = [];
    restaurants.results?.forEach((SearchResult element) {
      var photo = element.photos?.first;

      restaurantsResult.add(RestaurantItem(
          restaurant: element.name.toString(),
          photo: photo
      ));

    });
    return Right(restaurantsResult);
  }
}