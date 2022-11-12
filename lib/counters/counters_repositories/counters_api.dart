import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models_counters/counter_model.dart';
import 'counter_repository.dart';

class CountersApi extends CountersRepository {
  @override
  Future<CounterModel> getCounterByID(int id) async {
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

  //  @override
  // Future<CounterModel> updateCounterByID(CounterModel counterModel) async {
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     var token = prefs.getString("token");
  //     final counterId = counterModel.id;
  //     final counterModelJson = counterModel.toJSON();

  //     var headers = {
  //       'Content-type': 'application/json',
  //       "Accept": "application/json",
  //       'authorization': 'Bearer $token',
  //     };

  //     final body = counterModelJson;

  //     String link =
  //         'https://frozen-refuge-80965.herokuapp.com/api/v1/Counters/$counterId';

  //     var url = Uri.parse(link);

  //     http.Response response = await http.put(url,
  //         headers: headers, body: json.encode(counterModelJson));
  //     var responsebody = jsonDecode(response.body);
  //     // print(counterModelJson);
  //     // print(responsebody);
  //   } catch (e) {
  //     print(e);
  //   }

  //   return counterModel;
  // }

}
