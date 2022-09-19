import 'package:flutter/material.dart';
import '../flutter_bouncing_widgets.dart';
import 'Constants/bouncing_widget_color.dart';

class BounceElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget? child;
  final double size;
  final double widthFactor;

  final Color color;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  final Gradient? gradient;
  final BoxShape? shape;
  final List<BoxShadow>? boxShadow;

  final bool isScrollable;
  final double scaleFactor;
  final Duration duration;
  final bool canReverse;

  const BounceElevatedButton({
    required this.onPressed,
    this.child,
    this.size = BouncingWidgetSize.MEDIUM,
    this.widthFactor = 1.3,
    this.color = BouncingWidgetColor.PRIMARY,
    this.borderRadius,
    this.border,
    this.gradient,
    this.shape,
    this.boxShadow,
    this.isScrollable = false,
    this.scaleFactor = 1,
    this.duration = const Duration(milliseconds: 200),
    this.canReverse = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBounceWidget(
      onPressed: onPressed,
      isScrollable: isScrollable,
      child: Container(
        height: size,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius ?? BorderRadius.circular(4),
          boxShadow: boxShadow ??
              [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                ),
              ],
        ),
        child: child != null
            ? Center(
                widthFactor: widthFactor,
                child: child,
              )
            : null,
      ),
    );
  }
}
