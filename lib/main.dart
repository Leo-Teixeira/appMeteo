import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:app_meteo/services/constante/bottomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:fluttericon/meteocons_icons.dart';

final helloWorldProvider = Provider<int>((_) => 0);

void main() {
  runApp(
    const Main(),
  );
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Faire le dark theme avec provider par la suite
      debugShowCheckedModeBanner: false,
      home: const BottomAppBarWidget(),
    );
  }
}
