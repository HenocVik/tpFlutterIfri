import 'dart:io' as io;
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:read_json_file/model/model.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

class DBHelper {
  static Database? _db;
  static const String ID = 'id';
  static const String FIRSTNAME = 'firstname';
  static const String LASTNAME = 'lastname';
  static const String BIRTHDAY = 'birthday';
  static const String ADDRESS = 'address';
  static const String MAIL = 'mail';
  static const String GENDER = 'gender';
  static const String CITATION = 'citation';
  static const String PICTURE = 'picture';

  static const String TABLE = 'Individus';
  static const String DB_NAME = 'individus.db';


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
        '$FIRSTNAME TEXT,'
        '$LASTNAME TEXT,'
        '$BIRTHDAY TEXT,'
        '$ADDRESS TEXT,'
        '$MAIL TEXT,'
        '$GENDER TEXT,'
        '$CITATION TEXT,'
        '$PICTURE TEXT)');;
  }

  Future<Individu> save(Individu individu) async {
    final dbClient = await db;
    final id = await dbClient.insert(TABLE, individu.toMap());
    return individu.copyWith(id: id);
  }

  Future<List<Individu>> getEmployees() async {
    final dbClient = await db;
    final maps = await dbClient.query(TABLE, columns: [ID, FIRSTNAME,LASTNAME,BIRTHDAY,ADDRESS,MAIL,GENDER,CITATION,PICTURE]);
    final employees = <Individu>[];

    if (maps.isNotEmpty) {
      for (int i = 0; i < maps.length; i++) {
        employees.add(Individu.fromMap(maps[i]));
      }
    }

    return employees;
  }

  Future close() async {
    final dbClient = await db;
    dbClient.close();
  }
}