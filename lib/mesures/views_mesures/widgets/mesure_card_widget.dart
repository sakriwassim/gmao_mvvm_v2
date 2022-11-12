import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class MesureCard extends StatelessWidget {
  final String? counterCode;
  final String? measure;
  final String? dateMeasure;
  final String? comments;

  const MesureCard(
      {Key? key,
      this.counterCode,
      this.measure,
      this.dateMeasure,
      this.comments})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        //color: Color.fromARGB(255, 255, 34, 233),
        margin: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
          // vertical: kDefaultPadding / 5,
        ),
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
          Positioned(
            top: 50,
            left: 10,
            child: Container(
              child: SizedBox(
                child: Container(
                  height: 120,
                  width: 120,
                  child: const CircleAvatar(
                    radius: 100,
                    //backgroundImage: AssetImage('assets/images/image2.png'),
                  ),
                ),
              ),
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
                    child: Text(
                      counterCode!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      measure!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      dateMeasure!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      comments!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
