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
          toolbarHeight: 65,
          backgroundColor: Colors.transparent,
          title: Text("Carpark Availability"),
          centerTitle: true,
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.lightBlue],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
          ),
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