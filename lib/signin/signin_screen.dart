import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:gmao_mvvm_v2/signin/site_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../counters/views_events/counters_view.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final formkey = GlobalKey<FormState>();
  late String username;
  late String password;
  List tonken = [];
  List companiesList = [];
  List SitesByCompanyList = [];
  String? _myCompanies;
  String? _mySiteCompanies;
  bool _isObscure = true;
  String? token;

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // late Future<String> _usertoken;

  gettokenformpref() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString("token");

      return token;
    } catch (e) {
      print(e);
    }
  }

  // ignore: non_constant_identifier_names
  Future getSitesByCompany(String? CompanyId) async {
    try {
      // String linkcomplete =
      //     'https://timserver.northeurope.cloudapp.azure.com/GmaoProWebApi/api/authorize/0a68b183-a6a3-2afd-28b3-39ee53282b7a/SitesByCompany';

      String linkcomplete =
          'https://timserver.northeurope.cloudapp.azure.com/GmaoProWebApi/api/authorize/${CompanyId!}/SitesByCompany';

      var url = Uri.parse(linkcomplete);

      var response = await http.get(url);
      var responsebody = jsonDecode(response.body);

      setState(() {
        SitesByCompanyList.clear();
        _mySiteCompanies == null;
        SitesByCompanyList.addAll(responsebody);
      });

      //return siteid;
    } catch (e) {
      return print(e);
    }
  }

  Future getcompanies() async {
    try {
      String linkcomplete =
          'https://timserver.northeurope.cloudapp.azure.com/GmaoProWebApi/api/authorize/companies';

      var url = Uri.parse(linkcomplete);

      var response = await http.get(url);
      var responsebody = jsonDecode(response.body);

      if (response.body.isNotEmpty) {
        setState(() {
          companiesList.addAll(responsebody);
        });
      }

      print(responsebody);
      print(companiesList);
    } catch (e) {
      return print(e);
    }
  }

  login(username, password) async {
    try {
      final response = await http.post(
        Uri.parse(
            'https://timserver.northeurope.cloudapp.azure.com/GmaoProWebApi/token'),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        encoding: Encoding.getByName('utf-8'),
        body: {
          "grant_type": "password",
          "username": username,
          "password": password,
          //"companyId": _myCompanies,
          //"companyId": "39d00cd5-3251-9b25-bca0-bf46aa71c52b",
          //"siteId": "39d00cd5-32af-c531-d230-e935a535103e"
          "companyId": _myCompanies,
          "siteId": _mySiteCompanies
        },
      );

      var responsebody = jsonDecode(response.body);

      // print(responsebody);
      authentificationModel authentification =
          authentificationModel.toObject(responsebody);

      var authentificationtoken = authentification.access_token;

      if (response.statusCode == 200) {
        print("okkkkkkkkkkkkkk");

        // print(authentificationtoken);
        /************************ */

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.clear();
        prefs.setString("token", authentificationtoken.toString());
        print("Seccess");

/************************** */

        if (responsebody != null) {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const GetAllCounterView(),
              ));
        }
      } else if (response.statusCode == 400) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Opps!!'),
            content: const Text('user name or password is incorrect'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      return print(e);
    }
  }

  @override
  void initState() {
    gettokenformpref();
    getcompanies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return Center(
              child: FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else {
                    return SingleChildScrollView(
                      child: Form(
                        key: formkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/Logo-G.png',
                              height: 100,
                              width: 50,
                            ),
                            const Text(
                              'GMAOPRO',
                              style: TextStyle(
                                  // decoration: TextDecoration.underline,
                                  color: Color(0xFFFF8000),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(15),
                              child: Text(
                                'Account Login',
                                style: TextStyle(
                                    // decoration: TextDecoration.underline,
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            DropdownButton(
                              value: _myCompanies,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              hint: const Text('Select Companie'),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _mySiteCompanies = null;
                                  _myCompanies = newValue!;

                                  getSitesByCompany(_myCompanies.toString());
                                  print(_myCompanies);
                                });
                              },
                              items: companiesList.map((item) {
                                return DropdownMenuItem(
                                  value: item['id'].toString(),
                                  child: Text(item['name']),
                                );
                              }).toList(),
                            ),
                            DropdownButton(
                              itemHeight: null,
                              value: _mySiteCompanies,
                              isDense: true,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              hint: const Text('Select Site'),
                              onChanged: (String? newValue) {
                                setState(() {
                                  //  _mySiteCompanies = null;

                                  if (SitesByCompanyList != [] ||
                                      // ignore: unnecessary_null_comparison
                                      SitesByCompanyList != null ||
                                      SitesByCompanyList.isNotEmpty) {
                                    _mySiteCompanies = newValue!;
                                  }
                                });
                              },
                              items: SitesByCompanyList.map((item) {
                                return DropdownMenuItem(
                                  value: item['id'].toString(),
                                  child: Text(item['name']),
                                );
                              }).toList(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: TextFormField(
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
                                  labelText: 'User Name',
                                  labelStyle: TextStyle(
                                    color: Color.fromARGB(
                                        255, 114, 59, 3), //<-- SEE HERE
                                  ),
                                  hintText: 'Enter Your Name',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter your Name";
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (text) {
                                  print('First text field: $text');
                                  username = text;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: _isObscure,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color(0xFFF2F2F2),
                                    focusedBorder: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      borderSide: BorderSide(
                                          width: 1, color: Color(0xFFFF8000)),
                                    ),
                                    border: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        borderSide: BorderSide(
                                          width: 1,
                                        )),
                                    labelText: 'Password',
                                    labelStyle: const TextStyle(
                                      color: Color.fromARGB(
                                          255, 114, 59, 3), //<-- SEE HERE
                                    ),
                                    hintText: 'Enter Password',
                                    suffixIcon: IconButton(
                                        icon: Icon(_isObscure
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () {
                                          setState(() {
                                            _isObscure = !_isObscure;
                                          });
                                        })),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter your mot de passe ";
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (text) {
                                  password = text;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: const Color(0xFFFF8000),
                                  shadowColor:
                                      const Color.fromARGB(162, 255, 128, 0),
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(32.0)),
                                  minimumSize: const Size(
                                      double.infinity, 50), //////// HERE
                                ),
                                onPressed: () {
                                  if (formkey.currentState!.validate()) {
                                    login(username, password);
                                    //getcompanies();
                                  }
                                },
                                child: const Text('login',
                                    style: TextStyle(
                                      fontSize: 20,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
            );
          } else {
            return const Center(
              child: Text("no connection"),
            );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'There are no bottons to push :)',
            ),
            Text(
              'Just turn off your internet.',
            ),
          ],
        ),
      ),
    );
  }
}
