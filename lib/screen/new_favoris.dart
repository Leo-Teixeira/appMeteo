import 'package:app_meteo/object/adresseRepo.dart';
import 'package:app_meteo/object/meteoRepo.dart';
import 'package:app_meteo/screen/parameters.dart';
import 'package:app_meteo/services/api/adresse.dart';
import 'package:app_meteo/services/constante/constante.dart';
import 'package:app_meteo/services/function/location_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linecons_icons.dart';

// final MeteoProviderTest = ChangeNotifierProvider<MeteoNotifier>(
//   (ref) {
//     return MeteoNotifier();
//   },
// );

final MeteoProviderTest =
    StateNotifierProvider<MeteoNotifier, List<Address>>((ref) {
  return MeteoNotifier();
});

class SearchAddress extends ConsumerStatefulWidget {
  const SearchAddress({Key? key}) : super(key: key);

  @override
  ConsumerState<SearchAddress> createState() => _SearchAddressState();
}

class _SearchAddressState extends ConsumerState<SearchAddress> {
  List<Address> _addresses = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFBD1ACD),
        systemOverlayStyle: const SystemUiOverlayStyle(),
        // flexibleSpace: Container(
        //     decoration: const BoxDecoration(
        //         gradient: LinearGradient(
        //             colors: [Colors.purple, Colors.pink]))),
        title: const Text("Meteo App"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                ref.read(ThemeProvider.notifier).state =
                    ref.watch(ThemeProvider).name == "light"
                        ? ThemeApp.dark
                        : ThemeApp.light;
              },
              icon: ref.watch(ThemeProvider).name == "dark"
                  ? const Icon(FontAwesome5.moon)
                  : const Icon(FontAwesome5.sun)),
        ],
        shape: const RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        elevation: 20.0,
        shadowColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) async {
              if (value.length >= 3) {
                final AddressRepository addressRepository = AddressRepository();
                // Méthode 1
                List<Address> addresses =
                    await addressRepository.fetchAddresses(value);
                setState(() {
                  _addresses = addresses;
                });
              }
            },
          ),
          Expanded(
            child: ListView.separated(
              itemCount: _addresses.length,
              itemBuilder: (context, index) {
                final Address address = _addresses[index];
                return ListTile(
                  title: Text(address.street),
                  subtitle: Text('${address.postcode} ${address.city}'),
                  onTap: () {
                    ref.read(MeteoProviderTest.notifier).add(address);
                    Navigator.of(context).pop();
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(height: 0);
              },
            ),
          )
        ],
      ),
    );
  }
}
