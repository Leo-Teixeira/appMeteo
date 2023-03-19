import 'package:app_meteo/services/constante/bottomAppBar.dart';
import 'package:app_meteo/services/provider/location_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

import 'package:app_meteo/screen/new_favoris.dart';
import 'package:app_meteo/services/constante/constante.dart';
import 'package:latlong2/latlong.dart';

class NewLocation extends ConsumerWidget {
  const NewLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: body(ref),
      floatingActionButton: addFavorisButton(context),
    );
  }
}

Widget body(WidgetRef ref) {
  final list = ref.watch(LocationProvider);
  return Center(
    child: ListView.separated(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          onTap: () {
            addPos(list[index].lat ?? 0.0, list[index].long ?? 0.0);
            ref.refresh(meteoProvider);
            ref
                .watch(MapProvider.notifier)
                .saveAddPoint(LatLng(list[index].lat ?? 0.0, list[index].long ?? 0.0));
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const BottomAppBarWidgetState()));
          },
          leading: const Icon(Icons.apartment),
          title: Text(list[index].street),
          subtitle: Text(list[index].city),
          trailing: IconButton(
            onPressed: () {
              ref.read(LocationProvider.notifier).remove(list[index], index);
            },
            icon: const Icon(FontAwesome5.trash_alt),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(height: 0);
      },
    ),
  );
}

Widget addFavorisButton(BuildContext context) {
  return FloatingActionButton(
    onPressed: () async {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const SearchAddress()));
    },
    child: const Icon(Icons.add),
  );
}
