import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:fluttericon/meteocons_icons.dart';
import 'package:riverpod/riverpod.dart';

class HomeWidgetState extends StatefulWidget {
  const HomeWidgetState({super.key});

  @override
  State<HomeWidgetState> createState() => _HomeWidgetStateState();
}

class _HomeWidgetStateState extends State<HomeWidgetState> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Card(
              elevation: 8,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              shadowColor: const Color(0xFFBD1ACD),
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
                      child: const Text("Il Pleut"),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: const Text("15 janvier 2023"),
                    ),
                  ],
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
            ),
            Card(
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
                                style: TextStyle(fontSize: 7),
                              ),
                              subtitle: Text("26%"),
                            ),
                          ),
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
                        shadowColor: const Color(0xFFBD1ACD),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        elevation: 8,
                        margin: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text(
                              "Mon",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
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
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
