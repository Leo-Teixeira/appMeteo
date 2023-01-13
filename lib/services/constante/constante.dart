import 'dart:convert';

import 'package:app_meteo/object/adresseRepo.dart';
import 'package:app_meteo/services/function/location_function.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/meteocons_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

const sunIcon = Icon(Meteocons.sun);
const moonIcon = Icon(Meteocons.moon);
const rainIcon = Icon(Meteocons.rain);
const snowIcon = Icon(Meteocons.snow);
const thunderIcon = Icon(Meteocons.cloud_flash);

enum ThemeApp {
  light,
  dark,
}

final ThemeProvider = StateProvider((_) => ThemeApp.light);

final LocationProvider =
    StateNotifierProvider<Locationnotifier, List<Address>>((ref) {
  return Locationnotifier();
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
      listAdr.add(Address.fromMap(adr));
    }
    return listAdr;
  }
});
