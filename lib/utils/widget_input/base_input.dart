import 'package:azlm_shop/global/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BuildInputText extends StatefulWidget {
  const BuildInputText({
    Key? key,
    this.iconLeading,
    this.widgetLeading,
    required this.hintText,
    required this.controller,
    this.currentNode,
    this.submitFunc,
    this.obscureText = false,
    this.iconNextTextInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.sentences,
    this.textInputType = TextInputType.text,
    this.inputFormatters,
    this.onChanged,
    this.maxLengthInputForm = 100,
    this.isReadOnly = false,
    this.maxLines = 1,
    this.fontSize = 16,
    this.suffixIcon,
    this.fillColor,
    this.labelText,
    this.height,
    this.contentPadding,
  }) : super(key: key);

  /// [fillColor] Màu nền
  final Color? fillColor;

  final IconData? iconLeading;

  final Widget? widgetLeading;

  final String hintText;

  final String? labelText;

  final TextEditingController controller;

  final FocusNode? currentNode;

  /// [obscureText] cho phép ẩn Text trong trường hợp Password, Mặc định `false` show text
  final bool obscureText;

  /// [isReadOnly] chỉ đọc
  final bool isReadOnly;

  final Function? submitFunc;

  /// [iconNextTextInputAction] mặc định là `next`, là icon/text tại vị trí nút enter trên bàn phím.
  ///  `done` , `go` ,`search` , `send`, `next`, `newline` thường hay dùng
  final TextInputAction iconNextTextInputAction;

  /// [inputFormatters] giúp format text đc nhập vào, ví dụ: '1,000,000'
  final List<TextInputFormatter>? inputFormatters;

  /// [textCapitalization] mặc định `sentences` là kiểu chữ khi Bàn hiển thị.
  /// `sentences`: Viết hoa chữ cái đâù dòng,  vd: 'Xin chào'
  /// `words`: Viết hoa đầu các chữ, vd: 'Xin Chào'
  /// `characters`: Viết hoa toàn bộ, vd: 'XIN CHÀO"
  /// `none`: Viết thường toàn bộ
  final TextCapitalization textCapitalization;

  /// [textInputType] mặc định `text`, là Bàn phím sẽ hiển thị các kí tự giúp nhập SMART hơn cho các trường hợp.
  /// `datetime`, `number`, `phone`: Bàn phím số
  /// `emailAddress`: Bàn phím có kí tự '@' '.com'
  /// `url`: Bàn phím có kí tự '/' 'www.'
  /// Còn lại đề là bàn phím bình thường
  final TextInputType textInputType;

  /// [maxLengthInputForm] số kí tự có thể nhập,  mặc định `100`
  final int maxLengthInputForm;

  final Function(String)? onChanged;

  final Widget? suffixIcon;

  final int maxLines;

  final double fontSize;

  final double? height;

  final EdgeInsetsGeometry? contentPadding;
  @override
  _BuildInputTextState createState() => _BuildInputTextState();
}

class _BuildInputTextState extends State<BuildInputText> {
  final RxBool _isShowButtonClear = false.obs;
  final RxBool _isShowText = false.obs;

  @override
  void initState() {
    super.initState();
    _isShowText.value = widget.obscureText;
    widget.controller.addListener(() {
      if (widget.controller.text.isNotEmpty) {
        _isShowButtonClear.value = true;
      }
      setState(() {});
    });
  }

  @override
  void setState(Function() fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: widget.height ?? 45),
      child: TextFormField(
        textCapitalization: widget.textCapitalization,
        maxLines: widget.maxLines,
        maxLength: widget.maxLengthInputForm,
        inputFormatters: widget.inputFormatters,
        style: TextStyle(
            fontSize: widget.fontSize,
            color: AppColor.primary,
            fontWeight: FontWeight.w400),
        onChanged: (String v) {
          if (!_isShowButtonClear.value || v.isEmpty) {
            _isShowButtonClear.value = v.isNotEmpty;
          }
          widget.onChanged?.call(v);
        },
        textInputAction: widget.iconNextTextInputAction,
        controller: widget.controller,
        obscureText: _isShowText.value,
        focusNode: widget.currentNode,
        keyboardType: widget.textInputType,
        onFieldSubmitted: (String v) {
          if (widget.submitFunc != null) {
            widget.submitFunc!();
          }
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          // label
          labelText: widget.labelText,
          labelStyle: TextStyle(
              fontSize: 16,
              color: AppColor.primary,
              fontWeight: FontWeight.w500),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          // hintText
          hintStyle: TextStyle(
              fontSize: widget.fontSize,
              color: AppColor.secondary,
              fontWeight: FontWeight.w400),
          hintText: widget.hintText,
          // bg color
          fillColor: widget.fillColor ?? AppColor.white,
          filled: true,
          // contentPadding
          isDense: true,
          contentPadding: widget.contentPadding ?? const EdgeInsets.all(16),
          // prefix
          prefixIcon: _buildPrefixIcon,
          prefixIconConstraints:
              const BoxConstraints(maxWidth: 40, maxHeight: 40),
          // suffix
          suffixIcon: _buildSuffixIcon,
          suffixIconConstraints:
              const BoxConstraints(maxWidth: 40, maxHeight: 40),
          // hide counter
          counterStyle: const TextStyle(height: double.minPositive),
          counterText: '',
          // border
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.secondary)),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.red),
          ),
          focusedErrorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: AppColor.red)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.primary)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.secondary)),
        ),
      ),
    );
  }

  Widget? get _buildPrefixIcon {
    return widget.widgetLeading == null && widget.iconLeading == null
        ? null
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: widget.iconLeading != null
                ? Icon(
                    widget.iconLeading,
                    color: Colors.grey,
                  )
                : widget.widgetLeading,
          );
  }

  Widget? get _buildSuffixIcon {
    if (widget.suffixIcon != null) {
      return widget.suffixIcon;
    }
    if (!_isShowButtonClear.value || widget.isReadOnly) {
      return null;
    }
    if (widget.obscureText) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _isShowText.toggle();
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Icon(
            _isShowText.value ? Icons.remove_red_eye : Icons.visibility_off,
            color: Colors.grey,
            size: 20,
          ),
        ),
      );
    } else {
      return Visibility(
        visible: _isShowButtonClear.value && !widget.isReadOnly,
        child: GestureDetector(
          onTap: () {
            widget.controller.clear();
            _isShowButtonClear.value = false;
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Icon(
              Icons.cancel,
              color: Colors.grey,
              size: 16,
            ),
          ),
        ),
      );
    }
  }
}
