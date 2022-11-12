// import 'package:flutter/material.dart';
// import '../counters_repositories/counters_api.dart';
// import '../view_model_events/counters_view_model.dart';
// import '../view_model_events/one_counter_view_model.dart';

// class OneCounterView extends StatefulWidget {
//   final int id;
//   OneCounterView({super.key, required this.id});

//   @override
//   State<OneCounterView> createState() => _OneCounterViewState();
// }

// class _OneCounterViewState extends State<OneCounterView> {
//   var data = CountersViewModel(countersRepository: CountersApi());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(150.0),
//           child: AppBar(
//             elevation: 0.0,
//             shadowColor: Colors.white,
//             title: const Text(
//               "Counter details",
//               style: TextStyle(
//                 color: Colors.white,
//               ),
//             ),
//             iconTheme: const IconThemeData(
//               color: Colors.white,
//             ),
//             flexibleSpace: const Center(
//               child: Image(
//                 image: AssetImage('assets/130.png'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             backgroundColor: Colors.transparent,
//           )),
//       body: Center(
//         child: FutureBuilder<OneCounterViewModel>(
//           future: data.GetCounterByID(widget.id),
//           builder: ((context, snapshot) {
//             if (snapshot.hasData) {
//               return Column(
//                 children: [
//                   // Image.asset("assets/130.png"),
//                   Text(snapshot.data!.libelle),
//                   Padding(
//                     padding: const EdgeInsets.all(10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         const Icon(
//                           Icons.calendar_month,
//                           size: 50.0,
//                           color: Color.fromARGB(255, 217, 15, 197),
//                         ),
//                         Text("${snapshot.data!.date_heure} "),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         const Icon(
//                           Icons.map,
//                           size: 50.0,
//                           color: Color.fromARGB(255, 217, 15, 197),
//                         ),
//                         Text("${snapshot.data!.adresse}"),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         const Text("participants actuels"),
//                         Text("${snapshot.data!.status}"),
//                       ],
//                     ),
//                   ),
//                   const Text("Next Owner"),
//                   SizedBox(
//                     width: 100,
//                     height: 100,
//                     child: CircleAvatar(
//                       child: ClipOval(
//                         child: Image.network(
//                           'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
//                           fit: BoxFit.cover,
//                           width: 100,
//                           height: 100,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       InkWell(
//                           onTap: () {
//                             Navigator.pushReplacement(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => UpdateCounterView(
//                                           counterObj: snapshot.data!,
//                                         )));
//                           },
//                           child: BigButton(text: "MODIFIER")),
//                       InkWell(
//                           onTap: () async {
//                             var delete =
//                                 await data.DeleteCounterByID(snapshot.data!.id);

//                             if (delete == true) {
//                               Navigator.pushReplacement(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           const GetAllCounterView()));
//                             }
//                           },
//                           child: BigButton(text: "SUPPRIMER")),
//                     ],
//                   )
//                 ],
//               );
//             } else if (snapshot.hasError) {
//               return Text("${snapshot.error}");
//             }
//             return const CircularProgressIndicator();
//           }),
//         ),
//       ),
//     );
//   }
// }
