import 'package:flutter/material.dart';
import '../../modules/player.dart';
import './chart_bar.dart';
import '../../utils/commonFunctions.dart';

class Chart extends StatelessWidget{
  
  final Map<PlayerPosition,int>  players;
  final int teamBudget;
  Chart(this.players,this.teamBudget);

  List<Widget> createChartBar(Map<PlayerPosition,int> map, int teamBudget){
    List<Widget> chartBarList = [];
    map.forEach((playerPosition,price){
      int fraction = teamBudget == 0 ? 1 : teamBudget;
      double percentage = (price / fraction);
      print('percentage : $percentage');
      chartBarList.add(ChartBar(CommonFunctions.createPositionShortcut(playerPosition),price,percentage));
    }); 
    return chartBarList;
  }
  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 6,
      child : Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: createChartBar(players,teamBudget),
      ),
    );
  }

}