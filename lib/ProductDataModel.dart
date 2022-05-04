class ProductDataModel{
  int? id;
  String? firstname;
  String? lastname;
  String? birthday;
  String? address;
  String? mail;
  String? gender;
  String? picture;
  String? citation;

  ProductDataModel(
      {this.id,
      this.firstname,
      this.lastname,
      this.birthday,
      this.address,
      this.mail,
      this.gender,
      this.picture,
      this.citation
      });

  ProductDataModel.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    firstname =json['firstname'];
    lastname = json['lastname'];
    birthday = json['birthday'];
    address = json['address'];
    mail = json['mail'];
    gender = json['gender'];
    picture = json['picture'];
    citation = json['citation'];
  }


}
