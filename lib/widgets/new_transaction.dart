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
    return SingleChildScrollView(
      child: Container(
        color: Colors.blueGrey[200],
        padding: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: titleController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(color: Colors.black),
              ),
              onSubmitted: (_) => _submitTx(),
            ),
            TextField(
              controller: amountController,
              cursorColor: Colors.black,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount',
                labelStyle: TextStyle(color: Colors.black),
              ),
              // '_' to mention we didn't use that argument
              onSubmitted: (_) =>
                  _submitTx(), //Here val mentioning is mandatory but we didn't use it
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Text(_selectedDate == null
                          ? 'No date selected!'
                          : 'Selected Date: ${DateFormat.yMd().format(_selectedDate)}')),
                  RaisedButton(
                    child: Text(
                      'Select Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    color: Colors.redAccent,
                    textColor: Colors.white,
                    onPressed: _DatePicker,
                  ),
                ],
              ),
            ),
            RaisedButton(
              onPressed: _submitTx,
              child: Text('Add Transaction'),
              textColor: Colors.white,
              color: Colors.redAccent,
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
