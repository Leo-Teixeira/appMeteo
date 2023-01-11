import 'package:app_meteo/object/adresseRepo.dart';
import 'package:app_meteo/screen/new_favoris.dart';
import 'package:app_meteo/services/function/location_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class NewLocation extends ConsumerWidget {
  const NewLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Address> list = ref.watch(MeteoProviderTest);
    return Scaffold(
      body: Center(
        child: ListView.separated(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: const Icon(Icons.apartment),
              title: Text(list[index].street),
              trailing: IconButton(
                onPressed: () {
                  ref.read(MeteoProviderTest.notifier).remove(list[index]);
                },
                icon: Icon(FontAwesome5.trash_alt),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(height: 0);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SearchAddress()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
