import 'package:flutter/cupertino.dart';

@immutable
class Address {
  //add location of the city
  final String street;
  final String postcode;
  final String city;
  final double lat;
  final double long;

  const Address(this.street, this.postcode, this.city, this.lat, this.long);

  factory Address.fromGeoJson(Map<String, dynamic> json) {
    final Map<String, dynamic> properties = json['properties'] ?? {};
    final Map<String, dynamic> geometry = json['geometry'] ?? {};
    final String street = properties['name'];
    final String postcode = properties['postcode'];
    final String city = properties['city'];
    final double lat = geometry['coordinates'][0];
    final double long = geometry['coordinates'][1];

    return Address(street, postcode, city, lat, long);
  }

  Map<String, dynamic> toMap() {
    return {
      'street': street,
      'postcode': postcode,
      'city': city,
      'lat': lat,
      'long': long,
    };
  }

  factory Address.fromMap(
      Map<String, dynamic> jsonProperties, List<dynamic> jsonGeometry) {
    return Address(jsonProperties['name'], jsonProperties['postcode'],
        jsonProperties['city'], jsonGeometry[0], jsonGeometry[1]);
  }

  factory Address.fromMapJson(Map<String, dynamic> jsonProperties) {
    return Address(jsonProperties['street'], jsonProperties['postcode'],
        jsonProperties['city'], jsonProperties['lat'], jsonProperties['long']);
  }
}
