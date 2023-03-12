import 'package:app_meteo/services/constante/constante.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        title: const Text("Retour"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                ref.refresh(meteoProvider);
              },
              child: const Text("Météo de ma ville"),
            ),
            const CircleAvatar(
              child: Icon(Icons.abc),
            ),
            const Text("Created by Léo Teixeira"),
          ],
        ),
      ),
    );
  }
}
