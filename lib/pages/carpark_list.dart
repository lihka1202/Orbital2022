import 'package:flutter/material.dart';
import 'package:httptesting/pages/carparks.dart';
import 'package:provider/provider.dart';
import 'package:httptesting/pages/views/carpark_tile.dart';

class CarparkList extends StatefulWidget {
  //const CarparkList({Key? key}) : super(key: key);
  final Carparks? carparkss;
  CarparkList({this.carparkss});

  @override
  State<CarparkList> createState() => _CarparkListState();
}

class _CarparkListState extends State<CarparkList> {
  @override
  Widget build(BuildContext context) {
    final carparks = Provider.of<List<Carparks>?>(context) ?? [];

    return ListView.builder(
      itemCount: carparks.length,
      itemBuilder: (context, index) {
            return CarparkTile(carparks: carparks[index]);
      },
    );
  }
}
