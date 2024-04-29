import 'package:tripx_admin_application/data_provider/add_image_to_firebase.dart';
import 'package:tripx_admin_application/data_provider/user_data.dart';
import 'package:tripx_admin_application/firebase_collection_refernce/user_information.dart';


class AddUserDetailstoFirebase {
  addDataToFirebase(context) async {
    try {
      final profileImageUrl =
          await Addimagetofirebase().addprofileimagetofirebase(context);
      final data = UserdetailsData().userData(profileImageUrl!);
    await  userDetails.add(data);
    } catch (e) {
      print("error $e");
    }
  }
}
