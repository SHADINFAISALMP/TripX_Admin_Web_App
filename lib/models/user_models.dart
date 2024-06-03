// ignore_for_file: prefer_typing_uninitialized_variables

class Usermodel {
  final id;
  final String name;
  final String email;
  final String phonenumber;
  final String place;
  final String imagepath;

  Usermodel(
      {this.id,
      required this.name,
      required this.email,
      required this.phonenumber,
      required this.place,
      required this.imagepath,});

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      'email': email,
      "phonenumber": phonenumber,
      "place": place,
      "imagepath": imagepath
    };
  }
}
