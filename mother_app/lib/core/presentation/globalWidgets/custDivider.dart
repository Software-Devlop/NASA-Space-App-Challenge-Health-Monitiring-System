import 'package:mother_app/core/statics/extensions.dart';
import 'package:flutter/material.dart';

enum CustDividerAxis { horizontal, vertical }

class CustDivider extends StatelessWidget {
  final CustDividerAxis axis;
  final double thikness;
  final Color? color;
  final EdgeInsets? padding;
  const CustDivider({
    super.key,
    required this.axis,
    this.thikness = 0.5,
    this.color,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding ?? EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      width: axis == CustDividerAxis.horizontal ? double.infinity : thikness,
      height: axis == CustDividerAxis.vertical ? double.infinity : thikness,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color ?? context.colors.onSurface.withAlpha(50),
      ),
    );
  }
}
