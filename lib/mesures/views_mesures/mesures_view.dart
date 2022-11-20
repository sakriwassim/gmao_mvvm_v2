import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../mesures_repositories/mesures_api.dart';
import '../view_model_mesures/mesures_view_model.dart';
import '../view_model_mesures/one_mesure_view_model.dart';
import 'add_mesure_view.dart';
import 'one_mesure_view.dart';
import 'widgets/mesure_card_widget.dart';

class GetAllMesureView extends StatefulWidget {
  String? id;
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
                  data.GetMesureByCounter(widget.id.toString());
                });

                return Future.delayed(const Duration(seconds: 2));
              },
              child: Center(
                child: FutureBuilder<List<OneMesureViewModel>>(
                  future: data.GetMesureByCounter(widget.id.toString()),
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
                                      builder: (context) => MesureDetails(
                                            id: mesures[index].counterId,
                                            indextabmesure: index,
                                            comments: mesures[index].comments,
                                            counterCode:
                                                mesures[index].counterCode,
                                            dateMeasure:
                                                mesures[index].dateMeasure,
                                            measure: mesures[index].measure,
                                          )),
                                );
                              },
                              child: MesureCard(
                                comments: mesures![index].comments,
                                counterCode: mesures![index].counterCode,
                                dateMeasure: mesures![index]
                                    .dateMeasure
                                    .substring(0, 10), //substring(0, 10)
                                measure: mesures![index].measure,
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
      bottomNavigationBar: SizedBox(
        height: 50,
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            var id = widget.id;
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Addmesure(
                    id: id.toString(),
                  ),
                ));
          },
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xFFFF8000))),
          child: const Text(
            'Ajouter mesure',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
      ),
    );
  }
}
