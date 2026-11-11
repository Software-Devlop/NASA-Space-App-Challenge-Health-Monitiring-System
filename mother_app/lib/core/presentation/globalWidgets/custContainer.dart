import 'package:mother_app/core/statics/extensions.dart';
import 'package:flutter/material.dart';

class CustContainer extends StatelessWidget {
  final Widget? child;
  final Color? bgColor;
  final BoxConstraints? constrainedBox;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;
  final bool hasShadow;
  const CustContainer({
    super.key,
    required this.child,
    this.bgColor,
    this.constrainedBox,
    this.height,
    this.width,
    this.padding,
    this.margin,
    this.borderRadius,
    this.hasShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding ?? const EdgeInsets.all(20),
      margin: margin,
      constraints: constrainedBox,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(20),
        color: bgColor ?? context.colors.surface,
        boxShadow: hasShadow
            ? [
                BoxShadow(
                  color: context.theme.shadowColor,
                  offset: Offset(0, 0.5),
                  blurRadius: 2,
                  spreadRadius: 0,
                ),
              ]
            : null,
      ),
      child: child,
    );
  }
}
