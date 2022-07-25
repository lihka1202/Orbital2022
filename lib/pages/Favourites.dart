import 'package:httptesting/pages/views/carpark_tile.dart';
import 'package:httptesting/pages/carparks.dart';
import 'package:flutter/material.dart';

class Favourites extends StatelessWidget {
  static List <Carparks> favourite=[];
   Favourites({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Colors.transparent,
        title: Text('Favourites'),
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
      body: ListView.builder(
        itemCount: favourite.length,
        itemBuilder: (context, index) {
          return CarparkTile(carparks: favourite[index]);
        },
      ),
    );
  }
}

