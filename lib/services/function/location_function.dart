import 'dart:async';
import 'dart:convert';

import 'package:app_meteo/object/adresseRepo.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Locationnotifier extends StateNotifier<List<Address>> {
  //passer les preference en tant que liste initial
  Locationnotifier() : super([]);

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
}

List<String> listJson = [];

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
  print(prefs.getStringList("address"));
}
