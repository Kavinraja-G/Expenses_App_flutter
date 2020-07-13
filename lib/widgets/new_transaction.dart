import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  DateTime _selectedDate;
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
              onSubmitted: (_) => _submitTx(),
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              // '_' to mention we didn't use that argument
              onSubmitted: (_) =>
                  _submitTx(), //Here val mentioning is mandatory but we didn't use it
            ),
            Container(
              height: 75,
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Text(_selectedDate == null
                          ? 'No date selected!'
                          : 'Selected Date: ${DateFormat.yMd().format(_selectedDate)}')),
                  FlatButton(
                    child: Text(
                      'Select Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    textColor: Colors.deepPurple,
                    onPressed: _DatePicker,
                  ),
                ],
              ),
            ),
            RaisedButton(
              onPressed: _submitTx,
              child: Text('Add Transaction'),
              textColor: Colors.white,
              color: Colors.deepPurple,
              elevation: 5,
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void _DatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((datePicked) {
      if (datePicked == null) return;
      setState(() {
        _selectedDate = datePicked;
      });
    });
  }

  void _submitTx() {
    if (amountController.text.isEmpty) return;
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      //Simply return
      return;
    }
    widget.addTx(enteredTitle, enteredAmount, _selectedDate);
    //Closing the modal sheet
    Navigator.of(context).pop();
  }
}
