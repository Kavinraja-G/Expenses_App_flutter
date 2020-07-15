import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendAmount;
  final double spendPercent;
  ChartBar(this.label, this.spendAmount, this.spendPercent);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
      children: <Widget>[
        Container(
            height: constraints.maxHeight * 0.15,
            child: FittedBox(
                child: Text('\u{20B9}${spendAmount.toStringAsFixed(0)}'))),
        SizedBox(
          height: constraints.maxHeight * 0.05,
        ),
        Container(
          height: constraints.maxHeight * 0.6,
          width: 10,
          child: Stack(
            children: <Widget>[
              //First will be bottom most
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.redAccent, width: 1.0),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendPercent,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: constraints.maxHeight * 0.05,
        ),
        Container(
          height: constraints.maxHeight * 0.15,
          child: FittedBox(
            child: Text(label)
            )
          ),
      ],
    );
      },
    );  
  }
}
