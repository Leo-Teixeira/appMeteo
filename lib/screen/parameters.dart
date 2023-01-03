import 'package:flutter/material.dart';

class ParametersWidget extends StatefulWidget {
  const ParametersWidget({super.key});

  @override
  State<ParametersWidget> createState() => _ParametersWidgetState();
}

class _ParametersWidgetState extends State<ParametersWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Retour"),
      ),
      body: const Center(child: Text("test")),
    );
  }
}
