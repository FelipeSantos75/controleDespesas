import 'dart:math';

//import 'package:controleDespesas/components/TransactionsUser.dart';
import 'package:controleDespesas/components/chart.dart';

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
      debugShowCheckedModeBanner: false,
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
                  color: Colors.white,
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
  bool _showChart = false;
  final List<Transactions> transactions = [
    //    Transactions(
    //      id: 't1',
    //      date: DateTime.now().subtract(Duration(days: 3)),
    //      title: 'Conta 1',
    //      value: 400,
    //    ),
    //    Transactions(
    //      id: 't2',
    //      date: DateTime.now().subtract(Duration(days: 5)),
    //      title: 'Conta 2',
    //      value: 150,
    //    ),
  ];

  _addTransaction(String titulo, double valor, DateTime date) {
    final newTransacion = Transactions(
      id: Random().nextDouble().toString(),
      date: date,
      title: titulo,
      value: valor,
    );

    setState(() {
      transactions.add(newTransacion);
    });

    Navigator.of(context).pop();
  }

  _removeTransaction(String id) {
    setState(() {
      transactions.removeWhere((element) => element.id == id);
    });
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
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    var appBar = AppBar(
      actions: [
        if(isLandscape)
        IconButton(
          icon: Icon(_showChart ? Icons.list : Icons.bar_chart),
          onPressed: () {
            setState(() {
              _showChart = !_showChart;
            });
            
          },
        ),IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            _openTransactionFormModal(context);
          },
        ),
      ],
      title: Text('Despesas Pessoais'),
    );
    var alturaDisponivel = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            
            if (_showChart || !isLandscape)
              Container(
                height: alturaDisponivel * (isLandscape ? 0.7 : 0.3),
                child: Chart(transactions),
              ),
            if (!_showChart || !isLandscape)
              transactions.isEmpty
                  ? Container(
                      height: alturaDisponivel * 0.5,
                      child: TransactionsEmpty(),
                    )
                  : Container(
                      height: alturaDisponivel * (isLandscape ? 0.8 : 0.6),
                      child: TransactionsList(transactions, _removeTransaction),
                    ),
          ],
        ),
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

class TransactionsEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.2,
              child: Text(
                'Nenhuma Transação Registrada',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.7,
              //margin: EdgeInsets.all(5),
              child: Image.asset(
                'assets/waiting.png',
                fit: BoxFit.contain,
              ),
            )
          ],
        );
      },
    );
  }
}
