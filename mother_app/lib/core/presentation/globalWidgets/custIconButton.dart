import 'dart:ui';
import 'package:mother_app/core/statics/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustIconButton extends StatelessWidget {
  final String? svgIcon;
  final IconData? icon;
  final Widget? child;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? bgColor;
  final double? iconSize;
  final EdgeInsets? padding;
  final double? size;

  const CustIconButton({
    super.key,
    this.svgIcon,
    this.icon,
    this.child,
    this.onPressed,
    this.color,
    this.bgColor,
    this.iconSize,
    this.padding,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasContent =
        (svgIcon != null && svgIcon!.isNotEmpty) ||
        icon != null ||
        child != null;

    if (!hasContent && size == null) {
      return const SizedBox.shrink();
    }

    final Color effectiveIconColor = color ?? Colors.white.withValues(alpha: 1);

    // Build inner icon / content
    Widget? content;

    if (svgIcon != null && svgIcon!.isNotEmpty) {
      content = SvgPicture.asset(
        svgIcon!,
        width: iconSize,
        height: iconSize,
        colorFilter: ColorFilter.mode(effectiveIconColor, BlendMode.srcIn),
      );
    } else if (icon != null) {
      content = Icon(icon, size: iconSize, color: effectiveIconColor);
    } else {
      content = child;
    }

    return SizedBox(
      width: size,
      height: size,
      child: ClipOval(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Material(
            color:
                bgColor ??
                context.colors.onInverseSurface.withValues(alpha: 0.30),
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              customBorder: const CircleBorder(),
              focusColor: context.colors.onInverseSurface.withValues(
                alpha: 0.05,
              ),
              hoverColor: context.colors.onInverseSurface.withValues(
                alpha: 0.05,
              ),
              splashColor: context.colors.onInverseSurface.withValues(
                alpha: 0.15,
              ),
              highlightColor: context.colors.onInverseSurface.withValues(
                alpha: 0.10,
              ),
              onTap: onPressed,
              child: Padding(
                padding: padding ?? const EdgeInsets.all(8.0),
                child: Center(child: content),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
