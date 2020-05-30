import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:moneymanager/Database/Accounts.dart';
import 'package:moneymanager/Database/Type.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:enum_to_string/enum_to_string.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  @override
  double amount;
  Type type;
  DateTime date_time;
  String _currentSelectedValue;
  var types = ["SNACKS", "ENTERTAINMENT", "STATIONARY", "OTHER"];

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (text) {
                    amount = double.parse(text);
                  },
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: DropdownButton<String>(
                        items: types.map((String DropDownItem) {
                          return DropdownMenuItem<String>(
                            value: DropDownItem,
                            child: Text(DropDownItem),
                          );
                        }).toList(),
                        onChanged: (String newValue) {
                          setState(() {
                            _currentSelectedValue = newValue;
                            type = EnumToString.fromString(
                                Type.values, _currentSelectedValue);
                          });
                        },
                        value: _currentSelectedValue,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: (() async {
                        DateTime date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(DateTime.now().year - 10),
                            lastDate: DateTime(DateTime.now().year + 10));


                        if (date != null) {
                          setState(() {
                            date_time = date;
                          });
                        }
                      }),
                    ),
                    Text(date_time.toString())
                  ],
                ),
                FlatButton(
                  child: Text('ADD'),
                  onPressed: (() {
                    final dao = Provider.of<AccountDao>(context,listen: false);
                    dao.insertAccount(Account(
                        amount: amount, date_time: date_time, type: type));
                    Navigator.pop(context);


                    print(amount);
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {}
}
