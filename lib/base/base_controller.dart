import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  RxBool isLoading = false.obs;
  void showLoading() {
    isLoading.value = true;
  }

  void hideLoading() {
    isLoading.value = false;
  }
}
