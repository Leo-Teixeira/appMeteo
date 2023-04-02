import 'package:app_meteo/object/meteoRepo.dart';

List<Map<String, dynamic>> getMeteoHoraire(List<ForecastDay> horaireMeteo) {
  List<Map<String, dynamic>> listHourlyData = [];
  int dateNow = DateTime.now().hour;
  int lostValue = 0;
  print(horaireMeteo[0].hourly_data!.length);
  for (int i = 0; i < 24 + dateNow; i++) {
    if (i >= dateNow) {
      if (i <= 22) {
        listHourlyData.add({
          "time": "$i:00",
          "desc": horaireMeteo[0].condition,
          "tmp": horaireMeteo[0].hourly_data![i].tmp2m!.round().toString(),
          "icon": horaireMeteo[0].hourly_data![i].icon
        });
      } else {
        listHourlyData = getOtherDate(lostValue, listHourlyData, horaireMeteo);
        return listHourlyData;
      }
    } else {
      lostValue += 1;
    }
  }
  return listHourlyData;
}

getOtherDate(int value, List<Map<String, dynamic>> listHourlyData,
    List<ForecastDay> horaireMeteo) {
  for (int i = 0; i < value; i++) {
    listHourlyData.add({
      "time": "$i:00",
      "desc": horaireMeteo[0].condition,
      "tmp": horaireMeteo[1].hourly_data![i].tmp2m!.round().toString(),
      "icon": horaireMeteo[1].hourly_data![i].icon
    });
  }
  return listHourlyData;
}
