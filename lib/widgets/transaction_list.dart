import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myexpenses/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  TransactionList(this.transaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transaction.isEmpty ? 
        Column(children: <Widget>[
          Text(
            'Nothing here. Add your first transaction!', 
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20,),
          Container(
            height: 200,
            child: Image.asset(
              'assets/images/waiting.png', 
              fit: BoxFit.cover,
              ),
            ),
        ],)
        
        : ListView.builder(
        itemBuilder: (context, index){
          return Card(
                color: Colors.grey[100],
                elevation: 5,
                child: Row(children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),

                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColorDark,
                        width: 2,
                        ),
                    ),

                    child: Text(
                      //Roundung to 2 decimal points if entered
                      '\u{20B9} ${transaction[index].amount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    //TITLE OF TRANSACTION
                    Text(
                      transaction[index].title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,    
                      ),
                    ),
                    //DATE
                    Text(
                      DateFormat.yMMMd().format(transaction[index].date),
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                  ],),
                ], ),
              );
        },
        itemCount: transaction.length,
      ),
    );
  }
}