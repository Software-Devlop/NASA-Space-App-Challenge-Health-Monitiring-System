import 'package:mother_app/core/presentation/globalWidgets/custElevatedButton.dart';
import 'package:mother_app/core/statics/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageTabWidget extends StatelessWidget {
  final String tabLabel;
  final VoidCallback onPressed;
  final bool isSelected;
  final String? iconPath;
  final Widget? icon;
  final bool isShrinked;

  const PageTabWidget({
    super.key,
    required this.tabLabel,
    required this.onPressed,
    this.isSelected = false,
    this.iconPath,
    required this.isShrinked,
    this.icon,
  });

  static const Duration _duration = Duration(milliseconds: 200);
  static const double _customIconSize = 40;

  bool get _hasSvg =>
      iconPath != null && iconPath!.isNotEmpty && !iconPath!.endsWith('/');

  bool get _hasCustomIcon => !_hasSvg && icon != null;

  bool get _hasIcon => _hasSvg || _hasCustomIcon;

  @override
  Widget build(BuildContext context) {
    final Color contentColor = isSelected
        ? context.colors.primary
        : context.colors.onPrimary.withAlpha(165);

    return CustElevatedButton(
      width: double.infinity,
      // SVG tabs: (40 - 19) / 2 = 10.5 keeps the icon centered when closed.
      // Custom icon: it is already 40 wide, which is the whole closed width,
      // so no padding is needed.
      padding: _hasCustomIcon
          ? EdgeInsets.zero
          : const EdgeInsets.symmetric(horizontal: 10.5, vertical: 10),
      onPressed: onPressed,
      borderRadius: BorderRadius.circular(10),
      bgColor: isSelected ? context.colors.onPrimary : Colors.transparent,
      interactionColor: context.colors.onPrimary,
      child: Row(
        children: [
          if (_hasSvg)
            SvgPicture.asset(
              iconPath!,
              width: 19,
              colorFilter: ColorFilter.mode(contentColor, BlendMode.srcIn),
            )
          else if (_hasCustomIcon)
            SizedBox(
              width: _customIconSize,
              height: _customIconSize,
              child: Center(child: icon!),
            ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                child: AnimatedOpacity(
                  opacity: isShrinked ? 0 : 1,
                  duration: _duration,
                  curve: isShrinked ? Curves.easeOut : Curves.easeIn,
                  child: Padding(
                    padding: EdgeInsets.only(left: _hasIcon ? 12 : 0),
                    child: Text(
                      tabLabel,
                      maxLines: 1,
                      softWrap: false,
                      style: context.text.labelLarge!.copyWith(
                        fontWeight: isSelected
                            ? FontWeight.w500
                            : FontWeight.w300,
                        color: contentColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
