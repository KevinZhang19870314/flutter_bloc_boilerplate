import 'package:flutter/material.dart';

import '../shared.dart';

class BorderButton extends StatelessWidget {
  final _GradientPainter _painter;
  final String _text;
  final Widget _child;
  final VoidCallback _callback;
  final double _radius;
  final Color backgroundColor;

  BorderButton({
    double strokeWidth = 1,
    double radius = 22,
    Gradient gradient,
    String text = "",
    Widget child,
    VoidCallback onPressed,
    this.backgroundColor = Colors.transparent,
  })  : this._painter = _GradientPainter(
          strokeWidth: strokeWidth,
          radius: radius,
          gradient: gradient ??
              LinearGradient(
                colors: [
                  ColorConstants.darkOrange,
                  ColorConstants.lightOrange,
                ],
              ),
        ),
        this._child = child,
        this._callback = onPressed,
        this._radius = radius,
        this._text = text;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _painter,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _callback,
        child: InkWell(
          borderRadius: BorderRadius.circular(_radius),
          onTap: _callback,
          child: Container(
            decoration: BoxDecoration(
                color: this.backgroundColor,
                borderRadius: BorderRadius.circular(this._radius)),
            constraints: BoxConstraints(minWidth: 88, minHeight: 64),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_text != "")
                  Text(
                    _text,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.darkOrange,
                    ),
                  )
                else
                  _child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GradientPainter extends CustomPainter {
  final Paint _paint = Paint();
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  _GradientPainter({
    double strokeWidth,
    double radius,
    Gradient gradient,
  })  : this.strokeWidth = strokeWidth,
        this.radius = radius,
        this.gradient = gradient;

  @override
  void paint(Canvas canvas, Size size) {
    // create outer rectangle equals size
    Rect outerRect = Offset.zero & size;
    var outerRRect =
        RRect.fromRectAndRadius(outerRect, Radius.circular(radius));

    // create inner rectangle smaller by strokeWidth
    Rect innerRect = Rect.fromLTWH(strokeWidth, strokeWidth,
        size.width - strokeWidth * 2, size.height - strokeWidth * 2);
    var innerRRect = RRect.fromRectAndRadius(
        innerRect, Radius.circular(radius - strokeWidth));

    // apply gradient shader
    _paint.shader = gradient.createShader(outerRect);

    // create difference between outer and inner paths and draw it
    Path path1 = Path()..addRRect(outerRRect);
    Path path2 = Path()..addRRect(innerRRect);
    var path = Path.combine(PathOperation.difference, path1, path2);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
