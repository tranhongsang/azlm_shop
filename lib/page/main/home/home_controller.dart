import 'package:azlm_shop/global/app_path.dart';
import 'package:azlm_shop/page/main/home/model/cake_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart' show RefreshController;

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  // tab
  RxInt category = 0.obs;
  late TabController tabController;
  List<Tab> listCategory = const <Tab>[
    Tab(text: '全て'),
    Tab(text: 'お土産'),
    Tab(text: '食品・飲料'),
    Tab(text: '酒類'),
    Tab(text: 'その他')
  ];

  // filter
  RxString currentFilter = ''.obs;
  List<String> listFilter = [
    'お土産',
    '食品・飲料',
    '日用品',
    'ヘルスケア',
    'ファッション',
    'カテゴリが入ります',
    'カテゴリが入ります',
    'カテゴリが入ります',
    'カテゴリが入ります',
  ];

  // slider
  RxInt indexDot = 0.obs;
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  // List Data
  RxList<CakeModel> listDataCake = <CakeModel>[
    CakeModel(
        pathImage: AppPath.imageCake,
        nameShop: 'WASARA',
        nameCake: 'ディクラッセ DI-CLASS E Foresti 照明 ラ…',
        price: '1.02'),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(
      initialIndex: 0,
      length: listCategory.length,
      vsync: this,
    );

    // category
    ever(category, (index) {
      if (category.value == 0) {
        listDataCake.value = <CakeModel>[
          CakeModel(
              pathImage: AppPath.imageCake,
              nameShop: 'WASARA',
              nameCake: 'ディクラッセ DI-CLASS E Foresti 照明 ラ…',
              price: '1.02'),
        ];
      } else {
        listDataCake.value = <CakeModel>[
          CakeModel(
              pathImage: AppPath.imageChair,
              nameShop: 'WASARA',
              nameCake: 'ディクラッセ DI-CLASS E Foresti 照明 ラ…',
              price: '3.600'),
        ];
      }
    });
  }

  Future<void> onRefresh() async {
    await 3.seconds.delay();
    refreshController.refreshCompleted();
  }
}
