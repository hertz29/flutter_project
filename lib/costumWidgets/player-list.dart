import 'package:flutter/material.dart';
import '../modules/player.dart';


class PlayerList extends StatelessWidget{

  final List<Player> players;

  PlayerList(this.players);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: players.isEmpty ?  
            Column(
              children: <Widget>[
                Text('No Players in Your Team'),
                Image.asset('assets/images/emptyCourt.png'),
              ],
            )
          : ListView( 
              children: players.map((player) {
                return Container(
                  color: Colors.cyan[300],
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 35,
                          width: 50,
                          margin: EdgeInsets.symmetric(vertical: 5  ,horizontal: 5),
                          child: Text( 
                            player.getPlayerPossition(),
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                              ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          width: 200,
                          height: 35,
                          child : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                            Text(
                                player.team.toString(),
                                style: TextStyle(fontSize: 12,color: Colors.grey),
                              ),
                              Text(
                                player.name.toString(),
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),   
                            ],
                          ),
                        ), 
                        Container(
                          height: 35,
                          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          child: Text(player.price.toString())
                        ),
                      ],
                    ),
                );
          }).toList(),
         ), 
     );
  }

}
