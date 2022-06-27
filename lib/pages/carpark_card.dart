import 'package:flutter/material.dart';
import 'package:httptesting/main.dart';

class cardTemplate extends StatelessWidget {

  final String? location;
  final String? lotscount;
  const cardTemplate({this.location, this.lotscount});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/${location}', arguments: {
            'lotscount': lotscount,
            'location': location
          });
        },
        child: Ink(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:[
              Ink(
                  child: CircleAvatar(backgroundImage: NetworkImage('https://i.imgur.com/5sjCZvu_d.webp?maxwidth=520&shape=thumb&fidelity=high'))),
              Ink(
                child: Text(
                  location!,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Ink(
                child: Text(
                  '${lotscount}',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(Icons.arrow_forward_ios_sharp),
            ],
          ),
        ),
      ),
    );
  }
}