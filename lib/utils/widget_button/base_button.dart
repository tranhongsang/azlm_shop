import 'package:azlm_shop/global/app_color.dart';
import 'package:flutter/material.dart';

class BaseButton extends StatefulWidget {
  const BaseButton(
      {Key? key,
      required this.title,
      this.textStyle,
      required this.onPress,
      this.bgColor,
      this.boderColor,
      this.radiusBoder = 10,
      this.height})
      : super(key: key);

  final String title;
  final TextStyle? textStyle;
  final Function onPress;
  final Color? bgColor;
  final Color? boderColor;
  final double? height;
  final double radiusBoder;

  @override
  State<BaseButton> createState() => _BaseButtonState();
}

class _BaseButtonState extends State<BaseButton> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: widget.height ?? 45),
      child: ElevatedButton(
        onPressed: () => widget.onPress(),
        child: Text(
          widget.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: widget.textStyle ??
              TextStyle(
                  color: AppColor.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
        ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: widget.bgColor ?? AppColor.bgButton,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.radiusBoder),
              side: BorderSide(color: widget.boderColor ?? AppColor.bgButton)),
        ),
      ),
    );
  }
}
