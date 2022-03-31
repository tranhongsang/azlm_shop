import 'package:azlm_shop/base/base_controller.dart';
import 'package:azlm_shop/global/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseScreen<T extends BaseController> extends GetView<T> {
  const BaseScreen({Key? key}) : super(key: key);

  Widget builder();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        builder(),
        Obx(() => Visibility(
              visible: controller.isLoading.value,
              child: ColoredBox(
                color: Colors.black38,
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColor.black900,
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
