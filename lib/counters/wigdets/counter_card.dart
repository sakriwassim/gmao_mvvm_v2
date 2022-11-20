import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
//import 'package:maps_launcher/maps_launcher.dart';

import 'button_widget.dart';

class CounterCard extends StatelessWidget {
  final String? id;
  final String? code;
  final String? designation;
  final String? equipmentDesignation;
  final String? equipmentLocalization;
  final String? description;

  const CounterCard(
      {Key? key,
      this.id,
      this.code,
      this.designation,
      this.equipmentDesignation,
      this.equipmentLocalization,
      this.description})
      : super(key: key);

  getposition() {
    MapsLauncher.launchQuery("equipmentLocalization :$equipmentLocalization");
  }

  // MapsLauncher.launchCoordinates(
  //                   37.4220041, -122.0862462, 'Google Headquarters are here'),
  //               child: Text('LAUNCH COORDINATES'),

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        height: 190,
        // color: Colors.green,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Container(
            height: 166,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.white,
                // ignore: prefer_const_literals_to_create_immutables
                boxShadow: [
                  const BoxShadow(
                      offset: Offset(0, 15),
                      blurRadius: 25,
                      color: Colors.black12),
                ]),
          ),
          const Positioned(
            top: 50,
            left: 10,
            child: SizedBox(
              height: 120,
              width: 120,
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/images/image2.png'),
              ),

              // Image.asset('assets/images/image1.jpg'),
              //   ),
            ),
          ),
          Positioned(
            top: 40.0,
            right: 10,
            child: SizedBox(
              height: 136,
              width: size.width - 200,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50.0,
                      child: Text(
                        "Code :$code",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      //    color: Colors.green,
                      height: 20,
                      child: Text(
                        "Désignation :$designation",
                        //style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      // color: Colors.red,
                      height: 100.0,
                      child: Text(
                        "Équipement :$equipmentDesignation",
                        // style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ),
                  // Expanded(
                  //   child: Text(
                  //     "equipmentLocalization :$equipmentLocalization",
                  //     //style: Theme.of(context).textTheme.headline6,
                  //   ),
                  // ),
                  Expanded(
                    child: Button(
                        textbutton: "localisation",
                        callbackFunction: getposition),
                  )
                ],
              ),
            ),
          ),
        ]));
  }
}
