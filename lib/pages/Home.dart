import 'package:flutter/material.dart';
import "package:httptesting/pages/carpark_list.dart";
import 'package:httptesting/pages/carparks.dart';
import 'package:httptesting/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Carparks>?>.value(
      value: DatabaseService().carpark,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Carpark Availability"),
          centerTitle: true,
        ),
        body: CarparkList(),
      ),
    );
  }
}


        // body: Center(
        //   child: Container(
        //     child: MaterialButton(
        //       onPressed: () {
        //         Navigator.pushNamed(context, '/carpark_listing');
        //       },
        //       child: Text(
        //         'Click to Enter!',
        //         style: TextStyle(
        //           fontWeight: FontWeight.bold,
        //           fontSize: 30,
        //         ),
        //       ),
        //       color: Colors.white,
        //     ),
        //   ),