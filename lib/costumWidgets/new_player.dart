import 'package:create_team/modules/player.dart';
import 'package:flutter/material.dart';
import '../utils/commonFunctions.dart';

class NewPlayer extends StatefulWidget{

  final Function addPlayer;

  NewPlayer(this.addPlayer);

  @override
  _NewPlayerState createState() => _NewPlayerState();
}

class _NewPlayerState extends State<NewPlayer> {
  final playerNameConroller = TextEditingController();
  final teamConroller = TextEditingController();
  final priceConroller = TextEditingController();
  PlayerPosition selectedPosition = PlayerPosition.PG;


  void subbmitData(){
    widget.addPlayer(playerNameConroller.text,teamConroller.text,int.parse(priceConroller.text),selectedPosition);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColorLight,
      child: Column(
        children: [
          Container(
            child:
              TextField(
                autocorrect: false,
                decoration: InputDecoration(labelText: 'Enter Player Name'),
                controller: playerNameConroller,
              ),
          ),
          TextField(
            autocorrect: false,
            decoration: InputDecoration(labelText: 'Enter Player\'s team'),
            controller: teamConroller,
          ),
          TextField(
            autocorrect: false,
            decoration: InputDecoration(labelText: 'Enter Player\'s price'),
            controller: priceConroller,
          ),
          Center(
              child: DropdownButton<PlayerPosition>(
                
                value: selectedPosition,
                onChanged: (PlayerPosition newValue) {
                  setState(() {
                    selectedPosition = newValue;
                  });
                },
                items: <PlayerPosition>[PlayerPosition.PG,PlayerPosition.SG,PlayerPosition.SF,PlayerPosition.PF,PlayerPosition.C]
                .map<DropdownMenuItem<PlayerPosition>>((PlayerPosition value) {
                      return DropdownMenuItem<PlayerPosition>(
                          value: value,
                          child: Text(CommonFunctions.createPositionShortcut(value)),
                      );
                }).toList(),
              ),
          ),
          FlatButton(
            child: Text('Add Player'),
            textColor: Colors.orange,
            onPressed: subbmitData,  
          ),
        ],),
      );
  }
}


 enum Teams{
   ATL,
   BOS,
   BRO,
   CHA,
   CHI,
   CLE,
   DAL,
   DEN,
   DET,
   GST,
   HOS,
   IND,
   LAC,
   LAL,
   NOA,
   NYX,
   MEM,
   MIA,
   MIL,
   MIN,
   OKC,
   ORL,
   PHI,
   PHO,
   POR,
   SAC,
   SAT,
   TOR,
   UTA,
   WAS,

}