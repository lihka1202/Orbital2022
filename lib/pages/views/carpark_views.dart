import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:httptesting/pages/carparks.dart';

class CarparkView extends StatefulWidget {
  const CarparkView({Key? key}) : super(key: key);

  @override
  State<CarparkView> createState() => _CarparkViewState();
}

class _CarparkViewState extends State<CarparkView> {
  List<Object> _carparkList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carpark Availability"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
