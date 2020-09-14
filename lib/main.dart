import 'dart:math';

//import 'package:controleDespesas/components/TransactionsUser.dart';
import 'package:controleDespesas/components/chart.dart';
import 'package:controleDespesas/components/chartBar.dart';
import 'package:controleDespesas/components/transactionsForms.dart';
import 'package:controleDespesas/components/transactionsList.dart';
import 'package:controleDespesas/models/transactions.dart';
import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';

main() {
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                color: Colors.purple[700],
                fontWeight: FontWeight.bold,
              ),
              headline5: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 28,
                color: Colors.deepPurpleAccent[100],
                fontWeight: FontWeight.w400,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transactions> transactions = [
    Transactions(
      id: 't1',
      date: DateTime.now().subtract(Duration(days: 3)),
      title: 'Conta 1',
      value: 900,
    ),
    Transactions(
      id: 't2',
      date: DateTime.now().subtract(Duration(days: 5)),
      title: 'Conta 2',
      value: 550,
    ),
    
  ];

  _addTransaction(String titulo, double valor) {
    final newTransacion = Transactions(
      id: Random().nextDouble().toString(),
      date: DateTime.now(),
      title: titulo,
      value: valor,
    );

    setState(() {
      transactions.add(newTransacion);
    });

    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionsForms(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _openTransactionFormModal(context);
            },
          ),
        ],
        title: Text('Despesas Pessoais'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Chart(transactions),
          TransactionsList(transactions),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _openTransactionFormModal(context);
        },
      ),
    );
  }
}
