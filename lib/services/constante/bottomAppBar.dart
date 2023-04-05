// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linecons_icons.dart';

import 'package:app_meteo/object/adresseRepo.dart';
import 'package:app_meteo/screen/favoris.dart';
import 'package:app_meteo/screen/home.dart';
import 'package:app_meteo/screen/map.dart';
import 'package:app_meteo/screen/parameters.dart';
import 'package:app_meteo/services/constante/constante.dart';

class BottomAppBarWidget extends ConsumerWidget {
  const BottomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: ref.watch(ThemeProvider).name == "light"
          ? ThemeData.light()
          : ThemeData.dark(),
      title: "APP METEO",
      debugShowCheckedModeBanner: false,
      home: const BottomAppBarWidgetState(),
    );
  }
}

class BottomAppBarWidgetState extends ConsumerStatefulWidget {
  const BottomAppBarWidgetState({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BottomAppBarWidgetStateState();
}

class _BottomAppBarWidgetStateState
    extends ConsumerState<BottomAppBarWidgetState> {
  final List<Widget> _widgetOptions = [];
  int _selectedIndex = 1;
  late String text;

  @override
  void initState() {
    super.initState();
    _widgetOptions
        .addAll([const MapWidget(), const HomeWidget(), const NewLocation()]);
  }

  _onItemTapped(int index) async {
    if (index == 2) {
      List<Address> list =
          await ref.refresh(PreferenceNotifierProvider.future).then((value) {
        return value;
      });
      ref.watch(LocationProvider.notifier).addListAdr(list);
    }
    if (index == 0) {
      ref.watch(LocationProvider.notifier).getAddress();
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, ref),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: bottomAppBar(_selectedIndex, _onItemTapped));
  }
}

PreferredSizeWidget? appBar(BuildContext context, WidgetRef ref) {
  return AppBar(
    backgroundColor: const Color(0xFFBD1ACD),
    systemOverlayStyle: const SystemUiOverlayStyle(),
    leading: IconButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: ((context) => const ParametersWidget())));
        },
        icon: const Icon(Linecons.params)),
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
  );
}

Widget bottomAppBar(int selectedIndex, Function(int)? onItemTapped) {
  return BottomNavigationBar(
    enableFeedback: true,
    type: BottomNavigationBarType.fixed,
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(FontAwesome5.map_marked_alt),
        label: 'Carte',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Acceuil',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite_sharp),
        label: 'Favoris',
      ),
    ],
    selectedItemColor: Colors.amber,
    unselectedItemColor: Colors.grey,
    selectedIconTheme: const IconThemeData(color: Colors.amberAccent),
    unselectedIconTheme: const IconThemeData(color: Colors.grey),
    selectedFontSize: 12,
    unselectedFontSize: 12,
    currentIndex: selectedIndex,
    onTap: onItemTapped,
  );
}
