import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models_mesures/add_mesure_model.dart';
import '../models_mesures/mesure_model.dart';
import 'mesure_repository.dart';

class MesuresApi extends MesuresRepository {
  @override
  Future<MesureModel> getMesureByID(String id) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");
      var TOKEN =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9mcm96ZW4tcmVmdWdlLTgwOTY1Lmhlcm9rdWFwcC5jb21cL2FwaVwvdjFcL0xvZ2luIiwiaWF0IjoxNjY0NTUwNTIzLCJleHAiOjE2NjQ1NTQxMjMsIm5iZiI6MTY2NDU1MDUyMywianRpIjoiSTV2RENLb3NnUVVhWHo2bCIsInN1YiI6MywicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyIsInVzZXJfaWQiOjMsImVtYWlsIjoid2Fzc2ltbEBlbWFpbC5jb20ifQ.JrZwVjPqWU_TZ4YrylOtcyMzQg-XoGYcV7hE9fHLGc";
      // try {
      var headersa = {'Authorization': 'Bearer $token'};
      String link =
          'https://frozen-refuge-80965.herokuapp.com/api/v1/Mesures/$id';
      var url = Uri.parse(link);

      http.Response response = await http.get(url, headers: headersa);

      //var responsebody = jsonDecode(response.body);

      // print(mesureData);
      MesureModel.fromJson(json.decode(response.body));
      var mesureDate = MesureModel.fromJson(json.decode(response.body));

      return mesureDate;
    } catch (e) {
      throw Exception('can not load mesure data');
    }
  }

  @override
  Future<List<MesureModel>> getAllMesures() async {
    try {
      List<MesureModel> mesuresList = [];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");

      var headersa = {'Authorization': 'Bearer ${token!}'};

      String link = 'https://frozen-refuge-80965.herokuapp.com/api/v1/Mesures';

      var url = Uri.parse(link);

      var response = await http.get(url, headers: headersa);
      var responsebody = jsonDecode(response.body);

      var list = responsebody as List;
      mesuresList = list.map((mesure) => MesureModel.fromJson(mesure)).toList();

      return mesuresList;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<MesureModel>> getMesureByCounter(String id) async {
    try {
      List<MesureModel> mesuresList = [];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");
      var TOKEN =
          "ZZQ7D9_Ymble3Dm-vwd-ofRN_KNP07g31qTXvMHw1s9A7BOpFDxZ2uEsoqMG6HG7uc3prdXGfp729kssQHUo3IitxBPftE5s11Ss1oEzYg4WlrSSoE5Jxaqu0Zf1Ncb3PuAfrOh7_CgqYcx-NLHTMHujJUuVnnUMDGVdyOo7q4XCtkN7bQIqrWlH_KuWytfI0YjNsFTF0LbfcgFjp85uunMbT2kgXy5I1g1XY6D0dRGuPIYeXp_zv7iAJ1nQJcVVP2M6XCjdJ2rXl3nKofffK7mlJ6Q6BG1oUKiHIyxhGEip1uD_G9UEvPrubgr1xuFP4LNSE9tWz--DDetkbFucQqoOsYpNfe_CLH3fanvFGNiaM1JfZTq4q1lElc1qX9MArWM5w_9I8LAaG5Ng6twGA2GvHR8662pnIxmPzSpbYV9f_9ssvhCdOrqlPEHdTYDREovlZr4VQ0dd7zcBIjSJ3E8QN3h-IeIAr1LxwvYi7II";

      var headersa = {'Authorization': 'Bearer ${TOKEN}'};

      String link =
          'https://timserver.northeurope.cloudapp.azure.com/GmaoProWebApi/api/Counters/${id}/measures';

      var url = Uri.parse(link);

      var response = await http.get(url, headers: headersa);
      var responsebody = jsonDecode(response.body);

      var list = responsebody as List;
      mesuresList = list.map((mesure) => MesureModel.fromJson(mesure)).toList();

      return mesuresList;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<MesureModel> updateMesureByID(MesureModel mesureModel) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");
      final mesureId = mesureModel.id;
      final mesureModelJson = mesureModel.toJSON();

      var headers = {
        'Content-type': 'application/json',
        "Accept": "application/json",
        'authorization': 'Bearer $token',
      };

      final body = mesureModelJson;

      String link =
          'https://frozen-refuge-80965.herokuapp.com/api/v1/Mesures/$mesureId';

      var url = Uri.parse(link);

      http.Response response = await http.put(url,
          headers: headers, body: json.encode(mesureModelJson));
      var responsebody = jsonDecode(response.body);
      // print(mesureModelJson);
      // print(responsebody);
    } catch (e) {
      print(e);
    }

    return mesureModel;
  }

  @override
  Future<bool> addMesure(AddMesureModel addMesureModel) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");
      final mesureModelJson = addMesureModel.toJson();

      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Basic +$token'
      };

      final body = jsonEncode(mesureModelJson);

      String link = 'https://frozen-refuge-80965.herokuapp.com/api/v1/Mesures';

      var url = Uri.parse(link);

      http.Response response =
          await http.post(url, headers: headers, body: body);
      var responsebody = jsonEncode(response.body);
      // print(mesureModelJson);
      // print(responsebody);
    } catch (e) {
      print(e);
    }

    return true;

    //throw UnimplementedError();
  }

  @override
  Future<bool> deleteMesureByID(int id) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");

      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'authorization': 'Basic +$token'
      };
      String link =
          'https://frozen-refuge-80965.herokuapp.com/api/v1/Mesures/$id';
      var url = Uri.parse(link);

      http.Response response = await http.delete(url, headers: headers);

      return true;
    } catch (e) {
      return false;
    }
  }
}