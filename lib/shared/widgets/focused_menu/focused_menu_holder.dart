import 'package:flutter/material.dart';

import 'focused_menu_details.dart';

class FocusedMenuHolder extends StatefulWidget {
  final Widget child, menuContent;

  const FocusedMenuHolder({
    Key key,
    @required this.child,
    @required this.menuContent,
  });

  @override
  _FocusedMenuHolderState createState() => _FocusedMenuHolderState();
}

class _FocusedMenuHolderState extends State<FocusedMenuHolder> {
  GlobalKey containerKey = GlobalKey();
  Offset childOffset = Offset(0, 0);
  Size childSize;

  getOffset() {
    RenderBox renderBox = containerKey.currentContext.findRenderObject();
    Size size = renderBox.size;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    setState(() {
      this.childOffset = Offset(offset.dx, offset.dy);
      childSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: containerKey,
      onTap: () async {
        getOffset();
        await Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 100),
            pageBuilder: (context, animation, secondaryAnimation) {
              animation = Tween(begin: 0.0, end: 1.0).animate(animation);
              return FadeTransition(
                opacity: animation,
                child: FocusedMenuDetails(
                  menuContent: widget.menuContent,
                  child: widget.child,
                  childOffset: childOffset,
                  childSize: childSize,
                ),
              );
            },
            fullscreenDialog: true,
            opaque: false,
          ),
        );
      },
      child: widget.child,
    );
  }
}
