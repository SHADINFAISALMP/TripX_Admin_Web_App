import 'package:tripx_admin_application/models/user_models.dart';
import 'package:tripx_admin_application/utils/controllers.dart';


class UserdetailsData {
  Map<String, dynamic> userData(String downloadURL) {
    final data = Usermodel(
            name: namecontroller.text.trim(),
            email: emailcontroller.text.trim(),
            phonenumber: phonecontroller.text.trim(),
            place: placecontroller.text.trim(),
            imagepath: downloadURL)
        .toMap();
    return data;
  }
}
