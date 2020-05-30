import 'package:backdrop/backdrop.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:moneymanager/Database/Accounts.dart';
import 'package:moneymanager/createAccountPage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Accounts'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: _buildTaskList(context),
          ),
          FloatingActionButton(
            elevation: 10,
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
            child: Icon(Icons.add),
          )
        ],
      ),
    ));
  }
}

StreamBuilder<List<Account>> _buildTaskList(BuildContext context) {
  final dao = Provider.of<AccountDao>(context);
  return StreamBuilder(
    stream: dao.watchAllAccounts(),
    builder: (context, AsyncSnapshot<List<Account>> snapshot) {
      final accounts = snapshot.data ?? List();

      if (accounts == null) {
        return Text('No Accounts Yet');
      } else {
        return ListView.builder(
          itemCount: accounts.length,
          itemBuilder: (_, index) {
            final itemAccount = accounts[index];
            return _buildListItem(itemAccount, dao);
          },
        );
      }
    },
  );
}

Widget _buildListItem(Account itemAccount, AccountDao dao) {
  return Card(
      child: ListTile(
    isThreeLine: true,
    title: Text(itemAccount.amount.toString()),
    subtitle:
        Text(' ${itemAccount.type} \n ${itemAccount.date_time.toString()} '),
  ));
}
