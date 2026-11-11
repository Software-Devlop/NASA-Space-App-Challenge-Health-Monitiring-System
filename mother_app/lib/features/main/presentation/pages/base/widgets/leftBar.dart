import 'package:mother_app/core/statics/constants.dart';
import 'package:mother_app/core/statics/extensions.dart';
import 'package:mother_app/features/main/presentation/controllers/UIController.dart';
import 'package:mother_app/features/main/presentation/pages/base/widgets/pageTab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LeftBar extends ConsumerStatefulWidget {
  final AppPages currentPage;
  const LeftBar({super.key, required this.currentPage});

  @override
  ConsumerState<LeftBar> createState() => _LeftBarState();
}

class _LeftBarState extends ConsumerState<LeftBar> {
  static const double _openWidth = 223;
  static const double _closedWidth = 75;
  static const Duration _duration = Duration(milliseconds: 250);
  static const Curve _curve = Curves.easeInOutCubic;

  bool isClosed = false;

  void _toggle() => setState(() => isClosed = !isClosed);

  Widget _buildHeader(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Stack(
        children: [
          // Small icon (visible when closed)
          Align(
            alignment: Alignment.centerLeft,
            child: IgnorePointer(
              ignoring: !isClosed,
              child: AnimatedOpacity(
                opacity: isClosed ? 1 : 0,
                duration: _duration,
                curve: _curve,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: _toggle,
                  child: SizedBox(
                    width: 40,
                    height: 70,
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/icons/left_bar_icon.svg",
                        clipBehavior: Clip.antiAlias,
                        height: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Full logo + close button (visible when open)
          Positioned.fill(
            child: IgnorePointer(
              ignoring: isClosed,
              child: AnimatedOpacity(
                opacity: isClosed ? 0 : 1,
                duration: _duration,
                curve: _curve,
                child: ClipRect(
                  child: OverflowBox(
                    alignment: Alignment.centerLeft,
                    minWidth: 0,
                    maxWidth: _openWidth - 35,
                    child: SizedBox(
                      width: _openWidth - 35,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Image.asset(
                              "assets/icons/left_bar_icon.png",
                              height: 30,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.close_rounded,
                              color: context.colors.onPrimary.withAlpha(190),
                            ),
                            iconSize: 20,
                            color: context.colors.onPrimary,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              padding: const EdgeInsets.all(5),
                            ),
                            onPressed: _toggle,
                          ),
                        ],
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

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: _duration,
      curve: _curve,
      width: isClosed ? _closedWidth : _openWidth,
      height: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(color: context.colors.primary),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 20, 15),
                child: Column(
                  children: [
                    // Logo & Name
                    _buildHeader(context),

                    // Pages Tabs
                    Expanded(
                      child: Column(
                        spacing: 5,
                        children: [
                          ...workingPages
                              .where((e) => e.type != AppPages.account)
                              .map((page) {
                                return PageTabWidget(
                                  tabLabel: page.name,
                                  isSelected: page.type == widget.currentPage,
                                  iconPath: page.iconPath,
                                  isShrinked: isClosed,
                                  onPressed: () {
                                    ref
                                            .read(uiControllerProvider.notifier)
                                            .currentPage =
                                        page.type;
                                  },
                                );
                              }),
                        ],
                      ),
                    ),

                    PageTabWidget(
                      tabLabel: workingPages.last.name,
                      icon: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: context.colors.secondary,
                        ),
                        child: Center(
                          child: Text(
                            "UN",
                            style: context.text.labelMedium!.copyWith(
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                      isShrinked: isClosed,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
