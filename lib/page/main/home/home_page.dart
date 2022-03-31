import 'package:azlm_shop/global/app_color.dart';
import 'package:azlm_shop/global/app_path.dart';
import 'package:azlm_shop/page/main/home/home_controller.dart';
import 'package:azlm_shop/page/main/home/widget/item_cake.dart';
import 'package:azlm_shop/utils/pop_up/pop_up_menu.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomeController get controller => Get.put<HomeController>(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildDivider,
          _buildTabFilter,
          Expanded(
            child: SmartRefresher(
              controller: controller.refreshController,
              onRefresh: () => controller.onRefresh(),
              child: ListView(
                children: [
                  _buildSlider,
                  _buildList,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  //
  Divider get _buildDivider => Divider(color: AppColor.lineDark, height: 1);

  // appbar
  AppBar get _buildAppBar => AppBar(
        title: Image.asset(
          AppPath.imageAZLM,
          height: 40,
        ).paddingOnly(left: 12),
        centerTitle: false,
        actions: [
          Obx(
            () => PopupMenu(
              right: 10,
              childPopup: _buildListFilter,
              child: Container(
                color: Colors.transparent,
                alignment: Alignment.centerRight,
                child: Row(children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: Get.width * 0.5),
                    child: Text(
                      controller.currentFilter.value.isEmpty
                          ? '仙台空港店'
                          : controller.currentFilter.value,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: AppColor.black500,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(width: 4),
                  SvgPicture.asset(AppPath.icDown,
                      color: AppColor.black500, height: 8, width: 8)
                ]).paddingOnly(right: 12),
              ),
            ),
          ),
        ],
      );

  // tab category
  Widget get _buildTabFilter => TabBar(
        tabs: controller.listCategory,
        // isScrollable: true,
        // physics: const ClampingScrollPhysics(),
        controller: controller.tabController,
        labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        indicator: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 2.0, color: AppColor.black800)),
            shape: BoxShape.rectangle),
        labelPadding: const EdgeInsets.symmetric(vertical: 8),
        unselectedLabelColor: AppColor.black500,
        labelColor: AppColor.black800,
        onTap: (int index) {
          controller.category.value = index;
        },
      );

  // slider
  Widget get _buildSlider => Column(
        children: [
          AspectRatio(
            aspectRatio: 375 / 250,
            child: CarouselSlider(
              options: CarouselOptions(
                  viewportFraction: 1,
                  aspectRatio: 375 / 250,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  onPageChanged: (index, _) {
                    controller.indexDot.value = index;
                  }),
              items: controller.imgList
                  .map((item) => Image.network(
                        item,
                        loadingBuilder: (_, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                              child: Text('Loading ...',
                                  style: TextStyle(
                                      color: AppColor.black800,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)));
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            const SizedBox(),
                      ))
                  .toList(),
            ),
          ),
          Obx(
            () => Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Spacer(),
              ...List<Widget>.generate(
                controller.imgList.length,
                (int index) => Container(
                  width: 6,
                  height: 6,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == controller.indexDot.value
                          ? AppColor.black800
                          : AppColor.black300),
                ),
              ),
              const SizedBox(width: 12)
            ]),
          ),
        ],
      );

  // list data
  Widget get _buildList => Obx(
        () => MasonryGridView.count(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          itemCount: controller.listDataCake.length + 10,
          itemBuilder: (_, index) => ItemCake(
            cake: controller.listDataCake[0],
          ),
        ),
      );

  // filter
  Widget _buildListFilter(onDismiss) => Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: AppColor.white,
          border: Border.all(width: 2.0, color: AppColor.lineLight),
          borderRadius: BorderRadius.circular(8),
        ),
        width: Get.width * 0.6,
        height: 300,
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      '絞り込み',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: AppColor.black800,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                CloseButton(
                  onPressed: () => onDismiss(),
                )
              ],
            ),
            _buildDivider,
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  ...controller.listFilter
                      .map(
                        (String filter) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              controller.currentFilter.value = filter;
                              onDismiss();
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      filter,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: AppColor.black800,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    )),
                                    SvgPicture.asset(AppPath.icNext,
                                        color: AppColor.black800,
                                        height: 8,
                                        width: 8)
                                  ],
                                ),
                                const SizedBox(height: 8),
                                _buildDivider
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
          ],
        ),
      );
}
