import 'dart:convert';
import 'package:app_meteo/object/meteoRepo.dart';
import 'package:http/http.dart' as http;

class MeteoApi {
  Future<Meteo> getMeteo(String location) async {
    final apiUrl =
        Uri.parse("https://prevision-meteo.ch/services/json/$location");
    final response = await http.get(
      apiUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
    );
    if (response.statusCode == 200) {
      final List<ForecastDay> listForecats = [];
      final List<HourlyMeteo> listHourlyData = [];
      final Map<String, dynamic> json = jsonDecode(response.body);
      final CityInfo infoCity = CityInfo.fromMap(json['city_info']);
      final CurrentCondition currentCondition =
          CurrentCondition.fromMap(json['current_condition']);
      for (int i = 0; i < 5; i++) {
        final Map<String, dynamic> listHourly = json['fcst_day_$i'];
        for (int j = 0; j < 23; j++) {
          listHourlyData
              .add(HourlyMeteo.fromMap(listHourly['hourly_data']['${j}H00']));
        }
        listForecats.add(ForecastDay.fromMap(listHourly, listHourlyData));
        listHourlyData.clear();
      }
      print(listForecats[0].hourly_data!.length);
      final Meteo meteo = Meteo(
          info_city: infoCity,
          current_meteo: currentCondition,
          past_day: listForecats);
      return meteo;
    } else {
      throw Exception('failed to login');
    }
  }
}
