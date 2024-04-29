class Usermodel {
  final String name;
  final String email;
  final String phonenumber;
  final String password;
  final String confirmpassword;
  final String imagepath;

  Usermodel(
      {required this.name,
      required this.email,
      required this.phonenumber,
      required this.password,
      required this.confirmpassword,
      required this.imagepath});

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      'email': email,
      "phonenumber": phonenumber,
      "password": password,
      "confirmpassword": confirmpassword,
      "imagepath": imagepath
    };
  }
}
