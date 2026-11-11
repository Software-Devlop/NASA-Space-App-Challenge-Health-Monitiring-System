import 'package:mother_app/core/statics/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UIController {
  final AppPages currentPage;

  const UIController({this.currentPage = AppPages.home});

  UIController copyWith({AppPages? currentPage}) {
    return UIController(currentPage: currentPage ?? this.currentPage);
  }
}

class UIControllerManager extends Notifier<UIController> {
  @override
  UIController build() {
    // 5. Mandatory build method required by Riverpod Notifier
    return const UIController();
  }

  set currentPage(AppPages appPage) {
    state = state.copyWith(currentPage: appPage);
  }
}

// 6. Don't forget to expose your Notifier via a Provider:
final uiControllerProvider =
    NotifierProvider<UIControllerManager, UIController>(
      UIControllerManager.new,
    );
