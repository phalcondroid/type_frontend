import 'package:equatable/equatable.dart';
import 'package:google_place/google_place.dart';
import 'package:typa_frontend/components/places/data/models/restaurant_item.dart';

class PlacesState extends Equatable {
  const PlacesState({
    required this.city,
    required this.restaurantList
  });

  final String city;
  final List<RestaurantItem> restaurantList;

  @override
  List<Object> get props => [city, restaurantList];

  PlacesState copyWith({
    String? city,
    List<RestaurantItem>? restaurantList
  }) {
    return PlacesState(
        city: city ?? this.city,
        restaurantList: restaurantList ?? this.restaurantList
    );
  }
}