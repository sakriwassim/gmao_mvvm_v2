import 'package:flutter/material.dart';
import 'package:gmao_mvvm_v2/counters/models_counters/counter_model.dart';
import '../../mesures/views_mesures/mesures_view.dart';
import '../counters_repositories/counters_api.dart';
import '../view_model_events/counters_view_model.dart';
import '../view_model_events/one_counter_view_model.dart';
import '../wigdets/counter_card.dart';
import 'package:flutter_offline/flutter_offline.dart';

class GetAllCounterView extends StatefulWidget {
  const GetAllCounterView({super.key});

  @override
  State<GetAllCounterView> createState() => _GetAllCounterViewState();
}

class _GetAllCounterViewState extends State<GetAllCounterView> {
  var data = CountersViewModel(countersRepository: CountersApi());

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

        title: const Text('Compteurs', style: TextStyle(fontSize: 20)),

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
                  data.FetchAllCounters();
                });

                return Future.delayed(const Duration(seconds: 2));
              },
              child: Center(
                child: FutureBuilder<List<OneCounterViewModel>>(
                  future: data.FetchAllCounters(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else {
                      var counters = snapshot.data;
                      return ListView.builder(
                          itemCount: counters?.length,
                          itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GetAllMesureView(
                                            id: counters[index].id,
                                          )),
                                );
                              },
                              child: CounterCard(
                                description: counters![index].description,
                                code: counters![index].code,
                                designation: counters[index].designation,
                                equipmentDesignation:
                                    "counters![index].equipmentDesignation",
                                equipmentLocalization:
                                    counters[index].equipmentLocalization,
                                id: counters[index].id,
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
