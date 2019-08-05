import 'package:flutter/material.dart';

class NewPlayer extends StatelessWidget{

  final playerNameConroller = TextEditingController();
  final Function addPlayer;

  NewPlayer(this.addPlayer);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Column(
        children: <Widget>[
          TextField(
            autocorrect: false,
            decoration: InputDecoration(labelText: 'Enter Player Name'),
            controller: playerNameConroller,
          ),
          FlatButton(
            child: Text('Add Player'),
            textColor: Colors.orange,
            onPressed:() {
              addPlayer(playerNameConroller.text);
            },
          ),
        ],
      ),
    );
  }

}