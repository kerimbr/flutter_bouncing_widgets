import 'package:flutter/material.dart';

class CustomBounceWidget extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final double scaleFactor;
  final Duration duration;
  final bool canReverse;
  final bool isScrollable;

  const CustomBounceWidget({
    Key? key,
    required this.child,
    required this.onPressed,
    this.scaleFactor = 1,
    this.duration = const Duration(milliseconds: 200),
    this.canReverse = false,
    this.isScrollable = false,
  }) : super(key: key);

  @override
  State<CustomBounceWidget> createState() => _CustomBounceWidgetState();
}

class _CustomBounceWidgetState extends State<CustomBounceWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late double _scale;
  final GlobalKey _childKey = GlobalKey();
  bool _isOutside = false;

  Widget get child => widget.child;

  VoidCallback get onPressed => widget.onPressed;

  double get scaleFactor => widget.scaleFactor;

  Duration get duration => widget.duration;

  bool get _canReverse => widget.canReverse;

  bool get _isScrollable => widget.isScrollable;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: duration,
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(CustomBounceWidget oldWidget) {
    if (oldWidget.canReverse != _canReverse) {
      if (!_canReverse) {
        _reverseAnimation();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  _onTapUp(TapUpDetails details) {
    if (!_canReverse) {
      Future.delayed(duration, () {
        _reverseAnimation();
      });
    }

    onPressed();
  }

  _onLongPressEnd(LongPressEndDetails details, BuildContext context) {
    final Offset touchPosition = details.globalPosition;

    if (!_isOutsideChildBox(touchPosition)) {
      onPressed();
    }

    _reverseAnimation();
  }

  _onDragEnd(DragEndDetails details) {
    if (!_isOutside) {
      onPressed();
    }
    _reverseAnimation();
  }

  _reverseAnimation() {
    if (mounted) {
      _controller.reverse();
    }
  }

  bool _isOutsideChildBox(Offset touchPosition) {
    final RenderBox? childRenderBox =
        _childKey.currentContext?.findRenderObject() as RenderBox?;
    if (childRenderBox == null) {
      return true;
    }
    final Size childSize = childRenderBox.size;
    final Offset childPosition = childRenderBox.localToGlobal(Offset.zero);

    return (touchPosition.dx < childPosition.dx ||
        touchPosition.dx > childPosition.dx + childSize.width ||
        touchPosition.dy < childPosition.dy ||
        touchPosition.dy > childPosition.dy + childSize.height);
  }

  void _onTap() {
    _controller.forward();

    Future.delayed(duration, () {
      _controller.reverse();
      onPressed();
    });
  }

  _onDragUpdate(DragUpdateDetails details, BuildContext context) {
    final Offset touchPosition = details.globalPosition;
    _isOutside = _isOutsideChildBox(touchPosition);
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - (_controller.value * scaleFactor);

    if (_isScrollable) {
      return GestureDetector(
        onTap: _onTap,
        child: Transform.scale(
          key: _childKey,
          scale: _scale,
          child: child,
        ),
      );
    } else {
      return GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onLongPressEnd: (details) => _onLongPressEnd(details, context),
        onHorizontalDragEnd: _onDragEnd,
        onVerticalDragEnd: _onDragEnd,
        onHorizontalDragUpdate: (details) => _onDragUpdate(details, context),
        onVerticalDragUpdate: (details) => _onDragUpdate(details, context),
        child: Transform.scale(
          key: _childKey,
          scale: _scale,
          child: child,
        ),
      );
    }
  }
}
