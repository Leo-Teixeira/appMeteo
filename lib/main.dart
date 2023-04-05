import 'package:app_meteo/services/constante/bottomAppBar.dart';
import 'package:app_meteo/services/provider/location_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getPos();
  runApp(
    const ProviderScope(child: BottomAppBarWidget()),
  );
}
