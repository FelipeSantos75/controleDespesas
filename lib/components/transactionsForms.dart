import 'package:flutter/material.dart';

class TransactionsForms extends StatefulWidget {
  final void Function(String, double) onSubmit;

  TransactionsForms(this.onSubmit);

  @override
  _TransactionsFormsState createState() => _TransactionsFormsState();
}

class _TransactionsFormsState extends State<TransactionsForms> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;
    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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
              FlatButton(
                onPressed: () {
                  _submitForm();
                },
                child: Text('Nova Transação'),
                textColor: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
