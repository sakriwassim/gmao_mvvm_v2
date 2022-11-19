import 'dart:convert';
import 'package:gmao_mvvm_v2/counters/models_counters/add_counter_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models_counters/counter_model.dart';
import 'counter_repository.dart';

class CountersApi extends CountersRepository {

  @override
  getdate() {
    var now = DateTime.now();
    var dateFormatted = DateFormat("yyyy-MM-ddTHH:mm:ss").format(now);
    return dateFormatted;
  }
  @override
  Future<CounterModel> getCounterByID(String id) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");
      var TOKEN =
          "ZZQ7D9_Ymble3Dm-vwd-ofRN_KNP07g31qTXvMHw1s9A7BOpFDxZ2uEsoqMG6HG7uc3prdXGfp729kssQHUo3IitxBPftE5s11Ss1oEzYg4WlrSSoE5Jxaqu0Zf1Ncb3PuAfrOh7_CgqYcx-NLHTMHujJUuVnnUMDGVdyOo7q4XCtkN7bQIqrWlH_KuWytfI0YjNsFTF0LbfcgFjp85uunMbT2kgXy5I1g1XY6D0dRGuPIYeXp_zv7iAJ1nQJcVVP2M6XCjdJ2rXl3nKofffK7mlJ6Q6BG1oUKiHIyxhGEip1uD_G9UEvPrubgr1xuFP4LNSE9tWz--DDetkbFucQqoOsYpNfe_CLH3fanvFGNiaM1JfZTq4q1lElc1qX9MArWM5w_9I8LAaG5Ng6twGA2GvHR8662pnIxmPzSpbYV9f_9ssvhCdOrqlPEHdTYDREovlZr4VQ0dd7zcBIjSJ3E8QN3h-IeIAr1LxwvYi7II";
      // try {
      var headersa = {'Authorization': 'Bearer $TOKEN'};
      String link =
          'https://timserver.northeurope.cloudapp.azure.com/GmaoProWebApi/api/Counters/$id';
      var url = Uri.parse(link);

      http.Response response = await http.get(url, headers: headersa);

      CounterModel.fromJson(json.decode(response.body));
      var counterDate = CounterModel.fromJson(json.decode(response.body));

      return counterDate;
    } catch (e) {
      throw Exception('can not load counter data');
    }
  }

  @override
  Future<List<CounterModel>> getAllCounters() async {
    try {
      List<CounterModel> countersList = [];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString("token");

      var TOKEN =
          "ZZQ7D9_Ymble3Dm-vwd-ofRN_KNP07g31qTXvMHw1s9A7BOpFDxZ2uEsoqMG6HG7uc3prdXGfp729kssQHUo3IitxBPftE5s11Ss1oEzYg4WlrSSoE5Jxaqu0Zf1Ncb3PuAfrOh7_CgqYcx-NLHTMHujJUuVnnUMDGVdyOo7q4XCtkN7bQIqrWlH_KuWytfI0YjNsFTF0LbfcgFjp85uunMbT2kgXy5I1g1XY6D0dRGuPIYeXp_zv7iAJ1nQJcVVP2M6XCjdJ2rXl3nKofffK7mlJ6Q6BG1oUKiHIyxhGEip1uD_G9UEvPrubgr1xuFP4LNSE9tWz--DDetkbFucQqoOsYpNfe_CLH3fanvFGNiaM1JfZTq4q1lElc1qX9MArWM5w_9I8LAaG5Ng6twGA2GvHR8662pnIxmPzSpbYV9f_9ssvhCdOrqlPEHdTYDREovlZr4VQ0dd7zcBIjSJ3E8QN3h-IeIAr1LxwvYi7II";

      var headersa = {'Authorization': 'Bearer ${TOKEN}'};

      String link =
          'https://timserver.northeurope.cloudapp.azure.com/GmaoProWebApi/api/Counters';

      var url = Uri.parse(link);

      var response = await http.get(url, headers: headersa);
      var responsebody = jsonDecode(response.body);

      var list = responsebody as List;
      countersList =
          list.map((counter) => CounterModel.fromJson(counter)).toList();

      print("LKFDJSDLKFJLDSKJFDSLKJFDLS$responsebody");
      return countersList;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<bool> updateCounterByID(String dateMesurefield, String Mesurefield,
      String DescriptionField, String id, int indextabmesure) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // var token = prefs.getString("token");
      // final counterId = addcounterModel.id;
      // final counterModelJson = addcounterModel.toJson();

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

      var countercode = counter.code;

      http.Response response = await http.put(
        url,
        headers: {
          'Content-type': 'application/json',
          "Accept": "application/json",
          'authorization': 'Bearer ' '$token',
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
              "counterId": counter.measures[indextabmesure].counterId,
              "counterCode": counter.measures[indextabmesure].counterCode,
              "counterUnitMeasureId":
                  counter.measures[indextabmesure].counterUnitMeasureId,
              "counterUnitMeasureCode":
                  counter.measures[indextabmesure].counterUnitMeasureCode,
              "counterUnitMeasureDesignation": counter
                  .measures[indextabmesure].counterUnitMeasureDesignation,
              "unitMeasureFullDesignation":
                  counter.measures[indextabmesure].unitMeasureFullDesignation,
              "counterMaxValue":
                  counter.measures[indextabmesure].counterMaxValue,
              "dateMeasure": "2022-10-16T17:22:14",
              "measure": Mesurefield,
              "comments": DescriptionField,
              "id": counter.measures[indextabmesure].id,
              "createdDate": counter.measures[indextabmesure].createdDate,
              "createdBy": counter.measures[indextabmesure].createdBy,
              "updatedDate": counter.measures[indextabmesure].updatedDate,
              "updatedBy": counter.measures[indextabmesure].updatedBy,
              "crudFrom": counter.measures[indextabmesure].crudFrom,
              "currentUserId": counter.measures[indextabmesure].currentUserId,
              "currentEmployeeId":
                  counter.measures[indextabmesure].currentEmployeeId,
              "isSystem": counter.measures[indextabmesure].isSystem,
              "crud": 2
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
      var responsebody = jsonDecode(response.body);
      // print(counterModelJson);
      print(responsebody);
    } catch (e) {
      print(e);
    }

    return true;
  }
}
