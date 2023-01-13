import 'package:flutter/cupertino.dart';

@immutable
class Address {
  //add location of the city
  final String street;
  final String postcode;
  final String city;

  const Address(this.street, this.postcode, this.city);

  factory Address.fromGeoJson(Map<String, dynamic> json) {
    final Map<String, dynamic> properties = json['properties'] ?? {};
    final String street = properties['name'];
    final String postcode = properties['postcode'];
    final String city = properties['city'];

    return Address(street, postcode, city);
  }

  Map<String, dynamic> toMap() {
    return {
      'street': street,
      'postcode': postcode,
      'city': city,
    };
  }

  factory Address.fromMap(Map<String, dynamic> json) {
    return Address(json['street'], json['postcode'], json['city']);
  }
}
