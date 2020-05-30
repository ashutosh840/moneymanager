import 'dart:wasm';

import 'package:flutter/material.dart';
import 'package:moneymanager/Database/Accounts.dart';
import 'package:provider/provider.dart';
import 'Database/Accounts.dart';
import 'Database/Accounts.dart';
import 'createAccountPage.dart';
import 'homePage.dart';
import 'package:moneymanager/Database/Type.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => MyDatabase().accountDao,
        ),
        ChangeNotifierProvider(
          create: (_) => _Account(),
        )
      ],
      child: MaterialApp(initialRoute: '/', routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => HomePage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => CreateAccountPage()
      },

      ),
    );
  }
}

class _Account extends ChangeNotifier {
  DateTime date_time;
  Type type;
  Double amount;

  void addAccount(DateTime date_time, Type type , Double amount){

   date_time=this.date_time;
   type=this.type;
   amount=this.amount;

  }

}
