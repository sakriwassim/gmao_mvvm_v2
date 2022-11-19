import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../counters/models_counters/add_counter_model.dart';
import '../models_mesures/add_mesure_model.dart';
import '../models_mesures/mesure_model.dart';
import 'mesure_repository.dart';

class MesuresApi extends MesuresRepository {
  @override
  Future<MesureModel> getMesureByID(String id) async {
    try {
       SharedPreferences prefs = await SharedPreferences.getInstance();
        var token = prefs.getString("token");
   //   var token =
     //     "ZZQ7D9_Ymble3Dm-vwd-ofRN_KNP07g31qTXvMHw1s9A7BOpFDxZ2uEsoqMG6HG7uc3prdXGfp729kssQHUo3IitxBPftE5s11Ss1oEzYg4WlrSSoE5Jxaqu0Zf1Ncb3PuAfrOh7_CgqYcx-NLHTMHujJUuVnnUMDGVdyOo7q4XCtkN7bQIqrWlH_KuWytfI0YjNsFTF0LbfcgFjp85uunMbT2kgXy5I1g1XY6D0dRGuPIYeXp_zv7iAJ1nQJcVVP2M6XCjdJ2rXl3nKofffK7mlJ6Q6BG1oUKiHIyxhGEip1uD_G9UEvPrubgr1xuFP4LNSE9tWz--DDetkbFucQqoOsYpNfe_CLH3fanvFGNiaM1JfZTq4q1lElc1qX9MArWM5w_9I8LAaG5Ng6twGA2GvHR8662pnIxmPzSpbYV9f_9ssvhCdOrqlPEHdTYDREovlZr4VQ0dd7zcBIjSJ3E8QN3h-IeIAr1LxwvYi7II";
      // try {
      var headersa = {'Authorization': 'Bearer $token'};
      String link =
          'https://timserver.northeurope.cloudapp.azure.com/GmaoProWebApi/api/Counters/$id/measures';
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

      var headersa = {'Authorization': 'Bearer ${token}'};

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
  Future<bool> addMesure(String dateMesurefield, String Mesurefield,
      String DescriptionField, String id) async {
    try {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // token = prefs.getString("token");
      // String counterid = widget.counterfromgetcouter;

      var token =
          "ZZQ7D9_Ymble3Dm-vwd-ofRN_KNP07g31qTXvMHw1s9A7BOpFDxZ2uEsoqMG6HG7uc3prdXGfp729kssQHUo3IitxBPftE5s11Ss1oEzYg4WlrSSoE5Jxaqu0Zf1Ncb3PuAfrOh7_CgqYcx-NLHTMHujJUuVnnUMDGVdyOo7q4XCtkN7bQIqrWlH_KuWytfI0YjNsFTF0LbfcgFjp85uunMbT2kgXy5I1g1XY6D0dRGuPIYeXp_zv7iAJ1nQJcVVP2M6XCjdJ2rXl3nKofffK7mlJ6Q6BG1oUKiHIyxhGEip1uD_G9UEvPrubgr1xuFP4LNSE9tWz--DDetkbFucQqoOsYpNfe_CLH3fanvFGNiaM1JfZTq4q1lElc1qX9MArWM5w_9I8LAaG5Ng6twGA2GvHR8662pnIxmPzSpbYV9f_9ssvhCdOrqlPEHdTYDREovlZr4VQ0dd7zcBIjSJ3E8QN3h-IeIAr1LxwvYi7II";

      String link =
          'https://timserver.northeurope.cloudapp.azure.com/GmaoProWebApi/api/Counters/$id';

      var url = Uri.parse(link);
      var headersa = {
        'Content-type': 'application/json',
        "Accept": "application/json",
        'authorization': 'Bearer ' '$token',
      };

      var responseget = await http.get(url, headers: headersa);
      var responsebodyget = jsonDecode(responseget.body);

      AddCounterModel counter = AddCounterModel.toObject(responsebodyget);

      http.Response response = await http.put(
        Uri.parse(link),
        headers: {
          'Content-type': 'application/json',
          "Accept": "application/json",
          'authorization': 'Bearer ' + '$token',
        },
        body: json.encode({
          "code": counter.code,
          "designation": counter.designation,
          "fullDesignation": counter.fullDesignation,
          "description": counter.description,
          "equipmentId": counter.equipmentId,
          "equipmentCode": counter.equipmentCode,
          "equipmentDesignation": counter.equipmentDesignation,
          "equipmentFullDesignation": counter.equipmentFullDesignation,
          "equipmentLocalization": counter.equipmentLocalization,
          "equipmentNature": counter.equipmentNature,
          "equipmentInternalBarcode": counter.equipmentInternalBarcode,
          "unitMeasureId": counter.unitMeasureId,
          "unitMeasureCode": counter.unitMeasureCode,
          "unitMeasureDesignation": counter.unitMeasureDesignation,
          "unitMeasureFullDesignation": counter.unitMeasureFullDesignation,
          "maxValue": counter.maxValue,
          "alertValue": counter.alertValue,
          "type": counter.type,
          "isEnabled": counter.isEnabled,
          "disabledDate": counter.disabledDate,
          "measures": [
            {
              "counterId": counter.id,
              "dateMeasure": "2022-10-16T17:22:56",
              "measure": Mesurefield,
              "comments": DescriptionField,
              "filePath":
                  "https://timserver.northeurope.cloudapp.azure.com/GmaoPr",
              "crud": 1
            }
          ],
          "counterTeams": counter.counterTeams,
          "lastDateMeasure": counter.lastDateMeasure,
          "lastMeasure": counter.lastMeasure,
          "equipmentNatureStr": counter.equipmentNatureStr,
          "siteId": counter.siteId,
          "siteName": counter.siteName,
          "companyId": counter.companyId,
          "id": counter.id,
          "createdDate": counter.createdDate,
          "createdBy": counter.createdBy,
          "updatedDate": counter.updatedDate,
          "updatedBy": counter.updatedBy,
          "crudFrom": counter.crudFrom,
          "currentUserId": counter.currentUserId,
          "currentEmployeeId": counter.currentEmployeeId,
          "isSystem": counter.isSystem,
          "crud": counter.crud
        }),
      );

      return true;
    } catch (e) {
      // ignore: avoid_print
      return false;
    }
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
