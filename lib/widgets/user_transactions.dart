import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transactions_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addTransaction: _addTransaction),
        TransactionsList(transactionsList: _transactions),
      ],
    );
  }
}
