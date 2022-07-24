import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:httptesting/pages/carparks.dart';
import 'package:flutter/material.dart';

class CarparkTile extends StatelessWidget {
  final Carparks? carparks;
  CarparkTile({this.carparks});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/${carparks!.name!}', arguments: {
                'lotscount': carparks!.lots!,
                'location': carparks!.name!,
              });
            },
            child: ListTile(
              visualDensity: VisualDensity(vertical: 3),
              leading: CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage('assets/${carparks!.name!}.jpg'),
                //backgroundColor: Colors.blue[400],
              ),
              title: Text(carparks!.name!, style: TextStyle(fontSize: 15)),
              trailing: Text(
                carparks!.lots!,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ));
  }
}
