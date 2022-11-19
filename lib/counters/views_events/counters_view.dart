import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gmao_mvvm_v2/counters/models_counters/counter_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../mesures/mesures_repositories/mesures_api.dart';
import '../../mesures/view_model_mesures/mesures_view_model.dart';
import '../../mesures/view_model_mesures/one_mesure_view_model.dart';
import '../../mesures/views_mesures/mesures_view.dart';
import '../../signin/signin_screen.dart';
import '../counters_repositories/counters_api.dart';
import '../view_model_events/counters_view_model.dart';
import '../wigdets/counter_card.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class GetAllCounterView extends StatefulWidget {
  const GetAllCounterView({super.key});

  @override
  State<GetAllCounterView> createState() => _GetAllCounterViewState();
}

class _GetAllCounterViewState extends State<GetAllCounterView> {
  bool isUserSignedIn = false;
  String _scanBarcode = 'Unknown';
  List tasks = [];
  var datamesure = MesuresViewModel(mesuresRepository: MesuresApi());

  String? token;
  String? elementcheck;

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;

      var list = datamesure.GetMesureByCounter(_scanBarcode);

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GetAllMesureView(
              id: _scanBarcode,
            ),
          ));
    });
  }

  cleanpref() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Signin(),
          ));
    } catch (e) {
      print(e);
    }
  }

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
                  scanQR();
                }
                // scanQR(),
                ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  cleanpref();
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
                child: FutureBuilder<List<CounterModel>>(
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
                                    counters![index].equipmentDesignation,
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
