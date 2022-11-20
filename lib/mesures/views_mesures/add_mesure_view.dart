import 'dart:convert';

import 'dart:io';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../counters/counters_repositories/counters_api.dart';
import '../../imageupload/images_repositories/images_api.dart';
import '../../imageupload/view_model_images/images_view_model.dart';
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
  List<DateTime?> _dataTime = [];
  String? dataTime;
  String? shotdataTime;
  final formkey = GlobalKey<FormState>();
  String textbutton = "save";

  late String Mesurefield;
  // ignore: non_constant_identifier_names
  late String DescriptionField;
  late String dateMesurefield;
  String? token;
  String? imagepath;
  String? id;
  var data = MesuresViewModel(mesuresRepository: MesuresApi());
  var dataimage = ImagesViewModel(imagesRepository: ImagesApi());

  final ImagePicker _picker = ImagePicker();
  List<XFile>? _imageFileList;
  dynamic _pickImageError;

  Future<void> _onImageButtonPressed(ImageSource source,
      {BuildContext? context}) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: source,
      );

      imagepath = await dataimage.addImage(pickedFile);
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

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
                ElevatedButton(
                    onPressed: () async {
                      var _newDate = await showCalendarDatePicker2Dialog(
                        context: context,
                        config: CalendarDatePicker2WithActionButtonsConfig(),
                        dialogSize: const Size(325, 400),
                        initialValue: [],
                        borderRadius: BorderRadius.circular(15),
                      );
                      if (_newDate != null) {
                        setState(() {
                          _dataTime = _newDate;
                          dataTime = _dataTime
                              .toString()
                              .replaceAll("]", "")
                              .replaceAll("[", "");

                          shotdataTime = dataTime!.substring(0, 10);
                        });
                      }
                    },
                    child: const Text("Parcourire ce calendrier")),

                Text(shotdataTime.toString()),
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
                      onPressed: () async {
                        await _onImageButtonPressed(ImageSource.gallery,
                            context: context);
                      },
                      child: const Icon(Icons.photo),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await _onImageButtonPressed(ImageSource.camera,
                            context: context);
                      },
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
                          // add imagepath to this fonction

                          data.AddMesure("${shotdataTime}T00:00:00",
                              Mesurefield, DescriptionField, widget.id);
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
