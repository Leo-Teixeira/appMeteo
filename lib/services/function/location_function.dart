import 'package:app_meteo/object/adresseRepo.dart';
import 'package:app_meteo/object/meteoRepo.dart';
import 'package:riverpod/riverpod.dart';

class MeteoNotifier extends StateNotifier<List<Address>> {
  MeteoNotifier([List<Address>? initialLocation])
      : super(initialLocation ?? []);

  addLocation(Address address) {
    state = [...state, address];
  }

  listAddress() {
    return state;
  }
}
