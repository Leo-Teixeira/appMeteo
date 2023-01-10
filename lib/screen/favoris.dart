import 'package:app_meteo/screen/new_favoris.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewLocation extends ConsumerWidget {
  const NewLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final test = ref.watch(MeteoProviderTest);
    return Scaffold(
      body: Center(
        child: Text(test.toString()),
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
