import 'dart:ui';

import 'package:flutter/material.dart';

import '../../shared.dart';

class FocusedMenuDetails extends StatelessWidget {
  final Offset childOffset;
  final Size childSize;
  final Widget menuContent;
  final Widget child;

  const FocusedMenuDetails({
    Key key,
    @required this.menuContent,
    @required this.childOffset,
    @required this.childSize,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sw = SizeConfig().screenWidth;
    final sh = SizeConfig().screenHeight;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ),
            Positioned(
              bottom: 20.0,
              left: 15.0,
              child: TweenAnimationBuilder(
                duration: Duration(milliseconds: 200),
                builder: (BuildContext context, value, Widget child) {
                  return Transform.scale(
                    scale: value,
                    alignment: Alignment.center,
                    child: child,
                  );
                },
                tween: Tween(begin: 0.0, end: 1.0),
                child: Container(
                  width: sw - 30.0,
                  height: sh * .2,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      boxShadow: [
                        const BoxShadow(
                            color: Colors.black38,
                            blurRadius: 10,
                            spreadRadius: 1)
                      ]),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: menuContent,
                  ),
                ),
              ),
            ),
            Positioned(
              top: childOffset.dy,
              left: childOffset.dx,
              child: AbsorbPointer(
                absorbing: true,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  width: childSize.width,
                  height: childSize.height,
                  child: child,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
