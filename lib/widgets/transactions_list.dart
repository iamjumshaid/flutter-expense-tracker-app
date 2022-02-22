import 'package:flutter/material.dart';
import '../models/transaction.dart'; // .. to go up the folder hierarchy
import 'package:intl/intl.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactionsList;
  final Function deleteTx;

  TransactionsList({this.transactionsList, this.deleteTx});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactionsList.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions added for now.',
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(height: 30),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: FittedBox(
                          child: Text(
                            '\$ ${transactionsList[index].price.toString()}',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactionsList[index].title,
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(transactionsList[index].date.toString()),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deleteTx(transactionsList[index].id),
                    ),
                  ),
                );
              },
              itemCount: transactionsList.length,
            ),
    );
  }
}
