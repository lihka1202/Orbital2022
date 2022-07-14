import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:httptesting/pages/carparks.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:httptesting/services/database.dart';

class DatabaseService {
  final String? Carpark;
  DatabaseService({this.Carpark});

  final CollectionReference carparkCollection =
      FirebaseFirestore.instance.collection('Carpark Availability');

  Stream<QuerySnapshot> get carpark {
    return carparkCollection.snapshots();
  }
}

// class getCarparkList extends StatelessWidget {
//   final String lotsavail;
//   const getCarparkList(this.lotsavail);

//   @override
//   Widget build(BuildContext context) {
//     CollectionReference carpark =
//         FirebaseFirestore.instance.collection('Carpark Availability');

//     return FutureBuilder<DocumentSnapshot>(
//         future: carpark.doc(lotsavail).get(),
//         builder:
//             (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//           //Error handling
//           if (snapshot.hasError) {
//             return Text('Something went wrong');
//           }

//           if (snapshot.hasData && !snapshot.data!.exists) {
//             return Text("Document does not exist");
//           }

//           if (snapshot.connectionState == ConnectionState.done) {
//             Map<String, dynamic> data =
//                 snapshot.data!.data() as Map<String, dynamic>;
//             return Text("Carpark: ${data['locations']}");
//           }

//           return Text("loading");
//         });
//   }
// }
