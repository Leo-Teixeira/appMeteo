import 'package:app_meteo/object/meteoRepo.dart';
import 'package:app_meteo/services/constante/constante.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForecastInfo extends ConsumerWidget {
  final ForecastDay infoDay;
  const ForecastInfo({super.key, required this.infoDay});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(infoDay.hourly_data!.length);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFBD1ACD),
        systemOverlayStyle: const SystemUiOverlayStyle(),
        title: const Text("Retour"),
        shape: const RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        elevation: 20.0,
        shadowColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          const Text("Prévision Météo"),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 8,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    shadowColor: primaryColor,
                    margin: const EdgeInsets.all(20),
                    child: ListTile(
                      leading: Image.network(
                        infoDay.hourly_data![index].icon.toString(),
                      ),
                      title: Text(
                        infoDay.hourly_data![index].condition ??
                            "Condition météo indisponible",
                        style: const TextStyle(),
                      ),
                      subtitle: Text("${index.toString()}:00"),
                      trailing: Text(
                        "${infoDay.hourly_data![index].tmp2m.toString()}°",
                        style: const TextStyle(),
                      ),
                    ),
                  );
                },
                separatorBuilder: ((context, index) {
                  return const SizedBox(
                    height: 5,
                  );
                }),
                itemCount: infoDay.hourly_data!.length),
          ),
        ],
      ),
    );
  }
}
