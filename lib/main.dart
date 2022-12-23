import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:fluttericon/meteocons_icons.dart';

final helloWorldProvider = Provider<int>((_) => 0);

void main() {
  runApp(
    const HomeWidget(),
  );
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Faire le dark theme avec provider par la suite
      theme: ThemeData.dark(),
      darkTheme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: const HomeWidgetState(),
    );
  }
}

class HomeWidgetState extends StatefulWidget {
  const HomeWidgetState({super.key});

  @override
  State<HomeWidgetState> createState() => _HomeWidgetStateState();
}

class _HomeWidgetStateState extends State<HomeWidgetState> {
  late bool mode;

  @override
  void initState() {
    super.initState();
    mode = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFBD1ACD),
        systemOverlayStyle: const SystemUiOverlayStyle(),
        // flexibleSpace: Container(
        //     decoration: const BoxDecoration(
        //         gradient: LinearGradient(
        //             colors: [Colors.purple, Colors.pink]))),
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Linecons.params)),
        title: const Text("Meteo App"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  mode = !mode;
                });
              },
              icon: mode
                  ? const Icon(FontAwesome5.moon)
                  : const Icon(FontAwesome5.sun)),
        ],
        shape: const RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        elevation: 20.0,
        shadowColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height / 3,
                child: Card(
                  elevation: 8,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  shadowColor: const Color(0xFFBD1ACD),
                  margin: const EdgeInsets.all(20),
                  child: ListTile(
                    title: Expanded(
                      child: Column(
                        children: [
                          const Icon(
                            Meteocons.rain,
                            size: 100,
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: const Text("Il Pleut"),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: const Text("15 janvier 2023"),
                          ),
                        ],
                      ),
                    ),
                    // subtitle: Container(
                    //   child: Text("15 janvier 2023"),
                    //   margin: EdgeInsets.fromLTRB(0, 200, 0, 0),
                    //   alignment: AlignmentDirectional.bottomStart,
                    // ),
                    // leading: Text("test"),
                    trailing: const Text(
                      "21°",
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                )),
            SizedBox(
                height: MediaQuery.of(context).size.height / 3.7,
                child: Card(
                  elevation: 8,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  shadowColor: const Color(0xFFBD1ACD),
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = 0; i < 2; i++)
                        Row(
                          children: [
                            for (int i = 0; i < 3; i++)
                              const Expanded(
                                child: ListTile(
                                  minLeadingWidth: 5,
                                  leading: Icon(Meteocons.snow),
                                  title: Text(
                                    "Text Valeur",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  subtitle: Text("26%"),
                                ),
                              )
                          ],
                        )
                    ],
                  ),
                )),
            //faire un row afin de demander a afficher plus d'info
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 4; i++)
                    Card(
                      shadowColor: const Color(0xFFBD1ACD),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      elevation: 8,
                      margin: const EdgeInsets.all(20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 7.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Mon",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            Text("13 Feb"),
                            Icon(
                              Meteocons.sun,
                              size: 50,
                            ),
                            Text(
                              "26°",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
