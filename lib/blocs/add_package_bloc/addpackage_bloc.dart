import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tripx_admin_application/data_provider/package_data.dart';
import 'package:tripx_admin_application/firebase_collection_refernce/package_information.dart';

part 'addpackage_event.dart';
part 'addpackage_state.dart';

class AddpackageBloc extends Bloc<AddpackageEvent, AddpackageState> {
  AddpackageBloc() : super(const AddpackageState()) {
    on<Multipleimageselected>(_multipleimageselection);
    on<UnMultipleimageselected>(_unmultipleimageselection);
    on<UploadimageEvent>(_uploadImages);
    
  }

  Future<void> _multipleimageselection(
      Multipleimageselected event, Emitter<AddpackageState> emit) async {
    emit(state.copywith(images: event.images));
  }

  Future<void> _unmultipleimageselection(
      UnMultipleimageselected event, Emitter<AddpackageState> emit) async {
    emit(state.copywith(images: []));
  }

  Future<void> _uploadImages(
      UploadimageEvent event, Emitter<AddpackageState> emit) async {
    Map<String, String> packageImages = {};
    for (var image in event.images) {
      try {
        final bytes = await image.readAsBytes();
     
        final fileName =
            'packageimages/${DateTime.now().millisecondsSinceEpoch}.jpg';
      
        firebase_storage.SettableMetadata metadata =
            firebase_storage.SettableMetadata(
          contentType: 'image/jpeg',
          customMetadata: <String, String>{
            'uploaded_by': 'user_id', 
       
          },
        );
      
        final ref = FirebaseStorage.instance.ref().child(fileName);
        await ref.putData(bytes, metadata);
      
        final url = await ref.getDownloadURL();
 
        packageImages[fileName] = url;
        print(" urls $url");
      } catch (e) {
        emit(ImageUploadError(e.toString()));
      }
    }
    print("package $packageImages");
    List<String> img = [];
    packageImages.forEach(
      (key, value) {
        img.add(value);
      },
    );
   
   
    try {
      PackagedetailsData packagedetailsData = PackagedetailsData();
      Map<String, dynamic> packageDetailsMap = packagedetailsData.userData(
          img);
      await packageDetails.add(packageDetailsMap);
    } catch (e) {
      print("error on full details");
    }
    emit(ImageUploadSuccess(packageimages: packageImages));
    return;
  }
}
