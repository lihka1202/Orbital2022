import 'package:cloud_firestore/cloud_firestore.dart';

class Carparks {
  final String? name;
  final String? lots;

  const Carparks({this.name, this.lots});
}

// class Carparks {
//   List<dynamic> carparks = [];

//   Map<String, dynamic> toMap() => {"carparks": this.carparks};

//   Carparks.fromMap(Map<dynamic, dynamic> map)
//     : carparks = map['carparks'].map((carparks) {
//         return Carparks.fromMap(carparks);
//       }).toList();
// }
