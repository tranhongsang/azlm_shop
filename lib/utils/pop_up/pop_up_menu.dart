import 'package:flutter/material.dart';

typedef RenderChildPopup = Widget Function(Function);

class PopupMenu extends StatefulWidget {
  const PopupMenu({
    Key? key,
    required this.childPopup,
    required this.child,
    this.height,
    this.width,
    this.right,
    this.left,
    this.useWidthParent = false,
    this.padingTop = 1.2,
    this.onState,
  }) : super(key: key);

  final RenderChildPopup childPopup;
  final Widget child;
  final double? height;
  final double? width;
  final double? right;
  final double? left;
  final bool useWidthParent;
  final double padingTop;
  final Function(bool)? onState;

  @override
  _PopupMenuState createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  late GlobalKey actionKey;
  late double heightBox;
  late double widthBox;
  late double xPosition;
  late double yPosition;

  late OverlayEntry floatingDropdown;

  bool isDropdownOpened = false;

  @override
  void initState() {
    actionKey = LabeledGlobalKey('PopupMenu');
    super.initState();
  }

  void _findDropdownData() {
    final RenderBox renderBox =
        actionKey.currentContext!.findRenderObject()! as RenderBox;

    heightBox = renderBox.size.height;
    widthBox = renderBox.size.width;

    final Offset offset = renderBox.localToGlobal(Offset.zero);
    xPosition = offset.dx;
    // yPosition = offset.dy;

    floatingDropdown = _createFloatingDropdown();
    Overlay.of(context)!.insert(floatingDropdown);
  }

  OverlayEntry _createFloatingDropdown() {
    return OverlayEntry(
      builder: (_) {
        return LayoutBuilder(
          builder: (_, __) {
            return GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: _onGesture,
              child: Material(
                color: Colors.transparent,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      right: widget.right,
                      left: widget.left,
                      width: widget.useWidthParent ? widthBox : widget.width,
                      top: heightBox * widget.padingTop,
                      height: widget.height,
                      child: widget.childPopup(_onGesture),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _onGesture() {
    setState(() {
      if (isDropdownOpened) {
        floatingDropdown.remove();
      } else {
        _findDropdownData();
      }

      isDropdownOpened = !isDropdownOpened;

      if (widget.onState != null) {
        widget.onState!(isDropdownOpened);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: actionKey,
      onTap: _onGesture,
      child: widget.child,
    );
  }
}
