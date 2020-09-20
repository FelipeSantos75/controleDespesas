import 'package:flutter/cupertino.dart';

class Transactions {
  final String id, title;
  final double value;
  final DateTime date;

  Transactions({
    @required this.id,
    @required this.date,
    @required this.title,
    @required this.value,
  });
}
