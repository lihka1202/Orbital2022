import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:httptesting/pages/Malls/Bedok%20Mall.dart';
import 'package:httptesting/pages/Malls/Bugis%20+.dart';
import 'package:httptesting/pages/Malls/Bukit%20Panjang%20Plaza.dart';
import 'package:httptesting/pages/Malls/CapitaGreen.dart';
import 'package:httptesting/pages/Malls/Capital%20Tower.dart';
import 'package:httptesting/pages/Malls/CapitalSpring.dart';
import 'package:httptesting/pages/Malls/Clarke%20Quay.dart';
import 'package:httptesting/pages/Malls/Funan.dart';
import 'package:httptesting/pages/Malls/IMM%20Building.dart';
import 'package:httptesting/pages/Malls/JCube.dart';
import 'package:httptesting/pages/Malls/Junction%208.dart';
import 'package:httptesting/pages/Malls/Lot%20One%20Shoppers%E2%80%99%20Mall.dart';
import 'package:httptesting/pages/Malls/Plaza%20Singapura.dart';
import 'package:httptesting/pages/Malls/Raffles%20City%20Shopping%20Center.dart';
import 'package:httptesting/pages/Malls/Six%20Battery%20Road.dart';
import 'package:httptesting/pages/Malls/Tampines%20Mall.dart';
import 'package:httptesting/pages/Malls/The%20Atrium@Orchard.dart';
import 'package:httptesting/pages/Malls/Westgate.dart';
import 'package:httptesting/pages/carpark_list.dart';
import 'package:httptesting/pages/Home.dart';
import 'package:httptesting/pages/views/carpark_views.dart';
import 'package:provider/provider.dart';

/*
To do list:
    Needa solve the passage of data from one page to another
    Settled - Needa find a way to pass the number of lots from one page to another
 */

void main() async {
  //Initialise Database when starting the application
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    routes: {
      '/': (context) => Home(),
      '/carpark_listing': (context) => CarparkList(),
      '/Bugis +': (context) => BugisPlus(),
      '/Clarke Quay': (context) => ClarkeQuay(),
      '/Funan': (context) => Funan(),
      '/Plaza Singapura': (context) => PlazaSingapura(),
      '/Raffles City Shopping Centre': (context) => RSFC(),
      '/The Atrium@Orchard': (context) => AtriumOrchard(),
      '/Bedok Mall': (context) => BedokMall(),
      '/Tampines Mall': (context) => TampinesMall(),
      '/Bukit Panjang Plaza': (context) => BukitPanjang(),
      '/Junction 8': (context) => Junction8(),
      '/Lot One Shoppers’ Mall': (context) => LOSM(),
      '/JCube': (context) => Jcube(),
      '/Westgate': (context) => Westgate(),
      '/CapitaGreen': (context) => CapitaGreen(),
      '/Capital Tower': (context) => CapitalTower(),
      '/Six Battery Road': (context) => SixBatteryRoad(),
      '/CapitaSpring': (context) => CapitaSpring(),
      '/IMM Building': (context) => IMMBuilding(),
    },
  ));
}

// void main() => runApp(MaterialApp(
//       routes: {
//         '/': (context) => Home(),
//         '/carpark_listing': (context) => CarparkList(),
//         '/Bugis+': (context) => BugisPlus(),
//         '/Clarke Quay': (context) => ClarkeQuay(),
//         '/Funan': (context) => Funan(),
//         '/Plaza Singapura': (context) => PlazaSingapura(),
//         '/Raffles City Shopping Center': (context) => RSFC(),
//         '/The Atrium@Orchard': (context) => AtriumOrchard(),
//         '/Bedok Mall': (context) => BedokMall(),
//         '/Tampines Mall': (context) => TampinesMall(),
//         '/Bukit Panjang Plaza': (context) => BukitPanjang(),
//         '/Junction 8': (context) => Junction8(),
//         '/Lot One Shoppers Mall': (context) => LOSM(),
//         '/JCube': (context) => Jcube(),
//         '/Westgate': (context) => Westgate(),
//         '/CapitaGreen': (context) => CapitaGreen(),
//         '/Capital Tower': (context) => CapitalTower(),
//         '/Six Battery Road': (context) => SixBatteryRoad(),
//         '/CapitalSpring': (context) => CapitalSpring(),
//         '/IMM Building': (context) => IMMBuilding(),
//       },
//     ));
