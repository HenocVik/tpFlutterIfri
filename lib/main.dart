import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:read_json_file/ProductDataModel.dart';
import 'package:flutter/services.dart' as rootBundle;

import 'dart:async';

import 'package:path/path.dart';
import 'package:read_json_file/model/model.dart';
import 'package:read_json_file/service/Individu.dart';
import 'package:read_json_file/service/controller.dart';
import 'package:read_json_file/service/service.dart';
import 'package:read_json_file/form.dart';

//import 'package:read_json_file/individu.dart';
import 'package:sqflite/sqflite.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //var items =data.data as List<ProductDataModel>;
  final dbHelper =  DBHelper();
   await dbHelper.initDb();
  final employees = await  dbHelper.getEmployees();
  print(employees);
  runApp(MyApp());

}

//var locko = new individu(id: id, firstname: firstname, birthday: birthday, lastname: lastname, address: address, phone: phone, mail: mail, gender: gender, picture: picture, citation: citation)

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState(){
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [IconButton(onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddUser() ));}, icon: Icon(Icons.add))],),
      body: FutureBuilder(
        future: ReadJsonData(),
        builder: (context,data)  {
          if(data.hasError){
            return Center(child: Text("${data.error}"));
          }else if(data.hasData){
            var items =data.data as  List<ProductDataModel>;

            return ListView.builder(
              itemCount: items == null? 0: items.length,

                itemBuilder: (context,index){
                  var fi=items[index].firstname.toString();
                  var la=items[index].lastname.toString();
                  var bi=items[index].birthday.toString();
                  var ad=items[index].address.toString();
                  var ma=items[index].mail.toString();
                  var ge=items[index].gender.toString();
                  var ci=items[index].citation.toString();
                  var pi=items[index].picture.toString();
                  final dbHelper =  DBHelper();
                  dbHelper.initDb();
                  final bob =  dbHelper.save(Individu(firstname: fi, lastname: la, birthday: bi, address: ad, mail: ma, gender: ge, citation: ci, picture: pi));

                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            child: Image(image: NetworkImage(items[index].picture.toString()),fit: BoxFit.fill,),

                          ),
                          Expanded(child: Container(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(padding: EdgeInsets.only(left: 8,right: 8),child: Text('Name: ${items[index].firstname} '.toString(),style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold

                                ),),),
                                Padding(padding: EdgeInsets.only(left: 8,right: 8),child: Text('Lastname: ${items[index].lastname} '.toString()),),
                                Padding(padding: EdgeInsets.only(left: 8,right: 8),child: Text('Gender: ${items[index].gender} '.toString()),),
                              ],

                            ),
                          ))
                        ],
                      ),
                    ),
                  );
                }
            );

          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      )
    );
  }
  Future<List<ProductDataModel>>ReadJsonData() async{
     final jsondata = await rootBundle.rootBundle.loadString('jsonfile/productlist.json');
     final list = json.decode(jsondata) as List<dynamic>;

     return list.map((e) => ProductDataModel.fromJson(e)).toList();
  }

  }


