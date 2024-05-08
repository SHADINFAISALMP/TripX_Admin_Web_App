



class Usermodel {
  final id;
  final String name;
  final String email;
  final String phonenumber;
  final String password;
  final String place;
  final String imagepath;

  Usermodel(
      {this.id,
      required this.name,
      required this.email,
      required this.phonenumber,
      required this.password,
      required this.place,
      required this.imagepath});

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      'email': email,
      "phonenumber": phonenumber,
      "password": password,
      "place": place,
      "imagepath": imagepath
    };
  }

  // factory Usermodel.fromSnapshot(
  //     QueryDocumentSnapshot<Object?> document) {
  //   Map<String, dynamic> data = document.data() as Map<String, dynamic>;
  //   return Usermodel(
  //     id : document.id,
  //       name: data['name'] ?? '',
  //       email: data['email'] ?? '',
  //       phonenumber: data['phonenumber'] ?? '',
  //       password: data['password'],
  //       confirmpassword: data['confirmpassword'],
  //       imagepath: data['imagepath'] ?? '');
  // }
}
