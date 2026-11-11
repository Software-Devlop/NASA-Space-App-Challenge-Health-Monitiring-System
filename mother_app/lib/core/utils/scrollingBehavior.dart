import 'package:flutter/material.dart';

class ExcludeFromParentScroll extends StatelessWidget {
  final Widget child;

  const ExcludeFromParentScroll({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onVerticalDragStart: (_) {},
      onVerticalDragUpdate: (_) {},
      onVerticalDragEnd: (_) {},
      child: child,
    );
  }
}
