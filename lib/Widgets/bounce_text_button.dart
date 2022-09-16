import 'package:flutter/material.dart';
import '../flutter_bouncing_widgets.dart';

class BounceTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget? child;
  final double size;
  final double widthFactor;


  final bool isScrollable;
  final double scaleFactor;
  final Duration duration;
  final bool canReverse;

  const BounceTextButton({
    required this.onPressed,
    this.child,
    this.size = BouncingWidgetSize.MEDIUM,
    this.widthFactor = 1.3,
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
        color: Colors.transparent,
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
