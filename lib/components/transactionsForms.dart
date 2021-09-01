import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsForms extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionsForms(this.onSubmit);

  @override
  _TransactionsFormsState createState() => _TransactionsFormsState();
}

class _TransactionsFormsState extends State<TransactionsForms> {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value, _selectedDate);
  }

  _callDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Card(
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.only(
              top: 10.0,
              left: 10,
              right: 10,
              bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  onSubmitted: (value) => _submitForm(),
                  decoration: InputDecoration(
                    labelText: 'Titulo',
                  ),
                ),
                TextField(
                  controller: valueController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onSubmitted: (value) => _submitForm(),
                  decoration: InputDecoration(
                    labelText: 'Valor (R\$)',
                  ),
                ),
                //  TextField(
                //    controller: dateController,
                //    keyboardType: TextInputType.datetime,
                //    onSubmitted: (value) => _submitForm(),
                //    decoration: InputDecoration(
                //      labelText: 'Data',
                //    ),
                //  ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'Nenhuma Data Salecionada'
                            : DateFormat('dd/MM/y').format(_selectedDate),
                      ),
                    ),
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      onPressed: _callDatePicker,
                      child: Text(
                        'Selecionar Data',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RaisedButton(
                        onPressed: () {
                          _submitForm();
                        },
                        child: Text('Nova Transação'),
                        color: Theme.of(context).primaryColor,
                        textColor: Theme.of(context).buttonColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
