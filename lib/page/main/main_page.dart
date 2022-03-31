import 'package:azlm_shop/global/app_color.dart';
import 'package:azlm_shop/page/main/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  MainController get controller =>
      Get.put<MainController>(MainController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildBody),
      bottomNavigationBar: _buildBottomBar,
    );
  }

  //
  Widget get _buildBody => PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageViewController,
        children: controller.listPageview,
      );

  //
  Widget get _buildBottomBar => Obx(() => BottomNavigationBar(
      currentIndex: controller.tabIndex.value,
      selectedItemColor: AppColor.black800,
      unselectedItemColor: AppColor.black400,
      backgroundColor: AppColor.white,
      selectedLabelStyle:
          const TextStyle(fontSize: 10.0, fontWeight: FontWeight.w600),
      unselectedLabelStyle:
          const TextStyle(fontSize: 10.0, fontWeight: FontWeight.w400),
      type: BottomNavigationBarType.fixed,
      onTap: (int selectedIndex) {
        controller.tabIndex.value = selectedIndex;
      },
      items: controller.tabItem
          .map<BottomNavigationBarItem>((TabItem e) => BottomNavigationBarItem(
              icon: SvgPicture.asset(e.icon,
                  color: controller.tabIndex.value == e.index
                      ? AppColor.black800
                      : AppColor.black400,
                  height: 16,
                  width: 16),
              label: e.lable))
          .toList()));
}
