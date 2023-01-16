import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../app_config.dart';
import '../../../../core/utils/color_constant.dart';
import '../../../../core/utils/image_constant.dart';
import '../../../../core/utils/size_utils.dart';

var imageValue;

class ImageConfigration extends GetxController {
  var galleryImage = false.obs;
  var cammeraImage = false.obs;
  var isloading = false.obs;
  // var imageValues = [].obs;
  var isDeleted = false.obs;
  //Cammera image
  imageConfig() async {
    final profilePic = await SharedPreferences.getInstance();
    final profilePicValue = profilePic.getString(AppConfig.PROFILEPIC);
    final galleryPic = await SharedPreferences.getInstance();
    final galleryPicValue = galleryPic.getString(AppConfig.GALLERY);
    print('gallery value ${galleryPicValue}');
    isloading.value = true;
    if (profilePicValue == null) {
      cammeraImage.value = false;
      isloading.value = false;
    } else if (profilePicValue != null) {
      imageValue = profilePicValue;

      cammeraImage.value = true;
      galleryImage.value = false;
      isloading.value = false;
    }
    if (galleryPicValue == null) {
      galleryImage.value = false;
      isloading.value = false;
    } else if (galleryPicValue != null) {
      imageValue = galleryPicValue;

      galleryImage.value = true;
      cammeraImage.value = false;
      isloading.value = false;
    } else if (imageValue.value == null) {
      isDeleted.value = true;
    } else {
      isloading.value = false;
    }
  }

  setImage(imagePath) async {
    final profilePic = await SharedPreferences.getInstance();
    final galleryPic = await SharedPreferences.getInstance();
    final profilePicSetup =
        profilePic.setString(AppConfig.PROFILEPIC, imagePath) ?? "";
    final successDelete = await galleryPic.remove(AppConfig.GALLERY);

    imageConfig();
  }

  deleteImage() async {
    final profilePic = await SharedPreferences.getInstance();
    final galleryPic = await SharedPreferences.getInstance();
    final success = await profilePic.remove(AppConfig.PROFILEPIC);
    final successDelete = await galleryPic.remove(AppConfig.GALLERY);
    imageValue.clear;
  }

  setGalleryImage(String croppedFile) async {
    final profilePic = await SharedPreferences.getInstance();

    final galleryPic = await SharedPreferences.getInstance();
    final galleryPicSetup =
        galleryPic.setString(AppConfig.GALLERY, croppedFile) ?? "";
    final success = await profilePic.remove(AppConfig.PROFILEPIC);

    imageConfig();
  }

  Widget deleteButton() {
    return InkWell(
        onTap: () {
          isDeleted.value = !isDeleted.value;
        },
        child: Icon(
          Icons.delete,
          color: ColorConstant.red800,
        ));
  }
}
