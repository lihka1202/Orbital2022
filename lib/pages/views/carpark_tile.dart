import 'package:httptesting/pages/carparks.dart';
import 'package:flutter/material.dart';
import 'package:httptesting/pages/Favourites.dart';

class CarparkTile extends StatelessWidget {
  final Carparks? carparks;
  CarparkTile({this.carparks});
  int counter = 0;
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
              ),
              title: Text(carparks!.name!, style: TextStyle(fontSize: 18)),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed:() {
                        final temp = Carparks(
                          name: carparks!.name!,
                          lots: carparks!.lots!
                        );
                        counter+=1;
                        if(counter >=1 && counter%2!=0) {
                          Favourites.favourite.add(temp);
                        }
                        else if(counter !=0 && counter%2==0)
                          {
                            Favourites.favourite.remove(temp);
                          }
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Favourites(favourite: favourites ), ));
                      },
                      icon: Icon(Icons.favorite)
                  ),
                  Text(
                    carparks!.lots!,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
