import 'package:flutter/material.dart';
import '../modules/player.dart';

class SinglePlayer extends StatelessWidget{

  final Player player;
  final Color widgetColor;
  final Function method;


  SinglePlayer(this.player,this.method,this.widgetColor);

  void widgetFunction(Player player){
    this.method(player);
  }

  @override
  Widget build(BuildContext context) {
    
    return Card(
                margin: EdgeInsets.symmetric(vertical: 8,horizontal: 5),
                color: widgetColor,
                child: Container(
                    width: 300,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 35,
                          width: 35,
                          margin: EdgeInsets.symmetric(vertical: 5  ,horizontal: 5),
                          child: CircleAvatar(
                            radius: 40,
                            child: FittedBox(
                              child: Image.network(
                                  player.img
                                ),
                             ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          width: 135,
                          height: 35,
                          child : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                            Text(
                                player.team.toString(),
                                style: TextStyle(fontSize: 12,color: Colors.grey),
                              ),
                            Row(
                              children: <Widget>[
                                Text(
                                  player.firstName.toString(),
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  player.lastName.toString(),
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),   
                            ],
                          ),
                        ), 
                        Container(
                          height: 35,
                          width: 40,
                          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          child: Text(player.price.toString())
                        ),
                        Container(
                          height: 25,
                          width: 25,
                          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          child: FlatButton(
                            child: Icon(Icons.add),
                            onPressed: (){                            
                              widgetFunction(player);
                            },
                          ),
                        ),
                      ],
                ),
              ),
              );
  }

}