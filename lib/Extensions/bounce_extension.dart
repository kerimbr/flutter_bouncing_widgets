import 'package:flutter/material.dart';
import '../flutter_bouncing_widgets.dart';

extension BounceExtension on Widget {
  Widget bounce({
    required VoidCallback onPressed,
    double scaleFactor = 1,
    Duration duration = const Duration(milliseconds: 200),
    bool canReverse = false,
    bool isScrollable = false,
  }) {
    return CustomBounceWidget(
      onPressed: onPressed,
      scaleFactor: scaleFactor,
      duration: duration,
      canReverse: canReverse,
      isScrollable: isScrollable,
      child: this,
    );
  }
}
