import 'package:app_meteo/object/adresseRepo.dart';
import 'package:app_meteo/services/constante/constante.dart';
import 'package:app_meteo/services/provider/location_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:latlong2/latlong.dart';

class MapWidget extends ConsumerWidget {
  const MapWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LatLng point = ref.watch(MapProvider.notifier).state!;
    List<Address> addressList = ref.watch(LocationProvider.notifier).state;
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center: point,
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
          MarkerLayer(
            markers: [
              for (int i = 0; i < addressList.length; i++)
                Marker(
                  point: LatLng(addressList[i].lat ?? 0.0, addressList[i].long ?? 0.0),
                  width: 50,
                  height: 50,
                  builder: (context) => const Icon(
                    FontAwesome5.map_marker_alt,
                    color: primaryColor,
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
