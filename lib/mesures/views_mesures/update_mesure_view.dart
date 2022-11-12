// import 'package:flutter/material.dart';
// import '../models_mesures/mesure_model.dart';
// import '../mesures_repositories/mesures_api.dart';
// import '../view_model_mesures/mesures_view_model.dart';
// import '../view_model_mesures/one_mesure_view_model.dart';

// class UpdateMesureView extends StatefulWidget {
//   final OneMesureViewModel mesureObj;
//   UpdateMesureView({super.key, required this.mesureObj});

//   @override
//   State<UpdateMesureView> createState() => _UpdateMesureViewState();
// }

// class _UpdateMesureViewState extends State<UpdateMesureView> {
//   final formkey = GlobalKey<FormState>();
//   late String libellefield;
//   late String prixfield;
//   late String descriptionfield;

//   late String Libellefield;
//   late String Prixfield;
//   late String Descriptionfield;

//   var data = MesuresViewModel(mesuresRepository: MesuresApi());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//           iconTheme: const IconThemeData(
//             color: Colors.black,
//           ),
//           shadowColor: Colors.white,
//           elevation: 0.0,
//           backgroundColor: Colors.white,
//           title: const Text(
//             "MODIFIER",
//             style: TextStyle(
//               color: Colors.black,
//             ),
//           )),
//       body: Form(
//         key: formkey,
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(15),
//               child: TextFormField(
//                 decoration: textFieldDecoration(
//                   "Mot de passe",
//                   "entre le password",
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return "entre le date de mesure";
//                   } else {
//                     return null;
//                   }
//                 },
//                 onChanged: (text) {
//                   libellefield = text;
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(15),
//               child: TextFormField(
//                 decoration: textFieldDecoration(
//                   "Mot de passe",
//                   "entre le password",
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return "entre le date de mesure";
//                   } else {
//                     return null;
//                   }
//                 },
//                 onChanged: (text) {
//                   prixfield = text;
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(15),
//               child: TextFormField(
//                 decoration: textFieldDecoration(
//                   "Mot de passe",
//                   "entre le password",
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return "entre le date de mesure";
//                   } else {
//                     return null;
//                   }
//                 },
//                 onChanged: (text) {
//                   descriptionfield = text;
//                 },
//               ),
//             ),
//             Container(
//               child: InkWell(
//                 onTap: () {
//                   if (formkey.currentState!.validate()) {
//                     var mesure = {
//                       "id": widget.mesureObj.id,
//                       "category_id": "1",
//                       "observation_id": "21",
//                       "libelle": libellefield.toString(),
//                       "description": descriptionfield.toString(),
//                       "prix": prixfield.toString(),
//                       "date_heure": "2020-01-27 17:50:45",
//                       "adresse": "Stade du 26 Mars",
//                       "nbre_tichet": "1000",
//                       "status": "statut",
//                       "image": "image8888888888888888888",
//                       "created_at": "2022-09-30T15:11:08.000000Z",
//                       "updated_at": "2022-09-30T15:11:08.000000Z"
//                     };

//                     MesureModel mesureformJson = MesureModel.fromJson(mesure);
//                     //   print(mesureformJson);

//                     setState(() {
//                       data.UpdateMesureByID(mesureformJson);
//                     });
//                   }
//                 },
//                 child: MediumButton(text: "MODIFIER"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
