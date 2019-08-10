import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget{
  final String position;
  final int price;
  final double precentage;

  ChartBar(this.position,this.price,this.precentage);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children : <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 15,
                child: FittedBox(
                  child: Text('$price\$'),
                ),
              ), 
              SizedBox(height: 4,),
              Container(
                height: 60,
                width: 15,
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        color: Color.fromRGBO(220, 220, 200, 1),
                        borderRadius: BorderRadius.circular(10),              
                      ),
                    ),
                    FractionallySizedBox(
                      heightFactor: precentage,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),              

                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 4,),
              Text(position),
            ],
          ),
        )
      ],
    );
  }

}