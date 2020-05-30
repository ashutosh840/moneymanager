import 'dart:async';
import 'dart:async';
import 'dart:core';

import 'dart:wasm';

import 'package:moneymanager/Database/Type.dart';
import 'package:moneymanager/Database/Type.dart';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';


import 'Type.dart';

part 'Accounts.g.dart';

class Accounts extends Table{

  IntColumn get id=> integer().autoIncrement()();
  DateTimeColumn get date_time=>dateTime()();
  IntColumn get type=>intEnum<Type>()();
  RealColumn get amount=>real()();

}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}


@UseMoor(tables:[Accounts],daos: [AccountDao] )
class MyDatabase extends _$MyDatabase {

  MyDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;
}


@UseDao(tables: [Accounts])
class AccountDao extends DatabaseAccessor<MyDatabase> with _$AccountDaoMixin {
  final MyDatabase db;

  // Called by the AppDatabase class
  AccountDao(this.db) : super(db);

  Future<List<Account>> getAllAccounts()=>select(accounts).get();
  Stream<List<Account>> watchAllAccounts()=>select(accounts).watch();


  Future insertAccount(Account account) => into(accounts).insert(account);
  Future updateAccount(Account account) => update(accounts).replace(account);
  Future deleteAccount(Account account) => delete(accounts).delete(account);

//TODO 1. Add Query for getting total amount
//TODO 2. Add Query for getting total amount as per type




}

