import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ParametersWidget extends ConsumerWidget {
  const ParametersWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFBD1ACD),
        systemOverlayStyle: const SystemUiOverlayStyle(),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text("Retour"),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        elevation: 20.0,
        shadowColor: Colors.blueGrey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/rocket-removebg.png"),
          const Text("Created by Léo Teixeira"),
        ],
      ),
    );
  }
}
