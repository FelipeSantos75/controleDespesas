import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transactions.dart';

class TransactionsList extends StatelessWidget {
  final List<Transactions> transactions;


  //função criada para passar o metodo de remover o item da lista. o mesmo
  //vira do main.dart
  final void Function(String) onRemove;
  TransactionsList(this.transactions, this.onRemove);
  @override
  Widget build(BuildContext context) {
    return Container(
      
    
    child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          final e = transactions[index];

          // Text('R\$${e.value.toStringAsFixed(2)}',),
          // Text(e.title, style: Theme.of(context).textTheme.headline6,),
          //DateFormat('d/MMM/y').format(e.date),
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 5,
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: FittedBox(
                    child: Text(
                      'R\$${e.value.toStringAsFixed(2)}',
                    ),
                  ),
                ),
              ),
              title: Text(
                e.title,
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Text(
                DateFormat('d/MMM/y').format(e.date),
              ),
              trailing: IconButton(
                  icon: Icon(Icons.delete),
                  color: Theme.of(context).errorColor,
                  onPressed: () {
                    onRemove(e.id);
                  }),
            ),
          );
        }), );
  }
}

