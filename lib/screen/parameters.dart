import 'package:app_meteo/services/constante/constante.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/linecons_icons.dart';

// class ParametersWidget extends StatefulWidget {
//   const ParametersWidget({super.key});

//   @override
//   State<ParametersWidget> createState() => _ParametersWidgetState();
// }

// class _ParametersWidgetState extends State<ParametersWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Retour"),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             TextButton(onPressed: () {
//             }, child: const Text("Météo de ma ville"))
//           ],
//         ),
//       ),
//     );
//   }
// }

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
      body: const Center(
        child: Text("Created by Léo Teixeira"),
      ),
    );
  }
}
