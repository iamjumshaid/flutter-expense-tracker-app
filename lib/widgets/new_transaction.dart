import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction({this.addTransaction});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // TextEditingController helps to automatically get text change
  final amountTextController = TextEditingController();
  final titleTextController = TextEditingController();

  void _submit() {
    final String title = titleTextController.text.toString();
    final double amount = double.parse(amountTextController.text);

    if (title.isEmpty || amount <= 0) {
      return;
    }

    // ? adds the Widget properties in its state class
    widget.addTransaction(
      title,
      amount,
    );

    // ? to hide the top most screen
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: titleTextController,
              decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(color: Colors.purple)),
              keyboardType: TextInputType.name,
              onSubmitted: (_) => {_submit()},
            ),
            TextField(
              controller: amountTextController,
              decoration: InputDecoration(
                  labelText: 'Amount',
                  labelStyle: TextStyle(color: Colors.purple)),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => {
                _submit(),
              },
            ),
            FlatButton(
              onPressed: () {
                _submit();
              },
              child: Text('Add transaction'),
              textColor: Theme.of(context).accentColor,
            ),
          ],
        ),
      ),
    );
  }
}
