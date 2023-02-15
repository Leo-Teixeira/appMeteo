import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/meteocons_icons.dart';

import 'package:app_meteo/services/constante/constante.dart';

class HomeWidget extends ConsumerWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getMeteo = ref.watch(meteoProvider);
    return Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: getMeteo.when(data: (data) {
          print(data);
          return SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Card(
                  elevation: 8,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  shadowColor: primaryColor,
                  margin: const EdgeInsets.all(20),
                  child: ListTile(
                    title: Column(
                      children: [
                        const Icon(
                          Meteocons.rain,
                          size: 100,
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
                    // subtitle: Container(
                    //   child: Text("15 janvier 2023"),
                    //   margin: EdgeInsets.fromLTRB(0, 200, 0, 0),
                    //   alignment: AlignmentDirectional.bottomStart,
                    // ),
                    // leading: Text("test"),
                    trailing: Text(
                      "${data.current_meteo.tmp}°",
                      style: const TextStyle(fontSize: 50),
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
                      for (int i = 0; i < 2; i++)
                        Row(
                          children: [
                            for (int i = 0; i < 3; i++) getInfoRow("title", "")
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
                      for (int i = 0; i < 7; i++)
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
                              children: const [
                                Text(
                                  "Mon",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("13 Feb"),
                                Icon(
                                  Meteocons.sun,
                                  size: 50,
                                ),
                                Text(
                                  "26°",
                                  style: TextStyle(
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
          return const CircularProgressIndicator();
        }, loading: () {
          print("je load");
          return const CircularProgressIndicator();
        }));
  }
}

Widget getInfoRow(String title, String value) {
  return Expanded(
    child: ListTile(
      minLeadingWidth: 5,
      leading: const Icon(Meteocons.snow),
      title: Text(
        title,
        style: const TextStyle(fontSize: 7),
      ),
      subtitle: Text(value),
    ),
  );
}
