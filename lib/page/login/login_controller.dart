import 'package:azlm_shop/base/base_controller.dart';
import 'package:azlm_shop/global/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends BaseController {
  TextEditingController textAccController = TextEditingController();
  TextEditingController textPassController = TextEditingController();
  FocusNode focusNodeAcc = FocusNode();
  FocusNode focusNodePass = FocusNode();

  Future<void> login() async {
    showLoading();
    await 2.seconds.delay();
    hideLoading();
    Get.offAndToNamed(AppRouter.routerMain);
  }

  void onForgetPassword() {}

  void onRegister() {}
}
