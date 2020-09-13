import 'package:controleDespesas/components/TransactionsUser.dart';
import 'package:controleDespesas/components/transactionsForms.dart';
import 'package:controleDespesas/components/transactionsList.dart';
import 'package:controleDespesas/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

main() {
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ],
        title: Text('Despesas Pessoais'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Card(
            child: Text(
              'Gráfico',
              style: TextStyle(fontSize: 19),
            ),
            elevation: 5,
            shadowColor: Colors.brown,
            margin: EdgeInsets.all(5),
          ),
          TransactionUser(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
        
      ),
    );
  }
}
