import 'package:flutter/material.dart';
import "package:httptesting/pages/carpark_list.dart";

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home!"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, '/carpark_listing');
            },
            child: Text(
              'Click to Enter!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}