
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingUtils {
  static bool isLoaderShowing = false;

  static void showLoader() {
    if (!isLoaderShowing) {
      Get.dialog(
        WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: Center(child: LoadingAnimationWidget.fourRotatingDots(color: Colors.black, size: 100)),
        ),
        barrierDismissible: false,
      );
      isLoaderShowing = true;
    }
  }

  static void hideLoader() {
    if (isLoaderShowing) {
      Get.back();
      isLoaderShowing = false;
    }
  }
}