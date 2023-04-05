import 'dart:convert';

import 'package:app_meteo/object/adresseRepo.dart';
import 'package:http/http.dart';

class AddressRepository {
  Future<List<Address>> fetchAddresses(String query) async {
    final Response response = await get(
        Uri.parse('https://api-adresse.data.gouv.fr/search?q=$query'));
    if (response.statusCode == 200) {
      final List<Address> addresses = []; // Liste que la méthode va renvoyer

      // Transformation du JSON (String) en Map<String, dynamic>
      final Map<String, dynamic> json = jsonDecode(response.body);
      if (json.containsKey("features")) {
        // Récupération des "features"
        final List<dynamic> features = json['features'];

        // Transformation de chaque "feature" en objet de type "Address"
        for (Map<String, dynamic> feature in features) {
          final Address address = Address.fromGeoJson(feature);
          addresses.add(address);
        }
      }
      return addresses;
    } else {
      throw Exception('Failed to load addresses');
    }
  }

  Future<Address> fetchPosAddress(double long, double lat) async {
    final Response response = await get(Uri.parse(
        'https://api-adresse.data.gouv.fr/reverse/?lon=$long&lat=$lat&limit=1'));
    if (response.statusCode == 200) {
      // Transformation du JSON (String) en Map<String, dynamic>
      final Map<String, dynamic> json = jsonDecode(response.body);
      if (json.containsKey("features")) {
        // Récupération des "features"
        final List<dynamic> features = json['features'];

        // Transformation de chaque "feature" en objet de type "Address"
        final Address address = Address.fromMap(
            features[0]['properties'], features[0]['geometry']['coordinates']);
        return address;
      } else {
        throw Exception('Failed to load addresses');
      }
    } else {
      throw Exception('Failed to load addresses');
    }
  }
}
