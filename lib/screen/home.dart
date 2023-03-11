import 'package:app_meteo/services/provider/meteo_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/meteocons_icons.dart';

import 'package:app_meteo/services/constante/constante.dart';
import 'package:latlong2/latlong.dart';

class HomeWidget extends ConsumerWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> listTitleHight = ["Précipitation", "Vent ouest", "HUM"];
    final List<String> listTitleBottom = [
      "Vitesse vent",
      "Direction",
      "Pression"
    ];
    final List<String> listMeasureHight = ["mm", "km/h", "%"];
    final List<String> listMeasureBottom = ["km/h", "", "hPa"];
    List listValueHight = [];
    List listValueBottom = [];
    final getMeteo = ref.watch(meteoProvider);
    return Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: getMeteo.when(data: (data) {
          List<Map<String, dynamic>> horaireData =
              getMeteoHoraire(data.past_day);
          listValueHight = [
            "",
            data.current_meteo.wnd_gust,
            data.current_meteo.humidity
          ];
          listValueBottom = [
            data.current_meteo.wnd_spd,
            data.current_meteo.wnd_dir,
            data.current_meteo.pressure
          ];
          return SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Center(
                    child: Text(
                  data.info_city.name,
                  style: const TextStyle(fontSize: 25),
                )),
                Card(
                  elevation: 8,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  shadowColor: primaryColor,
                  margin: const EdgeInsets.all(20),
                  child: ListTile(
                    title: Column(
                      children: [
                        Image.network(
                          data.current_meteo.icon.toString(),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Text(data.current_meteo.condition),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Text(data.current_meteo.date),
                        ),
                      ],
                    ),
                    trailing: Text(
                      "${data.current_meteo.tmp}°",
                      style: const TextStyle(fontSize: 50),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Card(
                    elevation: 8,
                    // shape: const RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.all(Radius.circular(30))),
                    shadowColor: primaryColor,
                    // margin: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Prévision Horaire : "),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (int i = 0; i < horaireData.length; i++)
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(horaireData[i]['time']),
                                        Image.network(horaireData[i]['icon']),
                                        Text("${horaireData[i]['tmp']}°"),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 8,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  shadowColor: primaryColor,
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // for (int i = 0; i < 2; i++)

                      Row(
                        children: [
                          for (int i = 0; i < 3; i++)
                            getInfoRow(listTitleHight[i], listValueHight[i],
                                listMeasureHight[i]),
                        ],
                      ),
                      Row(
                        children: [
                          for (int i = 0; i < 3; i++)
                            getInfoRow(listTitleBottom[i], listValueBottom[i],
                                listMeasureBottom[i]),
                        ],
                      ),
                    ],
                  ),
                ),
                //faire un row afin de demander a afficher plus d'info
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 5; i++)
                        Container(
                          height: MediaQuery.of(context).size.height / 3,
                          width: MediaQuery.of(context).size.width / 3,
                          margin: const EdgeInsets.all(4),
                          child: Card(
                            shadowColor: primaryColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                            ),
                            elevation: 8,
                            margin: const EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  data.past_day[i].day_short.toString(),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(data.past_day[i].date.toString()),
                                Image.network(data.past_day[i].icon.toString()),
                                Text(
                                  "${(data.past_day[i].tmin! + data.past_day[i].tmax!) / 2}°",
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }, error: (Object error, StackTrace stackTrace) {
          print(error);
          print(stackTrace);
          return const Center(child: CircularProgressIndicator());
        }, loading: () {
          return const Center(child: CircularProgressIndicator());
        }));
  }
}

Widget getInfoRow(String title, String value, String measure) {
  return Expanded(
    child: ListTile(
      minLeadingWidth: 5,
      title: Text(
        title,
        style: const TextStyle(fontSize: 10),
      ),
      subtitle: Text(
        "$value $measure",
        style: const TextStyle(fontSize: 12),
      ),
    ),
  );
}
