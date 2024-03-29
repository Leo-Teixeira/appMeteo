import 'package:app_meteo/object/adresseRepo.dart';
import 'package:app_meteo/services/api/adresse.dart';
import 'package:app_meteo/services/constante/constante.dart';
import 'package:app_meteo/services/provider/location_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class SearchAddress extends ConsumerStatefulWidget {
  const SearchAddress({Key? key}) : super(key: key);

  @override
  ConsumerState<SearchAddress> createState() => _SearchAddressState();
}

class _SearchAddressState extends ConsumerState<SearchAddress> {
  List<Address> _addresses = [];
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ListMode mode = ref.watch(listModeProviderState);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFBD1ACD),
        systemOverlayStyle: const SystemUiOverlayStyle(),
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
            style: const TextStyle(color: Colors.black),
            controller: controller,
            decoration: InputDecoration(
              hintStyle: const TextStyle(color: Colors.black),
              hintText: 'Rechercher une ville...',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: Color(0xFFBD1ACD),
              ),
              suffixIcon: mode == ListMode.SEARCH
                  ? IconButton(
                      color: const Color(0xFFBD1ACD),
                      onPressed: () {
                        controller.clear();
                        ref
                            .watch(listModeProviderState.notifier)
                            .update((state) => ListMode.LIST);
                      },
                      icon: const Icon(
                        Icons.cancel,
                        size: 20,
                      ),
                    )
                  : null,
            ),
            onChanged: (value) async {
              if (value.length >= 3) {
                final AddressRepository addressRepository = AddressRepository();
                // Méthode 1
                List<Address> addresses =
                    await addressRepository.fetchAddresses(value);
                ref
                    .watch(listModeProviderState.notifier)
                    .update((state) => ListMode.SEARCH);
                setState(() {
                  _addresses = addresses;
                });
              }
            },
          ),
          Expanded(
            child: mode == ListMode.SEARCH
                ? ListView.separated(
                    itemCount: _addresses.length,
                    itemBuilder: (context, index) {
                      final Address address = _addresses[index];
                      return ListTile(
                        title: Text(address.street),
                        subtitle: Text('${address.postcode} ${address.city}'),
                        onTap: () {
                          ref.read(LocationProvider.notifier).add(address);
                          Navigator.of(context).pop();
                        },
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(height: 0);
                    },
                  )
                : Container(),
          )
        ],
      ),
    );
  }
}
