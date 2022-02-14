import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './widgets/new_transaction.dart';
import './widgets/transactions_list.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
      theme: ThemeData(
        accentColor: Colors.amber,
        primarySwatch: Colors.purple,
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 1,
      title: 'Breakfast',
      price: 500,
      date: DateTime.now(),
    ),
    Transaction(
      id: 2,
      title: 'Lunch',
      price: 600,
      date: DateTime.now(),
    ),
    Transaction(
      id: 1,
      title: 'Dinner',
      price: 700,
      date: DateTime.now(),
    ),
  ];

  void _addTransaction(String txTitle, double txAmount) {
    final _trx = Transaction(
      id: 6,
      title: txTitle,
      price: txAmount,
      date: DateTime.now(),
    );

    setState(() {
      this._transactions.add(_trx);
    });
  }

  void _showTransactionModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builderContext) {
          return NewTransaction(addTransaction: _addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
        actions: [
          IconButton(
            onPressed: () => {_showTransactionModal(context)},
            icon: Icon(Icons.add),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {_showTransactionModal(context)},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: const Card(
              child: Text('Card to be filled later'),
            ),
          ),
          TransactionsList(transactionsList: _transactions),
        ],
      ),
    );
  }
}
