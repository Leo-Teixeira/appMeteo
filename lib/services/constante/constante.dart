import 'dart:convert';

import 'package:app_meteo/object/adresseRepo.dart';
import 'package:app_meteo/object/meteoRepo.dart';
import 'package:app_meteo/services/api/adresse.dart';
import 'package:app_meteo/services/api/meteo.dart';
import 'package:app_meteo/services/provider/location_function.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/meteocons_icons.dart';
import 'package:latlong2/latlong.dart';
import 'package:shared_preferences/shared_preferences.dart';

const sunIcon = Icon(Meteocons.sun);
const moonIcon = Icon(Meteocons.moon);
const rainIcon = Icon(Meteocons.rain);
const snowIcon = Icon(Meteocons.snow);
const thunderIcon = Icon(Meteocons.cloud_flash);

const primaryColor = Color(0xFFBD1ACD);

enum ThemeApp {
  light,
  dark,
}

final ThemeProvider = StateProvider((_) => ThemeApp.light);

final LocationProvider =
    StateNotifierProvider<Locationnotifier, List<Address>>((ref) {
  return Locationnotifier();
});

final MapProvider = StateNotifierProvider<MapPointNotifier, LatLng?>((ref) {
  return MapPointNotifier();
});

// final MeteoProvider = FutureProvider<Meteo>((ref) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   MeteoApi meteoApi = MeteoApi();
//   AddressRepository addressApi = AddressRepository();
//   Address address = await addressApi.fetchPosAddress(
//       double.parse(prefs.getString('long').toString()),
//       double.parse(prefs.getString('lat').toString()));
//   Meteo meteo = await meteoApi.getMeteo(address.city);
//   return meteo;
// });

final meteoProvider = StreamProvider((ref) async* {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  MeteoApi meteoApi = MeteoApi();
  AddressRepository addressApi = AddressRepository();
  Address address = await addressApi.fetchPosAddress(
      double.parse(prefs.getString('long').toString()),
      double.parse(prefs.getString('lat').toString()));
  Meteo meteo = await meteoApi.getMeteo(address.city);
  ref.watch(MapProvider.notifier).saveAddPoint(LatLng(
      double.parse(prefs.getString('lat').toString()),
      double.parse(prefs.getString('long').toString())));
  yield meteo;
});

final PreferenceNotifierProvider = FutureProvider<List<Address>>((ref) async {
  List<Address> listAdr = [];
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  listAdr.clear();
  if (prefs.getStringList("address") == null) {
    return [];
  } else {
    Map<String, dynamic> adr = {};
    listJson = prefs.getStringList('address')!;
    for (var i = 0; i < listJson.length; i++) {
      adr = jsonDecode(listJson[i]);
      listAdr.add(Address.fromMapJson(adr));
    }
    return listAdr;
  }
});
