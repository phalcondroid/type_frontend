import 'package:google_place/google_place.dart';

class RestaurantItem {
  RestaurantItem({
    required this.restaurant,
    required this.photo
  });

  final String restaurant;
  final Photo? photo;
}