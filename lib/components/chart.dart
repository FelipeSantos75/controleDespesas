import 'package:controleDespesas/components/chartBar.dart';
import 'package:controleDespesas/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transactions> recentTransaction;
  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransactions  {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(
          days: index,
        ),
      );
      double totalSum = 0.0;
      for (var i = 0; i < recentTransaction.length; i++) {
        bool sameDay = recentTransaction[i].date.day == weekDay.day;
        bool sameMonth = recentTransaction[i].date.month == weekDay.month;
        bool sameYear = recentTransaction[i].date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTransaction[i].value;
        }
      }
      //print(DateFormat.E().format(weekDay)[0]);
      //print(totalSum);

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    });
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(0.0, (sum, e) {
      return sum + e['value'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Row(
        children: groupedTransactions.map((e) {
          return ChartBar(
            label: '${e['day']}',
            value: e['value'],
            percent: (e['value'] as double) / _weekTotalValue,
          );
        }).toList(),
      ),
    );
  }
}