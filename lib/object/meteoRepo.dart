// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';

@immutable
class Meteo {
  final CityInfo info_city;
  final CurrentCondition current_meteo;
  final List<ForecastDay> past_day;

  const Meteo({
    required this.info_city,
    required this.current_meteo,
    required this.past_day,
  });
}

@immutable
class CityInfo {
  final String name;
  final String country;
  final String latitude;
  final String longitude;
  final String elevation;
  final String sunrise;
  final String sunset;

  const CityInfo({
    required this.name,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.elevation,
    required this.sunrise,
    required this.sunset,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'country': country,
      'latitude': latitude,
      'longitude': longitude,
      'elevation': elevation,
      'sunrise': sunrise,
      'sunset': sunset,
    };
  }

  factory CityInfo.fromMap(Map<String, dynamic> map) {
    return CityInfo(
      name: map['name'] as String,
      country: map['country'] as String,
      latitude: map['latitude'] as String,
      longitude: map['longitude'] as String,
      elevation: map['elevation'] as String,
      sunrise: map['sunrise'] as String,
      sunset: map['sunset'] as String,
    );
  }
}

@immutable
class CurrentCondition {
  final String date;
  final String hour;
  final String tmp;
  final String wnd_spd;
  final String wnd_gust;
  final String wnd_dir;
  final String pressure;
  final String humidity;
  final String condition;
  final String condition_key;
  final String icon;
  final String icon_big;

  const CurrentCondition({
    required this.date,
    required this.hour,
    required this.tmp,
    required this.wnd_spd,
    required this.wnd_gust,
    required this.wnd_dir,
    required this.pressure,
    required this.humidity,
    required this.condition,
    required this.condition_key,
    required this.icon,
    required this.icon_big,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'hour': hour,
      'tmp': tmp,
      'wnd_spd': wnd_spd,
      'wnd_gust': wnd_gust,
      'wnd_dir': wnd_dir,
      'pressure': pressure,
      'humidity': humidity,
      'condition': condition,
      'condition_key': condition_key,
      'icon': icon,
      'icon_big': icon_big,
    };
  }

  factory CurrentCondition.fromMap(Map<String, dynamic> map) {
    return CurrentCondition(
      date: map['date'] as String,
      hour: map['hour'] as String,
      tmp: map['tmp'].toString(),
      wnd_spd: map['wnd_spd'].toString(),
      wnd_gust: map['wnd_gust'].toString(),
      wnd_dir: map['wnd_dir'] as String,
      pressure: map['pressure'].toString(),
      humidity: map['humidity'].toString(),
      condition: map['condition'] as String,
      condition_key: map['condition_key'] as String,
      icon: map['icon'] as String,
      icon_big: map['icon_big'] as String,
    );
  }
}

@immutable
class ForecastDay {
  final String? date;
  final String? day_short;
  final String? day_long;
  final int? tmin;
  final int? tmax;
  final String? condition;
  final String? condition_key;
  final String? icon;
  final String? icon_big;
  final List<HourlyMeteo>? hourly_data;

  const ForecastDay({
    required this.date,
    required this.day_short,
    required this.day_long,
    required this.tmin,
    required this.tmax,
    required this.condition,
    required this.condition_key,
    required this.icon,
    required this.icon_big,
    required this.hourly_data,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'day_short': day_short,
      'day_long': day_long,
      'tmin': tmin,
      'tmax': tmax,
      'condition': condition,
      'condition_key': condition_key,
      'icon': icon,
      'icon_big': icon_big,
      'hourly_data': hourly_data?.map((x) => x.toMap()).toList(),
    };
  }

  factory ForecastDay.fromMap(
      Map<String, dynamic> map, List<HourlyMeteo> hourlyData) {
    return ForecastDay(
      date: map['date'] != null ? map['date'] as String : null,
      day_short: map['day_short'] != null ? map['day_short'] as String : null,
      day_long: map['day_long'] != null ? map['day_long'] as String : null,
      tmin: map['tmin'] != null ? map['tmin'] as int : null,
      tmax: map['tmax'] != null ? map['tmax'] as int : null,
      condition: map['condition'] != null ? map['condition'] as String : null,
      condition_key:
          map['condition_key'] != null ? map['condition_key'] as String : null,
      icon: map['icon'] != null ? map['icon'] as String : null,
      icon_big: map['icon_big'] != null ? map['icon_big'] as String : null,
      hourly_data: hourlyData,
    );
  }
}

@immutable
class HourlyMeteo {
  final String? icon;
  final String? condition;
  final String? condition_key;
  final num? tmp2m;
  final num? dpt2m;
  final num? wndchill2m;
  final num? humidex;
  final num? rh2m;
  final num? prmsl;
  final num? apcpsfc;
  final num? wndspd10m;
  final num? wndgust10m;
  final num? wnddir10m;
  final String? wnddircard10;
  final int? issnow;
  final String? hcdc;
  final String? mcdc;
  final String? lcdc;
  final num? hgtoc;
  final num? kindex;
  final String? cape1800;
  final num? cin1800;

  const HourlyMeteo({
    required this.icon,
    required this.condition,
    required this.condition_key,
    required this.tmp2m,
    required this.dpt2m,
    required this.wndchill2m,
    required this.humidex,
    required this.rh2m,
    required this.prmsl,
    required this.apcpsfc,
    required this.wndspd10m,
    required this.wndgust10m,
    required this.wnddir10m,
    required this.wnddircard10,
    required this.issnow,
    required this.hcdc,
    required this.mcdc,
    required this.lcdc,
    required this.hgtoc,
    required this.kindex,
    required this.cape1800,
    required this.cin1800,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'icon': icon,
      'condition': condition,
      'condition_key': condition_key,
      'tmp2m': tmp2m,
      'dpt2m': dpt2m,
      'wndchill2m': wndchill2m,
      'humidex': humidex,
      'rh2m': rh2m,
      'prmsl': prmsl,
      'apcpsfc': apcpsfc,
      'wndspd10m': wndspd10m,
      'wndgust10m': wndgust10m,
      'wnddir10m': wnddir10m,
      'wnddircard10': wnddircard10,
      'issnow': issnow,
      'hcdc': hcdc,
      'mcdc': mcdc,
      'lcdc': lcdc,
      'hgtoc': hgtoc,
      'kindex': kindex,
      'cape1800': cape1800,
      'cin1800': cin1800,
    };
  }

  factory HourlyMeteo.fromMap(Map<String, dynamic> map) {
    return HourlyMeteo(
      icon: map['ICON'] ?? "Pas d'icone",
      condition: map['CONDITION'] ?? "pas de condition",
      condition_key: map['CONDITION_KEY'] ?? "pas de key",
      tmp2m: map['TMP2m'] ?? 0.0,
      dpt2m: map['DPT2m'] ?? 0.0,
      wndchill2m: map['WNDCHILL2m'] ?? 0.0,
      humidex: map['HUMIDEX'] ?? 0.0,
      rh2m: map['RH2m'] ?? 0,
      prmsl: map['PRMSL'] ?? 0.0,
      apcpsfc: map['APCPsfc'] ?? 0.0,
      wndspd10m: map['WNDSPD10m'] ?? 0,
      wndgust10m: map['WNDGUST10m'] ?? 0,
      wnddir10m: map['WNDDIR10m'] ?? 0,
      wnddircard10: map['WNDDIRCARD10'] ?? "pas de donnée",
      issnow: map['ISSNOW'] ?? 0,
      hcdc: map['HCDC'] ?? "pas de donnée",
      mcdc: map['MCDC'] ?? "pas de donnée",
      lcdc: map['LCDC'] ?? "pas de donnée",
      hgtoc: map['HGT0C'] ?? 0,
      kindex: map['KINDEX'] ?? 0,
      cape1800: map['CAPE180_0'] ?? "pas de donnée",
      cin1800: map['CIN180_0'] ?? 0,
    );
  }
}
