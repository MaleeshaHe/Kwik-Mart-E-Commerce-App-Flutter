import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kwik_mart/controllers/storeage_controller.dart';
import 'package:kwik_mart/utils/custom_dialog.dart';

class AdminProvider extends ChangeNotifier {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  File _image = File("");
  ImagePicker picker = ImagePicker();
  CollectionReference product =
      FirebaseFirestore.instance.collection("Products");

  TextEditingController get nameController => _nameController;
  TextEditingController get descriptionController => _descriptionController;
  TextEditingController get typeController => _typeController;
  TextEditingController get priceController => _priceController;
  File get image => _image;

  Future<void> addProduct(BuildContext context) async {
    if (_nameController.text.isEmpty) {
      CustomDialog.toast(context, "Insert Product Name");
    } else if (_descriptionController.text.isEmpty) {
      CustomDialog.toast(context, "Insert Product Description");
    } else if (_priceController.text.isEmpty) {
      CustomDialog.toast(context, "Insert Product Price");
    } else if (_typeController.text.isEmpty) {
      CustomDialog.toast(context, "Insert Product Type");
    } else if (_image.path == "") {
      CustomDialog.toast(context, "Insert Product Image");
    } else {
      CustomDialog.show(context);
      String imageUrl =
          await StorageController().uploadImage(_image, "Product Images");
      DocumentReference productDoc = await product.add({
        "name": _nameController.text,
        "description": _descriptionController.text,
        "price": _priceController,
        "type": _typeController,
        "image": imageUrl,
      }).then((value) {
        product.doc(value.id).update({"id": value.id});
        CustomDialog.toast(context, "Product Added");
        CustomDialog.dismiss(context);
        return value;
      });
    }
  }

  Future<void> pickImage(context) async {
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _image = File(pickedImage.path);
      notifyListeners();
    } else {
      CustomDialog.toast(context, "Image Picker Canelled");
    }
  }
}
