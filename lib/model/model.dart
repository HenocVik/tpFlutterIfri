import 'dart:math';

class Individu {
  const Individu({
    this.id,
    required this.firstname,
    required this.lastname,
    required this.birthday,
    required this.address,
    required this.mail,
    required this.gender,
    required this.citation,
    required this.picture,

  });

  factory Individu.fromMap(Map<String, dynamic> map) {
    final id = map['id'];
    final firstname = map['firstname'];
    final lastname = map['lastname'];
    final birthday = map['birthday'];
    final address = map['address'];
    final mail = map['mail'];
    final gender = map['gender'];

    final citation = map['citation'];
    final picture = map['picture'];
    if (firstname is! String) {
      throw Exception('Employee name from database must be a String');
    }
    if (id is! int?) {
      throw Exception('Employee id from database must be an integer');
    }

    return Individu(id: id, firstname: firstname, lastname: lastname, birthday: birthday, address: address,mail: mail,gender: gender,citation: citation,picture: picture,);
  }

  final int? id;
  final String firstname;
  final String lastname;
  final String birthday;
  final String address;
  final String mail;
  final String gender;
  final String citation;
  final String picture;

  Individu copyWith({
    int? id,
    String? firstname,
    String? lastname,
    String? birthday,
    String? address,
    String? mail,
    String? gender,
    String? citation,
    String? picture,
  }) {
    return Individu(
      id: id ?? this.id,
      firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
      birthday: birthday ?? this.birthday,
      address:  address  ?? this.address,
      mail:  mail ??this.mail,
      gender:  gender ?? this.gender,
      citation:  citation ?? this.citation,
      picture:  picture ?? this.picture
    );
  }

  Map<String, dynamic> toMap() => {'id': id, 'firstname': firstname,'lastname': lastname,'birthday':birthday,'address':address,'mail':mail,'gender':gender,'citation':citation,'picture':picture};

  @override
  String toString() {
    return toMap().toString();
  }
}