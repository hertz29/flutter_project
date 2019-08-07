import 'package:flutter/foundation.dart';
import '../utils/commonFunctions.dart';

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
            playerAvailabePositions.add(CommonFunctions.createPositionShortcut(position));
        });
        return playerAvailabePositions.toString();
    }

  
}



enum PlayerPosition{
   PG,SG,SF,PF,C   
}