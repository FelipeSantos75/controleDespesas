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
   
    return LayoutBuilder(
      builder: (ctx, constraints){
        return Column(
        children: [
          Container(
            height: constraints.maxHeight * 0.15,
            width: constraints.maxWidth * 0.6,
            child: FittedBox(
              child: Text(
                value.toStringAsFixed(2),
              ),
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.02,
          ),
          Container(
            height: constraints.maxHeight * 0.50,
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
                      color: Theme.of(context).primaryColor,
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
                        child: Text(
                label,
              ),
            ),
          ),
        ],
      );
      }
          
    );
  }
}
