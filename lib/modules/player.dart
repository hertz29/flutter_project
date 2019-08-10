import 'package:flutter/foundation.dart';
import '../utils/commonFunctions.dart';

class Player{
    final int id;
    final PlayerPosition positions;
    final String firstName;
    final String lastName;
    final int price;
    final String team;
    final String img;
    bool isSelected = false;

    Player({
      @required this.id,
      @required this.positions,
      @required this.firstName,
      @required this.lastName,
      @required this.price,
      @required this.team,
      @required this.img
      });

    Player.fromJson(Map<String, dynamic> json)
      : firstName = json['first_name'],
        lastName = json['last_name'],
        id = json['id'],
        team = json['team'],
        price = 5000,
        positions = CommonFunctions.createPlayerPosition(json),
        img = json['img'];

    String getPlayerPossition(){
        return CommonFunctions.createPositionShortcut(positions);
    }

    void markPlayerAsSelected(){
      if(isSelected){
        return;
      }
      isSelected = true;
      return;
    }

}



enum PlayerPosition{
   PG,SG,SF,PF,C   
}