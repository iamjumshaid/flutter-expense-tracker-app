import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  DateTime _selectedDate;

  void _submit() {
    if (amountTextController.text.isEmpty) {
      return;
    }

    final String title = titleTextController.text.toString();
    final double amount = double.parse(amountTextController.text);

    if (title.isEmpty || amount <= 0 || _selectedDate == null) {
      return;
    }

    // ? adds the Widget properties in its state class
    widget.addTransaction(
      title,
      amount,
      _selectedDate,
    );

    // ? to hide the top most screen
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      // ? future class
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
    print('...');
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
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No Date Chosen!'
                          : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                    ),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _presentDatePicker,
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _submit();
              },
              child: Text('Add transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
