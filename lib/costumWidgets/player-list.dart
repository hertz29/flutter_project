import 'package:flutter/material.dart';
import '../modules/player.dart';
import './single_player.dart';


class PlayerList extends StatelessWidget{

  final List<Player> players;
  final Function method;
  final Color widgetColor;

  PlayerList(this.players,this.method,this.widgetColor);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: players.isEmpty ?  
            Column(
              children: <Widget>[
                Text('No Players in Your Team'),
                SizedBox(height: 10,),
                Container(
                  child: Image.asset(
                    'assets/images/emptyCourt.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView(
            children : players.map((player) {
              return SinglePlayer(player,method,widgetColor);
            }).toList(),
          )
     );
  }

}
