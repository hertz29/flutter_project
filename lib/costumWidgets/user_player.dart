import 'package:flutter/material.dart';
import './new_player.dart';
import './player-list.dart';
import '../modules/player.dart';

class UserPlayer extends StatefulWidget{
  @override
  _UserPlayerState createState() {
    return _UserPlayerState();
  }
}
    
class _UserPlayerState extends State<UserPlayer> {
  final List<Player> _playerList = [
    Player(
        id: 1,
        positions: [PlayerPosition.PG],
        name: 'Sthepn Curry',
        price: 5000,
        team: 'Golden State Worriors'
        ),
    Player(
        id: 2,
        positions: [PlayerPosition.PF],
        name: 'Kevin Durant',
        price: 5000,
        team: 'Golden State Worriors'
      ),
    Player(
        id: 3,
        positions: [PlayerPosition.C],
        name: 'Nicola Jukic',
        price: 5000,
        team: 'Denver Nuggets'
      ),
  ];

  void _addNewTransaction(String name){
      final newPlayer = Player(
        id: 4,
        name : name,
        price: 5000,
        team: 'Unknowen',
        positions: [PlayerPosition.C],
      );

      setState(() {
        _playerList.add(newPlayer);
      });

  }



  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewPlayer(_addNewTransaction),
        PlayerList(_playerList),
        Card(
          child: Container(
            width: 20,
            height: 20,
            child: FlatButton(
              child: Text('Add Player'),
              onPressed: () => print('rt'),
            ),
          ),
        ),
      ],
    );
  }

}