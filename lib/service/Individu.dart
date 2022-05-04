class Individus{
  late int _id;
  late String _firstname;
  late String _lastname;
  late String _birthday;
  late String _address;
  late String _mail;
  late String _gender;
  late String _picture;
  late String _citation;

  int get id => _id;

   void set id(int value) {
    _id = value;
  }
  String get firstname => _firstname;

  set firstname(String value) {
    _firstname = value;
  }

  String get lastname => _lastname;

  set lastname(String value) {
    _lastname = value;
  }

  String get birthday => _birthday;

  set birthday(String value) {
    _birthday = value;
  }

  String get address => _address;

  set address(String value) {
    _address = value;
  }

  String get mail => _mail;

  set mail(String value) {
    _mail = value;
  }

  String get gender => _gender;

  set gender(String value) {
    _gender = value;
  }

  String get picture => _picture;

  set picture(String value) {
    _picture = value;
  }

  String get citation => _citation;

  set citation(String value) {
    _citation = value;
  }
 Individus(){

 }

  Individus.fromMap(dynamic obj){
    this._id=obj['id'];
    this._firstname=obj['firstname'];
    this._lastname=obj['lastname'];
    this._birthday=obj['birthday'];
    this._address=obj['address'];
    this._mail=obj['mail'];
    this._gender=obj['gender'];
    this._picture=obj['picture'];
    this._citation=obj['citation'];
  }
  Map<String, dynamic> toMap() {
    final map = new Map <String ,dynamic>();
    map['id']=_id;
    map['firstname']=_firstname;
    map['lastname']=_lastname;
    map['birthday']=_birthday;
    map['address']=_address;
    map['mail']=_mail;
    map['gender']=_gender;
    map['picture']=_picture;
    map['citation']=_citation;
    return map;
  }
}