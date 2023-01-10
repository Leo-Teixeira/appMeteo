import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/meteocons_icons.dart';

const sunIcon = Icon(Meteocons.sun);
const moonIcon = Icon(Meteocons.moon);
const rainIcon = Icon(Meteocons.rain);
const snowIcon = Icon(Meteocons.snow);
const thunderIcon = Icon(Meteocons.cloud_flash);

enum ThemeApp {
  light,
  dark,
}

final ThemeProvider = StateProvider((_) => ThemeApp.light);
