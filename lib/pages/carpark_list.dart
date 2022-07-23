import 'package:flutter/material.dart';
import 'package:httptesting/pages/carpark_card.dart';
//import 'package:html/parser.dart' as parser;
//import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:httptesting/pages/carparks.dart';
import 'package:provider/provider.dart';

class CarparkList extends StatefulWidget {
  const CarparkList({Key? key}) : super(key: key);

  @override
  State<CarparkList> createState() => _CarparkListState();
}

class _CarparkListState extends State<CarparkList> {
  @override
  Widget build(BuildContext context) {
    final carparks = Provider.of<List<Carparks>?>(context);
    if (carparks != null) {
      carparks.forEach((carparks) {
        print(carparks.name);
        print(carparks.lots);
        print(carparks.time);
      });
    }

    return Container();
  }
}





// String result0 = '';
// String result1 = '';
// String result2 = '';
// String result3 = '';
// String result4 = '';
// String result5 = '';
// String result6 = '';
// String result7 = '';
// String result8 = '';
// String result9 = '';
// String result10 = '';
// String result11 = '';
// String result12 = '';
// String result13 = '';
// String result14 = '';
// String result15 = '';
// String result16 = '';
// String result17 = '';

// class CarparkList extends StatefulWidget {
//   @override
//   _CarparkListState createState() => _CarparkListState();
// }

// class _CarparkListState extends State<CarparkList> {
// // Strings to store the extracted Article titles
//   //List<String>Result = [];

// // boolean to show CircularProgressIndication
// // while Web Scraping awaits

//   bool isLoading = false;

//   Future<List<String>> extractData() async {
//     // Getting the response from the targeted url
//     final response = await http.Client()
//         .get(Uri.parse('https://justpark.capitaland.com/LotsAvail'));

//     // Status Code 200 means response has been received successfully
//     if (response.statusCode == 200) {
//       // Getting the html document from the response
//       var document = parser.parse(response.body);
//       try {
//         // Scraping the first article title
//         var responseString0 = document.getElementsByClassName('lotscount')[0];
//         //.children[0]
//         //.children[0]
//         //.children[0];

//         //print(responseString1.text.trim());

//         // Scraping the second article title
//         var responseString1 = document.getElementsByClassName('lotscount')[1];
//         //.children[1]
//         //.children[0]
//         //.children[0];

//         //print(responseString2.text.trim());

//         // Scraping the third article title
//         var responseString2 = document.getElementsByClassName('lotscount')[2];
//         //.children[2]
//         //.children[0]
//         //.children[0];

//         //print(responseString3.text.trim());

//         var responseString3 = document.getElementsByClassName('lotscount')[3];

//         var responseString4 = document.getElementsByClassName('lotscount')[4];

//         var responseString5 = document.getElementsByClassName('lotscount')[5];

//         var responseString6 = document.getElementsByClassName('lotscount')[6];

//         var responseString7 = document.getElementsByClassName('lotscount')[7];

//         var responseString8 = document.getElementsByClassName('lotscount')[8];

//         var responseString9 = document.getElementsByClassName('lotscount')[9];

//         var responseString10 = document.getElementsByClassName('lotscount')[10];

//         var responseString11 = document.getElementsByClassName('lotscount')[11];

//         var responseString12 = document.getElementsByClassName('lotscount')[12];

//         var responseString13 = document.getElementsByClassName('lotscount')[13];

//         var responseString14 = document.getElementsByClassName('lotscount')[14];

//         var responseString15 = document.getElementsByClassName('lotscount')[15];

//         var responseString16 = document.getElementsByClassName('lotscount')[16];

//         var responseString17 = document.getElementsByClassName('lotscount')[17];

//         // Converting the extracted titles into
//         // string and returning a list of Strings
//         return [
//           responseString0.text.trim(),
//           responseString1.text.trim(),
//           responseString2.text.trim(),
//           responseString3.text.trim(),
//           responseString4.text.trim(),
//           responseString5.text.trim(),
//           responseString6.text.trim(),
//           responseString7.text.trim(),
//           responseString8.text.trim(),
//           responseString9.text.trim(),
//           responseString10.text.trim(),
//           responseString11.text.trim(),
//           responseString12.text.trim(),
//           responseString13.text.trim(),
//           responseString14.text.trim(),
//           responseString15.text.trim(),
//           responseString16.text.trim(),
//           responseString17.text.trim()
//         ];
//       } catch (e) {
//         return ['', '', 'ERROR!'];
//       }
//     } else {
//       return ['', '', 'ERROR: ${response.statusCode}.'];
//     }
//   }

//   void updateData() async {
//     final response = await extractData();
//     setState(() {
//       result0 = response[0];
//       result1 = response[1];
//       result2 = response[2];
//       result3 = response[3];
//       result4 = response[4];
//       result5 = response[5];
//       result6 = response[6];
//       result7 = response[7];
//       result8 = response[8];
//       result9 = response[9];
//       result10 = response[10];
//       result11 = response[11];
//       result12 = response[12];
//       result13 = response[13];
//       result14 = response[14];
//       result15 = response[15];
//       result16 = response[16];
//       result17 = response[17];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Timer mytimer = Timer.periodic(Duration(minutes: 0, seconds: 10), (timer) {
//       updateData();
//     });
//     return Scaffold(
//         backgroundColor: Colors.grey[200],
//         appBar: AppBar(
//           title: Text('Parking Availability',
//               style: TextStyle(color: Colors.greenAccent, fontSize: 30.0)),
//           backgroundColor: Colors.black,
//           centerTitle: true,
//         ),
//         body: ListView(
//           padding: EdgeInsets.all(20.0),
//           children: [
//             cardTemplate(
//               location: 'Bugis+',
//               lotscount: result0,
//             ),
//             SizedBox(height: 10),
//             cardTemplate(
//               location: 'Clarke Quay',
//               lotscount: result1,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             cardTemplate(
//               location: 'Funan',
//               lotscount: result2,
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             cardTemplate(
//               location: 'Plaza Singapura',
//               lotscount: result3,
//             ),
//             SizedBox(height: 10),
//             cardTemplate(
//               location: 'Raffles City Shopping Center',
//               lotscount: result4,
//             ),
//             SizedBox(height: 10),
//             cardTemplate(
//               location: 'The Atrium@Orchard',
//               lotscount: result5,
//             ),
//             SizedBox(height: 10),
//             cardTemplate(
//               location: 'Bedok Mall',
//               lotscount: result6,
//             ),
//             SizedBox(height: 10),
//             cardTemplate(
//               location: 'Tampines Mall',
//               lotscount: result7,
//             ),
//             SizedBox(height: 10),
//             cardTemplate(
//               location: 'Bukit Panjang Plaza',
//               lotscount: result8,
//             ),
//             SizedBox(height: 10),
//             cardTemplate(
//               location: 'Junction 8',
//               lotscount: result9,
//             ),
//             SizedBox(height: 10),
//             cardTemplate(
//               location: 'Lot One Shoppers Mall',
//               lotscount: result10,
//             ),
//             SizedBox(height: 10),
//             cardTemplate(
//               location: 'IMM Building',
//               lotscount: result11,
//             ),
//             SizedBox(height: 10),
//             cardTemplate(
//               location: 'JCube',
//               lotscount: result12,
//             ),
//             SizedBox(height: 10),
//             cardTemplate(
//               location: 'Westgate',
//               lotscount: result13,
//             ),
//             SizedBox(height: 10),
//             cardTemplate(
//               location: 'CapitaGreen',
//               lotscount: result14,
//             ),
//             SizedBox(height: 10),
//             cardTemplate(
//               location: 'Capital Tower',
//               lotscount: result15,
//             ),
//             SizedBox(height: 10),
//             cardTemplate(
//               location: 'Six Battery Road',
//               lotscount: result16,
//             ),
//             SizedBox(height: 10),
//             cardTemplate(
//               location: 'CapitalSpring',
//               lotscount: result17,
//             ),
//             SizedBox(height: 10),
//           ],
//         ));
//   }
// }
