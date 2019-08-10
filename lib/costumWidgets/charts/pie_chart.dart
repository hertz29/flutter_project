import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class BudgetPieChart extends StatefulWidget {

  @override
  BudgetPieChartState createState() => BudgetPieChartState();
}

class BudgetPieChartState extends State<BudgetPieChart> {
  bool toggle = false;
  Map<String, double> dataMap = new Map();
  List<Color> colorList = [
    Colors.orange[100],
    Colors.orange[200],
    Colors.orange[300],
    Colors.orange[400],
    Colors.orange,
    Colors.orange[600],
    Colors.orange[700],
    Colors.orange[800],
    Colors.orange[900],
  ];

  @override
  void initState() {
    super.initState();
     dataMap.putIfAbsent("Free", () => 50000);
  }



  @override
  Widget build(BuildContext context) {
    return  Container(
              width: double.infinity,
              height: 270,
              child: PieChart(
                  dataMap: dataMap,
                  legendFontColor: Colors.blueGrey[900],
                  legendFontSize: 14.0,
                  legendFontWeight: FontWeight.w500,
                  animationDuration: Duration(milliseconds: 800),
                  chartLegendSpacing: 32.0,
                  chartRadius: MediaQuery.of(context).size.width / 2.7,
                  showChartValuesInPercentage: true,
                  showChartValues: true,
                  showChartValuesOutside: false,
                  chartValuesColor: Colors.blueGrey[900].withOpacity(0.9),
                  colorList: colorList,
                  showLegends: true,
                  decimalPlaces: 1,
                ),  
              );
  }
}
