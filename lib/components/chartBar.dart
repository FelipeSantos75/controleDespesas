import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;

  final double value, percent;
  ChartBar({
    this.label,
    this.value,
    this.percent,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
                  child: Text(
            value.toStringAsFixed(2),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[300],
                  border: Border.all(
                    width: 1,
                    color: Colors.grey,
                  ),
                ),
              ),
              FractionallySizedBox(
                heightFactor: percent,
                child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color:Theme.of(context).primaryColor,
                  
                ),
              ),
                
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          label,
        ),
      ],
    );
  }
}
