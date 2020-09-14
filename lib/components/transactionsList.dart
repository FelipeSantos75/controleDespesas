import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactions.dart';

class TransactionsList extends StatelessWidget {
  final List<Transactions> transactions;
  TransactionsList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: transactions.isEmpty
            ? TransactionsEmpty()
            : TransactionsStandart(transactions));
  }
}

class TransactionsEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          'Nenhuma Transação Registrada',
          style: Theme.of(context).textTheme.headline6,
        ),
        Container(
          height: 200,
          child: Image.asset(
            'assets/waiting.png',
            fit: BoxFit.contain,
          ),
        )
      ],
    );
  }
}

class TransactionsStandart extends StatelessWidget {
  final List<Transactions> transactions;

  const TransactionsStandart(this.transactions);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          final e = transactions[index];
          return Card(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'R\$${e.value.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      e.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      DateFormat('d/MMM/y').format(e.date),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
