import 'package:flutter/material.dart';
import '../../flutter_bouncing_widgets.dart';
import 'Constants/bouncing_widget_color.dart';

class BounceCard extends StatelessWidget {
  final VoidCallback onPressed;

  final Widget? child;

  final Color color;
  final Color? shadowColor;
  final double? elevation;
  final Color? surfaceTintColor;
  final ShapeBorder? shape;
  final Clip? clipBehavior;
  final bool borderOnForeground;
  final bool semanticContainer;
  final EdgeInsetsGeometry? margin;

  final bool isScrollable;
  final double scaleFactor;
  final Duration duration;
  final bool canReverse;

  const BounceCard({
    required this.onPressed,
    this.child,
    this.color = BouncingWidgetColor.LIGHT,
    this.shadowColor,
    this.elevation,
    this.surfaceTintColor,
    this.shape,
    this.clipBehavior,
    this.borderOnForeground = true,
    this.semanticContainer = true,
    this.margin,
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
      child: Card(
        color: color,
        shadowColor: shadowColor,
        elevation: elevation,
        surfaceTintColor: surfaceTintColor,
        shape: shape,
        borderOnForeground: borderOnForeground,
        margin: margin,
        clipBehavior: clipBehavior,
        semanticContainer: semanticContainer,
        child: child,
      ),
    );
  }
}
