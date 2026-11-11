import 'package:flutter/material.dart';
import 'package:mother_app/core/statics/extensions.dart';

class CustElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final BorderRadius? borderRadius;
  final Color? bgColor;
  final Border? border;
  final EdgeInsets? padding;
  final double? width;
  final double? height;
  final bool isDisabled;
  final Color? interactionColor;
  final Color? disableColor;

  const CustElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.bgColor,
    this.border,
    this.padding,
    this.width,
    this.height,
    this.isDisabled = false,
    this.interactionColor,
    this.disableColor,
  });

  @override
  Widget build(BuildContext context) {
    final resolvedRadius = borderRadius ?? BorderRadius.circular(30);

    return Material(
      color: isDisabled
          ? disableColor ?? context.theme.disabledColor.withAlpha(130)
          : bgColor,
      borderRadius: resolvedRadius,
      child: Ink(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: resolvedRadius,
          color: isDisabled
              ? disableColor ?? context.theme.disabledColor.withAlpha(130)
              : bgColor ?? context.colors.primary,
          border: border,
        ),
        child: InkWell(
          focusColor:
              interactionColor?.withAlpha(25) ??
              context.colors.primary.withAlpha(25),
          hoverColor:
              interactionColor?.withAlpha(15) ??
              context.colors.primary.withAlpha(15),
          splashColor:
              interactionColor?.withAlpha(20) ??
              context.colors.primary.withAlpha(20),
          highlightColor:
              interactionColor?.withAlpha(15) ??
              context.colors.primary.withAlpha(15),
          onTap: isDisabled ? null : onPressed,
          borderRadius: resolvedRadius,
          child: Padding(
            padding:
                padding ??
                const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: child,
          ),
        ),
      ),
    );
  }
}
