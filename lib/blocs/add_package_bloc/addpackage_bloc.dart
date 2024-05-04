
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tripx_admin_application/data_provider/package_data.dart';
import 'package:tripx_admin_application/firebase_collection_refernce/package_information.dart';
import 'package:tripx_admin_application/utils/colors.dart';

part 'addpackage_event.dart';
part 'addpackage_state.dart';

class AddpackageBloc extends Bloc<AddpackageEvent, AddpackageState> {
  AddpackageBloc() : super(const AddpackageState()) {
    on<Multipleimageselected>(_multipleimageselection);
    on<UnMultipleimageselected>(_unmultipleimageselection);
    on<UploadimageEvent>(_uploadImages);
    on<Startdatepressed>(_startdatepressed);
    on<EndDatePressed>(_enddatepressed);
    // on<FetchingpackageDetalsEvent>(_fetchPackageDetails);
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
        emit(ImageUploadError(e.toString(), errorMessage: ''));
        return;
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
      // ignore: use_build_context_synchronously
      PackagedetailsData packagedetailsData = PackagedetailsData(event.context);
      getStartDate(context) {
        return BlocProvider.of<AddpackageBloc>(event.context).state.startDate;
      }

      getEndDate(context) {
        return BlocProvider.of<AddpackageBloc>(event.context).state.endDate;
      }

      Map<String, dynamic> packageDetailsMap = packagedetailsData.userData(img,
          getStartDate: getStartDate, getEndDate: getEndDate);
      await packageDetails.add(packageDetailsMap);
    } catch (e) {
      print("error on full details");
      emit(PackageError(
          errorMessage:
              e.toString())); // Emit an error state if there's an error
      return;
    }
    emit(ImageUploadSuccess(
        packageimages: packageImages, packageImages: const {}));
  }

  _startdatepressed(
      Startdatepressed event, Emitter<AddpackageState> emit) async {
    final ThemeData themeData = Theme.of(event.context);
    final DateTime? picked = await showDatePicker(
      context: event.context,
      initialDate: state.startDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: themeData.copyWith(
            colorScheme: const ColorScheme.light(
              primary: colorteal,
              onPrimary: whitecolor,
              onSurface: colorteal,
            ),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
            dialogBackgroundColor: whitecolor,
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != state.startDate) {
      emit(state.copywith(startDate: picked));
    }
  }

  _enddatepressed(EndDatePressed event, Emitter<AddpackageState> emit) async {
    final ThemeData themeData = Theme.of(event.context);
    final DateTime? picked = await showDatePicker(
      context: event.context,
      initialDate: state.endDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: themeData.copyWith(
            colorScheme: const ColorScheme.light(
              primary: colorteal,
              onPrimary: whitecolor,
              onSurface: colorteal,
            ),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
            dialogBackgroundColor: whitecolor,
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != state.endDate) {
      emit(state.copywith(endDate: picked));
    }
  }

  // Future<void> _fetchPackageDetails(
  //     FetchingpackageDetalsEvent event, Emitter<AddpackageState> emit) async {
  //   emit(FetchingPackageLoading());
  //   try {
  //     // Fetch package details from Firebase
  //     final packageDetails = await fetchPackageDetailsFromFirebase();
  //     emit(FetchingPackageDetailsSucess(packageDetails));
  //   } catch (e) {
  //     emit(FetchPackageDetailsFailure(e.toString()));
  //   }
  // }

  // Future<List<PackageDetailsModel>> fetchPackageDetailsFromFirebase() async {
  //   final snapshot =
  //       await FirebaseFirestore.instance.collection('packagedetails').get();
  //   return snapshot.docs
  //       .map((doc) => PackageDetailsModel.fromSnapshot(doc))
  //       .toList();
  // }
}
