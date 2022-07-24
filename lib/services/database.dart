import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:httptesting/pages/carparks.dart';

class DatabaseService {
  final String? Carpark;
  DatabaseService({this.Carpark});

  final CollectionReference carparkCollection =
      FirebaseFirestore.instance.collection('Carpark Availability');

  List<Carparks> _carparkListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Carparks(
          name: doc.data().toString().contains('name') ? doc.get('name') : '',
          lots: doc.data().toString().contains('lots') ? doc.get('lots') : '');
    }).toList();
  }

  // get carpark stream
  Stream<List<Carparks>> get carpark {
    return carparkCollection.snapshots().map(_carparkListFromSnapshot);
  }
}
