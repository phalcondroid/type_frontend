import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RowPlacesItem extends StatelessWidget {

  RowPlacesItem({
    Key? key,
    required this.placeName,
    required this.photoReference
  }): super(key: key);
  final String placeName;
  final String photoReference;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      width: 200.0,
      child: Row(
        children: [
          Expanded(
              child: Card(
                child: Container(
                  decoration:  BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      alignment: FractionalOffset.topCenter,
                      image: NetworkImage("https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$photoReference&sensor=false&key=AIzaSyBIYhYXuJcYNEBEDHmQseaQ1tUFPd91xgE")
                    )
                  ),
                )
              )
          ),
          Expanded(child: Text(placeName))
        ],
      ),
    );
  }
}