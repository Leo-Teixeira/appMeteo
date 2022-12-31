import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
          //  mapController: ...,
          options: MapOptions(
            // center: Lat,
            zoom: 13.0,
            maxZoom: 19.0,
            keepAlive: true,
            interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
              retinaMode: MediaQuery.of(context).devicePixelRatio > 1.0,
            ),
          ]),
    );
  }
}
