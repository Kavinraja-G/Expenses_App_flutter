import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myexpenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTx;
  TransactionList(this.transaction, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'Nothing here. Add your first transaction!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(1.5),
                child: Card(
                  color: Colors.blueGrey[100],
                  elevation: 5,
                  child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue[1000],
                        radius: 30,
                        child: Padding(
                            padding: EdgeInsets.all(6),
                            child: FittedBox(
                                child: Text(
                              '\u{20B9}${transaction[index].amount}',
                              style: TextStyle(color: Colors.white),
                            ))),
                      ),
                      title: Text(transaction[index].title),
                      subtitle: Text(
                          DateFormat.yMMMd().format(transaction[index].date)),
                      trailing: IconButton(
                        icon: Icon(Icons.delete_outline),
                        color: Colors.red,
                        onPressed: () => deleteTx(transaction[index].id),
                      )),
                ),
              );
            },
            itemCount: transaction.length,
          );
  }
}
