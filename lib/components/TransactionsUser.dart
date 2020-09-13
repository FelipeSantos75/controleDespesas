import 'dart:math';

import 'package:controleDespesas/components/transactionsForms.dart';
import 'package:controleDespesas/components/transactionsList.dart';
import 'package:controleDespesas/models/transactions.dart';
import 'package:flutter/cupertino.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transactions(
      id: 't1',
      date: DateTime.now(),
      title: 'Conta de Luz',
      value: 250.15,
    ),
    Transactions(
      id: 't2',
      date: DateTime.now(),
      title: 'Conta de Agua',
      value: 110.15,
    ),
  ];

//método para incluir conta no app
  _addTransaction(String titulo, double valor) {
    final newTransacion = Transactions(
      id: Random().nextDouble().toString(),
      date: DateTime.now(),
      title: titulo,
      value: valor,
    );

    setState(() {
      _transactions.add(newTransacion);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        TransactionsForms(_addTransaction),
        TransactionsList(_transactions),
      ],
    );
  }
}
