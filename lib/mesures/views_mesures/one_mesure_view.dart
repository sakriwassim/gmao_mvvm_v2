import 'package:flutter/material.dart';

import '../../core/constants.dart';

class OneMesureView extends StatefulWidget {
  final String? id;
  final String? counterCode;
  final double? measure;
  final String? dateMeasure;
  final String? comments;

  const OneMesureView(
      {Key? key,
      this.id,
      this.counterCode,
      this.measure,
      this.comments,
      this.dateMeasure})
      : super(key: key);

  @override
  State<OneMesureView> createState() => _OneMesureViewState();
}

class _OneMesureViewState extends State<OneMesureView> {
  String textbutton = "update";

  // callback() {
  //   //  String id = id
  //   Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => UpdateScreen(
  //             text: widget.id,
  //             indextabmesure: widget.indextabmesure,
  //             counterfromgetcouter: widget.counterfromgetcouter,
  //             authentificationtoken: widget.authentificationtoken,
  //             dateMeasure: widget.dateMeasure),
  //       ));
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Color(0xFFFF8000),
        shadowColor: kBackgroundColor,
        elevation: 0.0,
        title: const Text('Details mesure screen',
            style: TextStyle(
              color: kBackgroundColor,
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: kBackgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPadding * 1.5),
                decoration: const BoxDecoration(
                  color: Color(0xFFFF8000),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    //  horizontal: kDefaultPadding,
                    vertical: kDefaultPadding * 2,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        //   color: Colors.red,
                        child: const Center(
                            // child: CircleAvatar(
                            //   radius: 100,
                            //   backgroundImage:
                            //       AssetImage('assets/images/image1.png'),
                            // ),
                            ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: kDefaultPadding / 2),
                        child: Text(
                          "CounteurCode : ${widget.counterCode}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: kDefaultPadding),
                    ],
                  ),
                ),
              ),
              Container(
                // color: Colors.blue,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(vertical: kDefaultPadding),
                padding: const EdgeInsets.symmetric(
                  vertical: kDefaultPadding / 2,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        "Mesure : ${widget.measure}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        "Date Mesure :  ${widget.dateMeasure}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        "Comments : ${widget.comments}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    //  Button(textbutton: textbutton, callbackFunction: callback),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
