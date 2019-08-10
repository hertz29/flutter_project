

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async' show Future;

import 'dart:convert';

import './costumWidgets/charts/chart.dart';
import './costumWidgets/player-list.dart';
import './costumWidgets/new_player.dart';
import './modules/player.dart';
import './modules/team.dart';
import './modules/PlayersPool.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Team',
      theme: ThemeData(
            primarySwatch: Colors.cyan,
            accentColor: Colors.amber,
        ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  void _viewTeam(BuildContext context){
    showModalBottomSheet(context: context, builder: (_) {
      return PlayerList(_team.playersList,_removePlayer,Colors.orange[50]);
    });
  }

  final Map<PlayerPosition,int> _playersPriceByPosition = {
    PlayerPosition.PG:0,
    PlayerPosition.SG:0,
    PlayerPosition.SF:0,
    PlayerPosition.PF:0,
    PlayerPosition.C:0,
  };
  
  //final List<Player> _playerList = [];
  final Team _team = Team();
  PlayersPool _pool = PlayersPool();
  final int _teamBudgetLimit = 50000;
  int _teamBudget = 0;

  void _addPlayer(Player player){
  
    if(_teamBudget + player.price > _teamBudgetLimit){
      print('faild to add player');
      return;
    }
    
    setState(() {
      _pool.removePlayer(player); 
      
      player.markPlayerAsSelected();
      
      _team.addPlayer(player);
      
      _teamBudget += player.price;
      _updatePriceByPlayerPositionMap(player.positions, player.price);
      
    });
    
  }

  void _removePlayer(Player player){
    setState(() {
      _team.removePlayer(player.id);
      player.isSelected = false;
      _pool.addPlayer(player);
      
      _teamBudget -= player.price;
      _updatePriceByPlayerPositionMap(player.positions, player.price*(-1));
    
    });
    Navigator.of(context).pop();
  }

  void _updatePriceByPlayerPositionMap(PlayerPosition position, int price){
      int positionPrice = _playersPriceByPosition[position];
      _playersPriceByPosition[position] = positionPrice+price;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:[
              Card(
                  child: Text((_teamBudgetLimit-_teamBudget).toString()),
              ),
              Chart(_playersPriceByPosition, _teamBudgetLimit),
              new FutureBuilder(
                future: DefaultAssetBundle.of(context).loadString('assets/jsons/players1.json'),
                builder: (context, snapshot) {                
                  return _pool.isNotEmpty()
                      ? new PlayerList(_pool.getPlayers,_addPlayer,Colors.cyan[300])
                      : new Center(child: new CircularProgressIndicator());
                }),
            ],
          ),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_cart),
        onPressed: () {
          _viewTeam(context);
        },
      ),
    );
  }
}

