import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // TextEditingController helps to automatically get text change
  // event from the text field and store it into the variable
  // otherwise you have to manually do it by defining have
  // onchange event for each text field and assign it to variable
  final amountTextController = TextEditingController();
  final titleTextController = TextEditingController();

  final Function addTransaction;

  NewTransaction({this.addTransaction});

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
            ),
            TextField(
              controller: amountTextController,
              decoration: InputDecoration(
                  labelText: 'Amount',
                  labelStyle: TextStyle(color: Colors.purple)),
            ),
            FlatButton(
              onPressed: () {
                addTransaction(
                  titleTextController.text.toString(),
                  double.parse(amountTextController.text.toString()),
                );
              },
              child: Text('Add transaction'),
              textColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
