import 'package:azlm_shop/global/app_path.dart';
import 'package:azlm_shop/page/main/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class MainController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxInt tabIndex = 0.obs;
  // pageview
  late PageController pageViewController;
  List<Widget> listPageview =const <Widget>[
    HomePage(),
    Center(child: Text('ショッピング')),
    Center(child: Text('カフェ')),
    Center(child: Text('マイページ')),
    Center(child: Text('カート')),

  ];

  //
  List<TabItem> get tabItem => <TabItem>[
        TabItem(icon: AppPath.icHome, lable: 'ホーム', index: 0),
        TabItem(icon: AppPath.icBag, lable: 'ショッピング', index: 1),
        TabItem(icon: AppPath.icCup, lable: 'カフェ', index: 2),
        TabItem(icon: AppPath.icPerson, lable: 'マイページ', index: 3),
        TabItem(icon: AppPath.icCart, lable: 'カート', index: 4)
      ];

  @override
  void onInit() {
    super.onInit();

    //
    pageViewController = PageController(initialPage: tabIndex.value);

    //
    ever(tabIndex, (index) {
      pageViewController.jumpToPage(tabIndex.value);
    });
  }
}

class TabItem {
  TabItem({required this.icon, required this.lable, required this.index});

  final int index;
  final String icon;
  final String lable;
}
