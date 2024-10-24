import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class initialize extends ChangeNotifier {
  //* initialize firebase storage
  final firebaseStorage = FirebaseStorage.instance;

  List<String> imageUrls = [];
  bool isLoading = false;
  bool isUploading = false;

  List<String> get getImageUrls {
    return imageUrls;
  }

  bool get getIsLoading {
    return isLoading;
  }

  bool get getIsUploading {
    return isUploading;
  }

  //! read images
  Future<void> fetchImages() async {
    isLoading = true;
    final ListResult result =
        await firebaseStorage.ref('upload_images/').list();

    final urls = await Future.wait(
      result.items.map(
        (ref) => ref.getDownloadURL(),
      ),
    );

    imageUrls = urls; //*show this list in UI
    isLoading = false;
    notifyListeners();
  }

  //! upload images
  Future<void> uploadImages() async {
    isUploading = true;
    notifyListeners();
    //* ImagePicker is used to pick an image from device gallery
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      File file = File(image.path);
      try {
        String filePath = 'upload_images/${image.name}';
        //* putFile upload the image
        UploadTask uploadTask = firebaseStorage.ref(filePath).putFile(file);
        String downloadUrl = await (await uploadTask).ref.getDownloadURL();
        //* update the image url list and UI
        imageUrls.add(downloadUrl);
        isUploading = false;
        notifyListeners();
      } catch (error) {
        print("Error uploading image in firebase: $error");
      } finally {
        isUploading = false;
        notifyListeners();
      }
    }
  }
}
