/*import 'package:read_json_file/model/model.dart';
import 'package:read_json_file/service/service.dart';
import 'package:read_json_file/service/Individu.dart';

class Controller{
  DatabaseHelper con= new DatabaseHelper();
  Future<int> saveUser(Individus user) async {
    var dbClient = await con.db;
    int res = await dbClient.insert('user', user.toMap());
    return res;
  } //deletion

  Future<int> deleteUser(Individu user) async {
    var dbClient = await con.db;
    int res = await dbClient.delete("User");
    return res;
  }

  Future<List<Individu>> getAllUser() async {
    var dbClient = await con.db;
    var res = await dbClient.query("user");
    List<Individu>? list =
    res.isNotEmpty ? res.map((c) => Individu.fromMap(c)).toList() : null;
    return list!;
  }
}*/