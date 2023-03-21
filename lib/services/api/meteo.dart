import 'dart:convert';
import 'package:app_meteo/object/meteoRepo.dart';
import 'package:http/http.dart' as http;

class MeteoApi {
  Future<Meteo> getMeteo(String location) async {
    String locationMeteo = location.toLowerCase();
    final apiUrl =
        Uri.parse("https://prevision-meteo.ch/services/json/$locationMeteo");
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
      Map<String, dynamic> listHourly = {};
      final CurrentCondition currentCondition =
          CurrentCondition.fromMap(json['current_condition']);
      for (int i = 0; i < 5; i++) {
        listHourly = json['fcst_day_$i'];
        // print(listHourly);
        listHourlyData.clear();
        for (int j = 0; j <= 22; j++) {
          listHourlyData
              .add(HourlyMeteo.fromMap(listHourly['hourly_data']['${j}H00']));
          // print('------------------------------------');
          // print(listHourly['hourly_data']['${j}H00']['TMP2m']);
          // print("${i} day");
          // print("${j} heure");
          // print('ebdfhzbfuzjebvfuizbvfhuzebvuz');
        }
        listForecats.add(ForecastDay.fromMap(listHourly, listHourlyData));
        print(listForecats[i].hourly_data![0].tmp2m);
      }
      print('--------------------------');
      for (int i = 0; i < listForecats.length; i++) {
        print(listForecats[i].hourly_data![1].tmp2m);
      }
      // print(listForecats[0].hourly_data![0].tmp2m);
      // print(listForecats[1].hourly_data![0].tmp2m);
      // print(listForecats[3].hourly_data![0].tmp2m);
      // print(listForecats[0]);
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
