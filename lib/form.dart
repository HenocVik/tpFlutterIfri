import 'dart:math';

import 'package:flutter/material.dart';
import 'package:read_json_file/model/model.dart';
import 'package:read_json_file/service/service.dart';



class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final _firstnameController = TextEditingController();
  final _adressControler = TextEditingController();
  final _phoneController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _gendreController = TextEditingController();
  final _pictureUrlController = TextEditingController();
  final _citationController = TextEditingController();
  final _sexController = TextEditingController();
  String generateRandomString(int len) {
    var r = Random();
    return String.fromCharCodes(
        List.generate(len, (index) => r.nextInt(33) + 89));
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Inscription"),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 5),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            keyboardType: TextInputType.name,
                            controller: _firstnameController,

                            decoration: const InputDecoration(
                              hintText: 'Votre nom ?',
                              hintStyle: TextStyle(
                                color: Color.fromARGB(183, 94, 171, 56),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xFFBEC5D1),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xFFBEC5D1),
                                ),
                              ),
                              labelText: 'Nom *',
                              suffixStyle: TextStyle(
                                  color: const Color.fromARGB(183, 94, 171, 56)),
                            ),
                            validator: (String? value) {
                              return (value == null || value == "")
                                  ? 'Ce champ est obligatoire:'
                                  : null;
                            },
                            //onSaved: (val) => name = val!,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.name,
                            controller: _lastnameController,
                            decoration: const InputDecoration(
                              hintText: 'Vos prenoms ?',
                              labelText: 'Prenoms*',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xFFBEC5D1),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xFFBEC5D1),
                                ),
                              ),
                              hintStyle: TextStyle(
                                color: Color.fromARGB(183, 94, 171, 56),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            validator: (String? value) {
                              return (value == null || value == "")
                                  ? 'Ce champ est obligatoire:'
                                  : null;
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: _adressControler,
                            decoration: const InputDecoration(
                              hintText: 'votre adresse?',
                              labelText: 'Adresse *',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xFFBEC5D1),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xFFBEC5D1),
                                ),
                              ),
                              hintStyle: TextStyle(
                                color: const Color.fromARGB(183, 94, 171, 56),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            validator: (String? value) {
                              return (value == null || value == "")
                                  ? 'Ce champ est obligatoire:'
                                  : null;
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: _phoneController,
                            decoration: const InputDecoration(
                              hintText: 'numero de telephone?',
                              labelText: 'Contact *',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xFFBEC5D1),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xFFBEC5D1),
                                ),
                              ),
                              hintStyle: TextStyle(
                                color: Color.fromARGB(183, 94, 171, 56),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            validator: (String? value) {
                              return (value == null || value == "")
                                  ? 'Ce champ est obligatoire:'
                                  : null;
                            },
                            //onSaved: (val) => num = val!,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: _sexController,
                            decoration: const InputDecoration(
                              hintText: 'votre sex?',
                              labelText: 'Sex *',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xFFBEC5D1),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xFFBEC5D1),
                                ),
                              ),
                              hintStyle: TextStyle(
                                color: Color.fromARGB(183, 94, 171, 56),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            validator: (String? value) {
                              return (value == null || value == "")
                                  ? 'Ce champ est obligatoire:'
                                  : null;
                            },
                            //onSaved: (val) => num = val!,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            controller: _pictureUrlController,
                            decoration: const InputDecoration(
                                hintText: 'https://affjgll',
                                labelText: 'Url photo *',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                  borderSide: BorderSide(
                                    color: Color(0xFFBEC5D1),
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                  borderSide: BorderSide(
                                    color: Color(0xFFBEC5D1),
                                  ),
                                ),
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(183, 94, 171, 56),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                )),

                            // onSaved: (val) => pwd = val!,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            controller: _citationController,
                            decoration: const InputDecoration(
                              hintText: 'Votre citation preferé?',
                              labelText: 'Citation *',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xFFBEC5D1),
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xFFBEC5D1),
                                ),
                              ),
                              hintStyle: TextStyle(
                                color: Color.fromARGB(183, 94, 171, 56),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            // onSaved: (val) => conPwd = val!,
                          ),
                          SizedBox(
                            height: he * 0.04,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              final dbHelper = DBHelper();
                              await dbHelper.initDb();

                              final bob =  dbHelper.save(Individu(firstname: _firstnameController.text, lastname: _lastnameController.text, birthday: '11', address: _adressControler.text, mail: 'bobo@gmail.com', gender: _sexController.text, citation: _citationController.text, picture: _pictureUrlController.text));
                              //final john = await dbHelper.save(Employee(name: 'John'));
                              print(_firstnameController.text);
                            },
                            child: const Text('Valider'),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              // shadowColor: Color.fromARGB(183, 35, 98, 3),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ));
  }
}
