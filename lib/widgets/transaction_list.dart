import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myexpenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTx;
  TransactionList(this.transaction, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return  transaction.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'Nothing here. Add your first transaction!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
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
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                            child:
                                Text('\u{20B9}${transaction[index].amount}'))),
                  ),
                  title: Text(transaction[index].title),
                  subtitle:
                      Text(DateFormat.yMMMd().format(transaction[index].date)),
                  trailing: IconButton(
                      icon: Icon(Icons.delete_outline),
                      color: Colors.red,
                      onPressed: () =>deleteTx(transaction[index].id),
                ));
              },
              itemCount: transaction.length,
      );
  }
}
