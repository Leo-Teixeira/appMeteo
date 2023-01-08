// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Meteo {
  final cityInfo info_city;
  final CurrentCondition current_meteo;
  final List<ForecastDay> past_day;

  Meteo({
    required this.info_city,
    required this.current_meteo,
    required this.past_day,
  });
}

class cityInfo {
  final String name;
  final String country;
  final String latitude;
  final String longitude;
  final String elevation;
  final String sunrise;
  final String sunset;

  cityInfo({
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

  factory cityInfo.fromMap(Map<String, dynamic> map) {
    return cityInfo(
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

  CurrentCondition({
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
      tmp: map['tmp'] as String,
      wnd_spd: map['wnd_spd'] as String,
      wnd_gust: map['wnd_gust'] as String,
      wnd_dir: map['wnd_dir'] as String,
      pressure: map['pressure'] as String,
      humidity: map['humidity'] as String,
      condition: map['condition'] as String,
      condition_key: map['condition_key'] as String,
      icon: map['icon'] as String,
      icon_big: map['icon_big'] as String,
    );
  }
}

class ForecastDay {
  final String date;
  final String day_short;
  final String day_long;
  final String tmin;
  final String tmax;
  final String condition;
  final String condition_key;
  final String icon;
  final String icon_big;
  final hourlyMeteo hourly_data;

  ForecastDay({
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
      'hourly_data': hourly_data.toMap(),
    };
  }

  factory ForecastDay.fromMap(
      Map<String, dynamic> map, hourlyMeteo hour_meteo) {
    return ForecastDay(
      date: map['date'] as String,
      day_short: map['day_short'] as String,
      day_long: map['day_long'] as String,
      tmin: map['tmin'] as String,
      tmax: map['tmax'] as String,
      condition: map['condition'] as String,
      condition_key: map['condition_key'] as String,
      icon: map['icon'] as String,
      icon_big: map['icon_big'] as String,
      hourly_data: hour_meteo,
    );
  }
}

class hourlyMeteo {
  final String icon;
  final String condition;
  final String condition_key;
  final double tmp2m;
  final double dpt2m;
  final double wndchill2m;
  final String humidex;
  final int rh2m;
  final double prmsl;
  final int apcpsfc;
  final int wndspd10m;
  final int wnddir10m;
  final String wnddircard10;
  final int issnow;
  final String hcdc;
  final String mcdc;
  final String lcdc;
  final int hgtoc;
  final int kindex;
  final String cape1800;
  final double cin1800;

  hourlyMeteo({
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

  factory hourlyMeteo.fromMap(Map<String, dynamic> map) {
    return hourlyMeteo(
      icon: map['icon'] as String,
      condition: map['condition'] as String,
      condition_key: map['condition_key'] as String,
      tmp2m: map['tmp2m'] as double,
      dpt2m: map['dpt2m'] as double,
      wndchill2m: map['wndchill2m'] as double,
      humidex: map['humidex'] as String,
      rh2m: map['rh2m'] as int,
      prmsl: map['prmsl'] as double,
      apcpsfc: map['apcpsfc'] as int,
      wndspd10m: map['wndspd10m'] as int,
      wnddir10m: map['wnddir10m'] as int,
      wnddircard10: map['wnddircard10'] as String,
      issnow: map['issnow'] as int,
      hcdc: map['hcdc'] as String,
      mcdc: map['mcdc'] as String,
      lcdc: map['lcdc'] as String,
      hgtoc: map['hgtoc'] as int,
      kindex: map['kindex'] as int,
      cape1800: map['cape1800'] as String,
      cin1800: map['cin1800'] as double,
    );
  }
}
