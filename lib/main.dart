import 'package:app_meteo/services/constante/bottomAppBar.dart';
import 'package:app_meteo/services/provider/location_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getPos();
  runApp(
    const ProviderScope(child: Main()),
  );
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomAppBarWidget(),
    );
  }
}
