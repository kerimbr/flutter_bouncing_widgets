import 'package:flutter/material.dart';
import '../../flutter_bouncing_widgets.dart';

class BounceCircleAvatar extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget? child;
  final double radius;
  final double widthFactor;

  final ImageProvider? backgroundImage;

  final Color backgroundColor;

  final bool isScrollable;
  final double scaleFactor;
  final Duration duration;
  final bool canReverse;

  const BounceCircleAvatar({
    required this.onPressed,
    this.child,
    this.radius = BouncingWidgetSize.TINY,
    this.widthFactor = 1.3,
    this.isScrollable = false,
    this.backgroundColor = Colors.transparent,
    this.backgroundImage,
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
      child: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor,
        backgroundImage: backgroundImage,
        child: child,
      ),
    );
  }
}
