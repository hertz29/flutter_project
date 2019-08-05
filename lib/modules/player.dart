import 'package:flutter/foundation.dart';

class Player{
    final int id;
    final List<PlayerPosition> positions;
    final String name;
    final int price;
    final String team;

    Player({
      @required this.id,
      @required this.positions,
      @required this.name,
      @required this.price,
      @required this.team
      });

    String getPlayerPossition(){
        List<String> playerAvailabePositions = [];
        positions.forEach((position){
            playerAvailabePositions.add(createPositionShortcut(position));
        });
        return playerAvailabePositions.toString();
    }

    String createPositionShortcut(position){
       switch(position){
          
          case PlayerPosition.PG:
            return 'PG';
          case PlayerPosition.SG:
            return 'SG';
          case PlayerPosition.SF:
            return 'SF';
          case PlayerPosition.PF:
            return 'PF';
          case PlayerPosition.C:
            return 'C';
        }
    }
}



enum PlayerPosition{
   PG,SG,SF,PF,C   
}