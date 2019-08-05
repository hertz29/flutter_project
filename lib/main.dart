import 'package:flutter/material.dart';
import './costumWidgets/pie_chart.dart';
import './costumWidgets/user_player.dart';




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Container(
          color: Colors.cyan[100],
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:[
              BudgetPieChart(),
              UserPlayer()
            ],
          ),
        ),
    );
  }
}

