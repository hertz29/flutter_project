
import 'package:flutter/material.dart';
import './costumWidgets/pie_chart.dart';
import './costumWidgets/player-list.dart';
import './costumWidgets/new_player.dart';
import './modules/player.dart';
import './utils/commonFunctions.dart';





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
  
  void _startAddNewPlayer(BuildContext context){
    showModalBottomSheet(context: context, builder: (_) {
      return NewPlayer(_addNewPlayer);
    });
  }

  final List<Player> _playerList = [
   
  ];
  int _teamBudget = 50000;

  void _addNewPlayer(String name,String team,int price,PlayerPosition position){
      final newPlayer = Player(
        id: 4,
        name : name,
        price: price,
        team: team,
        positions: [position],
      );

      setState(() {
        _playerList.add(newPlayer);
        _teamBudget -= price;
      });

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
                  child: Text(_teamBudget.toString()),
              ),
              BudgetPieChart(),
              PlayerList(_playerList),            ],
          ),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _startAddNewPlayer(context);
        },
      ),
    );
  }
}

