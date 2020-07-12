import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              onSubmitted: (_) => submitTx(),
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              // '_' to mention we didn't use that argument
              onSubmitted: (_) =>
                  submitTx(), //Here val mentioning is mandatory but we didn't use it
            ),
            RaisedButton(
              onPressed: submitTx,
              child: Text('Add Transaction'),
              textColor: Colors.deepPurple,
              color: Colors.white70,
              elevation: 5,
            ),
          ],
        ),
      ),
    );
  }

  void submitTx() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      //Simply return
      return;
    }
    widget.addTx(enteredTitle, enteredAmount);
    //Closing the modal sheet
    Navigator.of(context).pop();
  }
}
