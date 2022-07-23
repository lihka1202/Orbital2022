import 'package:cloud_firestore/cloud_firestore.dart';

class Carparks {
  final String? name;
  final String? lots;
  final Timestamp? time;

  const Carparks({this.name, this.lots, this.time});
}
