import 'dart:async';
import 'dart:convert';

import 'package:app_meteo/object/adresseRepo.dart';
import 'package:app_meteo/object/meteoRepo.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Locationnotifier extends StateNotifier<List<Address>> {
  Locationnotifier() : super([]);

  //passer les preference en tant que liste initial

  void add(Address address) {
    saveAdr(address);
    state = [...state, address];
  }

  void addListAdr(List<Address> address) {
    state = address;
  }

  void remove(Address address, int index) {
    deleteAdr(index);
    state = [
      for (final adr in state)
        if (adr.city != address.city) adr,
    ];
  }

  void getAddress() async {
    List<Address> addressList = await getPoint();
    state = addressList;
  }
}

class MapPointNotifier extends StateNotifier<LatLng?> {
  MapPointNotifier() : super(null);

  //passer les preference en tant que liste initial

  void saveAddPoint(LatLng address) {
    state = address;
  }
}

class MeteoNotifier extends StateNotifier<Meteo> {
  MeteoNotifier(super.state);

  void addMeteo(Meteo meteo) {
    state = meteo;
  }
}

List<String> listJson = [];

getPoint() async {
  List<Address> addresseList = [];
  Map<String, dynamic> decode = {};
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  listJson = prefs.getStringList("address")!;
  if (listJson.isNotEmpty) {
    for (int i = 0; i < listJson.length; i++) {
      decode = jsonDecode(listJson[i]);
      addresseList.add(Address.fromMapJson(decode));
    }
  }
  return addresseList;
}

getPos() async {
  LocationPermission perm = await Geolocator.checkPermission();
  if (perm == LocationPermission.denied ||
      perm == LocationPermission.deniedForever) {
    perm = await Geolocator.requestPermission();
    if (perm == LocationPermission.denied ||
        perm == LocationPermission.deniedForever) {
      addPos(0.0, 0.0);
    }
  }
  Position getPos = await Geolocator.getCurrentPosition();
  addPos(getPos.latitude, getPos.longitude);
}

Future<void> saveAdr(Address address) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getStringList("address") == null) {
    listJson.add(jsonEncode(address.toMap()));
  } else {
    listJson = prefs.getStringList("address")!;
    listJson.add(jsonEncode(address.toMap()));
  }
  prefs.setStringList('address', listJson);
}

Future<void> deleteAdr(int addressIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  listJson = prefs.getStringList('address')!;
  listJson.removeAt(addressIndex);
  prefs.setStringList('address', listJson);
}

Future<void> addPos(double lat, double long) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("lat", lat.toString());
  prefs.setString("long", long.toString());
}

final loadMapPoint = FutureProvider<LatLng>((ref) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return LatLng(double.parse(prefs.getString("lat").toString()),
      double.parse(prefs.getString("long").toString()));
});
