import 'package:azlm_shop/global/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController textAccController = TextEditingController();
  TextEditingController textPassController = TextEditingController();
  FocusNode focusNodeAcc = FocusNode();
  FocusNode focusNodePass = FocusNode();

  void login() {
    Get.offAndToNamed(AppRouter.routerMain);
  }

  void onForgetPassword() {}
  
  void onRegister() {}
}
