import 'package:app_meteo/screen/home.dart';
import 'package:app_meteo/screen/map.dart';
import 'package:app_meteo/screen/parameters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod/riverpod.dart';

enum Theme {
  light,
  dark,
}

final ThemeProvider = StateProvider((_) => Theme.light);

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
  late bool mode;
  late String text;

  @override
  void initState() {
    super.initState();
    _widgetOptions.addAll(
        [const MapWidget(), const HomeWidgetState(), const HomeWidgetState()]);
    mode = false;
  }

  _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
  }

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
                // setState(() {
                //   mode = !mode;
                // });
                ref.read(ThemeProvider.notifier).state =
                    ref.watch(ThemeProvider).name == "light"
                        ? Theme.dark
                        : Theme.light;
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
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
