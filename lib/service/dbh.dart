/*import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dbHelper = DBHelper();
  await dbHelper.initDb();

  final bob = await dbHelper.save(Employee(name: 'Bob'));
  final john = await dbHelper.save(Employee(name: 'John'));

  final employees = await dbHelper.getEmployees();

  print(bob);
  print(john);
  print(employees);

  runApp(const MaterialApp(home: Text('app')));
}

class Employee {
  const Employee({
    this.id,
    required this.name,
  });

  factory Employee.fromMap(Map<String, dynamic> map) {
    final id = map['id'];
    final name = map['name'];
    if (name is! String) {
      throw Exception('Employee name from database must be a String');
    }
    if (id is! int?) {
      throw Exception('Employee id from database must be an integer');
    }

    return Employee(id: id, name: name);
  }

  final int? id;
  final String name;

  Employee copyWith({
    int? id,
    String? name,
  }) {
    return Employee(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() => {'id': id, 'name': name};

  @override
  String toString() {
    return toMap().toString();
  }
}

class DBHelper {
  static Database? _db;
  static const String ID = 'id';
  static const String NAME = 'name';
  static const String TABLE = 'PhotosTable';
  static const String DB_NAME = 'photos.db';

  Future<Database> get db async {
    if (null != _db) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  Future<Database> initDb() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = '$documentsDirectory${Platform.pathSeparator}$DB_NAME';
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE $TABLE ('
        '$ID INTEGER PRIMARY KEY AUTOINCREMENT, '
        '$NAME TEXT)');
  }

  Future<Employee> save(Employee employee) async {
    final dbClient = await db;
    final id = await dbClient.insert(TABLE, employee.toMap());
    return employee.copyWith(id: id);
  }

  Future<List<Employee>> getEmployees() async {
    final dbClient = await db;
    final maps = await dbClient.query(TABLE, columns: [ID, NAME]);
    final employees = <Employee>[];

    if (maps.isNotEmpty) {
      for (int i = 0; i < maps.length; i++) {
        employees.add(Employee.fromMap(maps[i]));
      }
    }

    return employees;
  }

  Future close() async {
    final dbClient = await db;
    dbClient.close();
  }
}*/
