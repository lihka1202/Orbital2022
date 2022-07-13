import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:httptesting/pages/carparks.dart';
import 'package:provider/provider.dart';

class DatabaseService {
  //collection reference
  final CollectionReference carparkCollection =
      FirebaseFirestore.instance.collection('Parking Availability');

  // carpark list from snapshot
  List<Carparks> _carparkListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      return Carparks(
        locations: doc.data()
      )
    });
  }

  // get carpark stream
  Stream<QuerySnapshot?> get carparks {
    return carparkCollection.snapshots();
  }
}
