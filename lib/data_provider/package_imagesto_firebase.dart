import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_admin_application/blocs/add_package_bloc/addpackage_bloc.dart';

class AddPackageimagetofirebase {
  Future<void> uploadImages(
      UploadimageEvent event, Emitter<AddpackageState> emit) async {
    Map<String, String> packageImages = {};
    for (var image in event.images) {
      try {
        // Convert the image file to bytes
        final bytes = await image.readAsBytes();
        // Generate a unique name for the image
        final fileName =
            'packageimages/${DateTime.now().millisecondsSinceEpoch}.jpg';
        // Define the metadata
        firebase_storage.SettableMetadata metadata =
            firebase_storage.SettableMetadata(
          contentType: 'image/jpeg',
          customMetadata: <String, String>{
            'uploaded_by': 'user_id', // Example custom metadata
            // Add more custom metadata as needed
          },
        );
        // Upload the image to Firebase Storage with metadata
        final ref = FirebaseStorage.instance.ref().child(fileName);
        await ref.putData(bytes, metadata);
        // Get the download URL
        final url = await ref.getDownloadURL();
        // Add the image name and URL to the map
        packageImages[fileName] = url;
      } catch (e) {
        emit(ImageUploadError(e.toString()));
      }
    }
    emit(ImageUploadSuccess(packageimages: packageImages));
  }
}