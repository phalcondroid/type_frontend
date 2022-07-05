import 'package:dartz/dartz.dart';
import 'package:google_place/google_place.dart';
import 'package:typa_frontend/components/places/data/models/restaurant_item.dart';

abstract class PlaceRepository {
  Future<Either<bool, List<RestaurantItem>>> getNearRestaurants(String value);
}