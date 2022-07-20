import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:html/dom.dart';
import 'package:httptesting/pages/carparks.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:httptesting/services/database.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseService {
  final String? Carpark;
  DatabaseService({this.Carpark});

  // official documentation
  final ref =
      FirebaseDatabase.instance.reference().child('Carpark Availability');
  final snapshot = ref.child('Malls').get();

  //net ninja
  // final CollectionReference carparkCollection =
  //     FirebaseFirestore.instance.collection('Carpark Availability');

  // carpark list from snapshot
  List<Carparks> _carparkListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Carparks(
          locations: doc.data().toString().contains('locations')
              ? doc.get('locations')
              : '',
          //locations: doc.get('locations') ?? '',
          lotscount: doc.data().toString().contains('lotscount')
              ? doc.get('lotscount')
              : '');
      //lotscount: doc.get('lotscount') ?? 0,
      //time: doc.get('time') ?? '');
    }).toList();
  }

  // get carpark stream
  Stream<List<Carparks>> get carpark {
    return carparkCollection.snapshots().map(_carparkListFromSnapshot);
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
