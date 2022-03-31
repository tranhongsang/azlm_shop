import 'package:azlm_shop/global/app_color.dart';
import 'package:azlm_shop/page/main/home/model/cake_model.dart';
import 'package:flutter/material.dart';

class ItemCake extends StatefulWidget {
  const ItemCake({Key? key, required this.cake}) : super(key: key);

  final CakeModel cake;

  @override
  State<ItemCake> createState() => _ItemCakeState();
}

class _ItemCakeState extends State<ItemCake> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: AppColor.lineLight),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 166 / 110,
            child: FittedBox(fit: BoxFit.fill, child: _buildImange),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  widget.cake.nameShop,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: AppColor.black500,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 4),
                //
                Text(
                  widget.cake.nameCake,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: AppColor.black800,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 6),
                //
                Text(
                  widget.cake.current + ' ' + widget.cake.price,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: AppColor.black800,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // image
  Widget get _buildImange {
    // if (widget.cake.pathImage == null || widget.cake.pathImage!.isEmpty) {
    //   return Image.asset(widget.cake.pathImage!);
    // } else if (widget.cake.pathImage!.startsWith('wwww') ||
    //     widget.cake.pathImage!.startsWith('http')) {
    //   // online
    //   return Image.network(widget.cake.pathImage!);
    // } else if (widget.cake.pathImage!.endsWith('.svg')) {
    //   // online
    //   return Image.network(widget.cake.pathImage!);
    // } else {
    return Image.asset(widget.cake.pathImage!);
    // }
  }
}
