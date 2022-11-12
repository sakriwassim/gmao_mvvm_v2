import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../../counters/wigdets/counter_card.dart';
import '../mesures_repositories/mesures_api.dart';
import '../view_model_mesures/mesures_view_model.dart';
import '../view_model_mesures/one_mesure_view_model.dart';
import 'one_mesure_view.dart';

class GetAllMesureView extends StatefulWidget {
  String id;
  GetAllMesureView({super.key, required this.id});

  @override
  State<GetAllMesureView> createState() => _GetAllMesureViewState();
}

class _GetAllMesureViewState extends State<GetAllMesureView> {
  var data = MesuresViewModel(mesuresRepository: MesuresApi());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
                icon: Icon(Icons.qr_code),
                onPressed: () {
                  //  scanQR();
                }
                // scanQR(),
                ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  //  cleanpref();
                }
                // => scanQR(),
                ),
          ),
        ],

        title: const Text('Mesures', style: TextStyle(fontSize: 20)),

        backgroundColor: const Color(0xFFFF8000), // appbar color.
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return RefreshIndicator(
              onRefresh: () async {
                setState(() {
                  data.GetMesureByCounter(widget.id);
                });

                return Future.delayed(const Duration(seconds: 2));
              },
              child: Center(
                child: FutureBuilder<List<OneMesureViewModel>>(
                  future: data.GetMesureByCounter(widget.id),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else {
                      var mesures = snapshot.data;
                      return ListView.builder(
                          itemCount: mesures?.length,
                          itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OneMesureView(
                                            id: mesures[index].id,
                                            comments: mesures[index].comments,
                                            counterCode:
                                                mesures[index].counterCode,
                                            dateMeasure:
                                                mesures[index].dateMeasure,
                                            measure: mesures[index].measure,
                                          )),
                                );
                              },
                              child: CounterCard(
                                description: mesures![index].counterCode,
                                code: mesures![index].counterCode,
                                designation: "mesures![index].counterCode",
                                equipmentDesignation:
                                    "counters![index].equipmentDesignation",
                                equipmentLocalization:
                                    mesures![index].counterCode,
                                id: mesures![index].counterCode,
                              )));
                    }
                  }),
                ),
              ),
            );
          } else {
            return const Center(
              child: Text("no connection"),
            );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'There are no bottons to push :)',
            ),
            Text(
              'Just turn off your internet.',
            ),
          ],
        ),
      ),
    );
  }
}
