import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../mesures/mesures_repositories/mesures_api.dart';
import '../counters_repositories/counters_api.dart';
import '../models_counters/add_counter_model.dart';
import '../models_counters/counter_model.dart';
import '../view_model_events/counters_view_model.dart';

class UpdateScreen extends StatefulWidget {
  final int indextabmesure;
  final String id;

  UpdateScreen({
    Key? key,
    required this.indextabmesure,
    required this.id,
  }) : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  late String dateMesurefield;
  final formkey = GlobalKey<FormState>();
  var data = CountersViewModel(countersRepository: CountersApi());
  List elementofcounter = [];

  late String Mesurefield;
  late String DescriptionField;

  String textbutton = "update";

  TextEditingController nameController1 = TextEditingController();
  TextEditingController nameController2 = TextEditingController();
  TextEditingController nameController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update'),

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
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
                    controller:
                        TextEditingController(text: "widget.dateMeasure"),
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
                      labelText: 'date de mesure',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 114, 59, 3), //<-- SEE HERE
                      ),
                      hintText: 'entre le date de mesure',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "entre le date de mesure";
                      } else {
                        dateMesurefield = "date";
                        return null;
                      }
                    },
                    onChanged: (text) {
                      dateMesurefield = text;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextFormField(
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
                      hintText: 'entre votre mesure ',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "entre votre mesure ";
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
                      labelText: 'description',
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 114, 59, 3), //<-- SEE HERE
                      ),
                      hintText: 'entre votre description ',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "entre votre description ";
                      } else {
                        return null;
                      }
                    },
                    onChanged: (text) {
                      DescriptionField = text;
                    },
                  ),
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
                      minimumSize: Size(double.infinity, 50), //////// HERE
                    ),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        // AddCounterModel eventformJson =
                        //     AddCounterModel.toObject(event);

                        setState(() {
                          data.UpdateCounterByID(
                              dateMesurefield,
                              Mesurefield,
                              DescriptionField,
                              widget.id,
                              widget.indextabmesure);
                        });
                      }
                    },
                    child: const Text('update mesure',
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
