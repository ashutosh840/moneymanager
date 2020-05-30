// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Accounts.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Account extends DataClass implements Insertable<Account> {
  final int id;
  final DateTime date_time;
  final Type type;
  final double amount;
  Account(
      {@required this.id,
      @required this.date_time,
      @required this.type,
      @required this.amount});
  factory Account.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Account(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      date_time: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}date_time']),
      type: $AccountsTable.$converter0.mapToDart(
          intType.mapFromDatabaseResponse(data['${effectivePrefix}type'])),
      amount:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}amount']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || date_time != null) {
      map['date_time'] = Variable<DateTime>(date_time);
    }
    if (!nullToAbsent || type != null) {
      final converter = $AccountsTable.$converter0;
      map['type'] = Variable<int>(converter.mapToSql(type));
    }
    if (!nullToAbsent || amount != null) {
      map['amount'] = Variable<double>(amount);
    }
    return map;
  }

  AccountsCompanion toCompanion(bool nullToAbsent) {
    return AccountsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      date_time: date_time == null && nullToAbsent
          ? const Value.absent()
          : Value(date_time),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      amount:
          amount == null && nullToAbsent ? const Value.absent() : Value(amount),
    );
  }

  factory Account.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Account(
      id: serializer.fromJson<int>(json['id']),
      date_time: serializer.fromJson<DateTime>(json['date_time']),
      type: serializer.fromJson<Type>(json['type']),
      amount: serializer.fromJson<double>(json['amount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date_time': serializer.toJson<DateTime>(date_time),
      'type': serializer.toJson<Type>(type),
      'amount': serializer.toJson<double>(amount),
    };
  }

  Account copyWith({int id, DateTime date_time, Type type, double amount}) =>
      Account(
        id: id ?? this.id,
        date_time: date_time ?? this.date_time,
        type: type ?? this.type,
        amount: amount ?? this.amount,
      );
  @override
  String toString() {
    return (StringBuffer('Account(')
          ..write('id: $id, ')
          ..write('date_time: $date_time, ')
          ..write('type: $type, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(date_time.hashCode, $mrjc(type.hashCode, amount.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Account &&
          other.id == this.id &&
          other.date_time == this.date_time &&
          other.type == this.type &&
          other.amount == this.amount);
}

class AccountsCompanion extends UpdateCompanion<Account> {
  final Value<int> id;
  final Value<DateTime> date_time;
  final Value<Type> type;
  final Value<double> amount;
  const AccountsCompanion({
    this.id = const Value.absent(),
    this.date_time = const Value.absent(),
    this.type = const Value.absent(),
    this.amount = const Value.absent(),
  });
  AccountsCompanion.insert({
    this.id = const Value.absent(),
    @required DateTime date_time,
    @required Type type,
    @required double amount,
  })  : date_time = Value(date_time),
        type = Value(type),
        amount = Value(amount);
  static Insertable<Account> custom({
    Expression<int> id,
    Expression<DateTime> date_time,
    Expression<int> type,
    Expression<double> amount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date_time != null) 'date_time': date_time,
      if (type != null) 'type': type,
      if (amount != null) 'amount': amount,
    });
  }

  AccountsCompanion copyWith(
      {Value<int> id,
      Value<DateTime> date_time,
      Value<Type> type,
      Value<double> amount}) {
    return AccountsCompanion(
      id: id ?? this.id,
      date_time: date_time ?? this.date_time,
      type: type ?? this.type,
      amount: amount ?? this.amount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date_time.present) {
      map['date_time'] = Variable<DateTime>(date_time.value);
    }
    if (type.present) {
      final converter = $AccountsTable.$converter0;
      map['type'] = Variable<int>(converter.mapToSql(type.value));
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    return map;
  }
}

class $AccountsTable extends Accounts with TableInfo<$AccountsTable, Account> {
  final GeneratedDatabase _db;
  final String _alias;
  $AccountsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _date_timeMeta = const VerificationMeta('date_time');
  GeneratedDateTimeColumn _date_time;
  @override
  GeneratedDateTimeColumn get date_time => _date_time ??= _constructDateTime();
  GeneratedDateTimeColumn _constructDateTime() {
    return GeneratedDateTimeColumn(
      'date_time',
      $tableName,
      false,
    );
  }

  final VerificationMeta _typeMeta = const VerificationMeta('type');
  GeneratedIntColumn _type;
  @override
  GeneratedIntColumn get type => _type ??= _constructType();
  GeneratedIntColumn _constructType() {
    return GeneratedIntColumn(
      'type',
      $tableName,
      false,
    );
  }

  final VerificationMeta _amountMeta = const VerificationMeta('amount');
  GeneratedRealColumn _amount;
  @override
  GeneratedRealColumn get amount => _amount ??= _constructAmount();
  GeneratedRealColumn _constructAmount() {
    return GeneratedRealColumn(
      'amount',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, date_time, type, amount];
  @override
  $AccountsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'accounts';
  @override
  final String actualTableName = 'accounts';
  @override
  VerificationContext validateIntegrity(Insertable<Account> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('date_time')) {
      context.handle(_date_timeMeta,
          date_time.isAcceptableOrUnknown(data['date_time'], _date_timeMeta));
    } else if (isInserting) {
      context.missing(_date_timeMeta);
    }
    context.handle(_typeMeta, const VerificationResult.success());
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount'], _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Account map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Account.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $AccountsTable createAlias(String alias) {
    return $AccountsTable(_db, alias);
  }

  static TypeConverter<Type, int> $converter0 =
      const EnumIndexConverter<Type>(Type.values);
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $AccountsTable _accounts;
  $AccountsTable get accounts => _accounts ??= $AccountsTable(this);
  AccountDao _accountDao;
  AccountDao get accountDao => _accountDao ??= AccountDao(this as MyDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [accounts];
}

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$AccountDaoMixin on DatabaseAccessor<MyDatabase> {
  $AccountsTable get accounts => attachedDatabase.accounts;
}
