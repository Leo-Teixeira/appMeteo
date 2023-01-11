import 'package:app_meteo/object/adresseRepo.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod/riverpod.dart';

class MeteoNotifier extends StateNotifier<List<Address>> {
  MeteoNotifier() : super([]);

  void add(Address address) {
    state = [...state, address];
  }

  void remove(Address address) {
    state = [
      for (final adr in state)
        if (adr.city != address.city) adr,
    ];
  }
}

// class MeteoNotifier extends ChangeNotifier {
//   List<Address> list = [];

//   void add(Address address) {
//     list.add(address);
//     notifyListeners();
//   }

//   void remove(Address address) {
//     list.remove(address);
//     notifyListeners();
//   }
// }
