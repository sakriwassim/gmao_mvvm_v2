import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models_image/image_model.dart';
import 'image_repository.dart';

class ImagesApi extends ImagesRepository {
  @override
  Future<String> addImage(XFile? pickedFile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    String filepath = pickedFile!.path;
    final base64 = base64Encode(File(filepath).readAsBytesSync());
    final nbrbase64 = await File(filepath).readAsBytes();
    // print("base6444444444444444444");
    // print(base64);
    // print(nbrbase64);

    String imagename = filepath.split("/").last;
    // print("image nammmmeee");
    // print(imagename);

    String link =
        'https://timserver.northeurope.cloudapp.azure.com/GmaoProWebApi/api/UploaderFile/Upload';
    var uri = Uri.parse(link);
    var request = http.MultipartRequest('POST', Uri.parse(link));
    request.files.add(await http.MultipartFile.fromPath("", filepath));
    request.headers.addAll({
      'Content-type': 'multipart/form-data',
      'authorization': 'Bearer ' + '$token',
    });

    var response = await request.send();
    final respStr = await response.stream.bytesToString();
    print(respStr);
    return respStr;
  }
}
