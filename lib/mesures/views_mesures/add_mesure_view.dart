import 'dart:convert';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../counters/counters_repositories/counters_api.dart';
import '../mesures_repositories/mesures_api.dart';
import '../view_model_mesures/mesures_view_model.dart';

class Addmesure extends StatefulWidget {
  final String id;

  const Addmesure({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<Addmesure> createState() => _AddmesureState();
}

class _AddmesureState extends State<Addmesure> {
  final formkey = GlobalKey<FormState>();
  String textbutton = "save";

  late String Mesurefield;
  // ignore: non_constant_identifier_names
  late String DescriptionField;
  late String dateMesurefield;
  String? token;
  // String? date;
  // String? dateFormatted;
  // String? now;
  // String? imagefini;
  String? id;
  var data = MesuresViewModel(mesuresRepository: MesuresApi());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details mesure screen'),

        backgroundColor: const Color(0xFFFF8000), // appbar color.
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Text(widget.text),
                Padding(
                    padding: EdgeInsets.all(15),
                    child: FutureBuilder(
                      // future: addMesureViewModel.getdate(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else {
                          var datenow = snapshot.data;
                          return TextFormField(
                            controller: TextEditingController(text: "$datenow"),

                            //initialValue: "$datenow",

                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFF2F2F2),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xFFFF8000)),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                    width: 1,
                                  )),
                              labelText: 'date de mesure',
                              labelStyle: TextStyle(
                                color: Color.fromARGB(
                                    255, 114, 59, 3), //<-- SEE HERE
                              ),
                              hintText: 'entre le date de mesure',
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter your Name";
                              } else {
                                dateMesurefield = datenow.toString();
                                return null;
                              }
                            },
                            onChanged: (text) {
                              dateMesurefield = text;
                            },
                          );
                        }
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF2F2F2),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(width: 1, color: Color(0xFFFF8000)),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                            width: 1,
                          )),
                      labelText: 'mesure',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 114, 59, 3), //<-- SEE HERE
                      ),
                      hintText: 'entre votre mesure',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "entre votre mesure";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (text) {
                      Mesurefield = text;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFF2F2F2),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(width: 1, color: Color(0xFFFF8000)),
                      ),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                            width: 1,
                          )),
                      labelText: 'description',
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 114, 59, 3), //<-- SEE HERE
                      ),
                      hintText: 'entre une description',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "entre une description";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (text) {
                      DescriptionField = text;
                    },
                  ),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {},
                      child: const Icon(Icons.photo),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Icon(Icons.camera_alt),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFFFF8000),
                      shadowColor: const Color.fromARGB(162, 255, 128, 0),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                      minimumSize:
                          const Size(double.infinity, 50), //////// HERE
                    ),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        setState(() {
                          data.AddMesure(dateMesurefield, Mesurefield,
                              DescriptionField, widget.id);
                        });
                      }
                    },
                    child: const Text('save',
                        style: TextStyle(
                          fontSize: 20,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
