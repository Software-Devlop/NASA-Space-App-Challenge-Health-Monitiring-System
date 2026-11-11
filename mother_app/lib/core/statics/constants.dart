// App Pages
import 'package:mother_app/core/statics/structures/pageSpecifics.dart';

enum WeekDays { M, T, W, Th, F, Sa, S }

enum AppPages { home, tab2, tab3, tab4, account }

List<PageSpecifics> workingPages = [
  PageSpecifics(
    name: "Home",
    type: AppPages.home,
    iconPath: "assets/icons/house.svg",
  ),
  PageSpecifics(
    name: "tab2",
    type: AppPages.tab2,
    iconPath: "assets/icons/list.svg",
  ),
  PageSpecifics(
    name: "tab3",
    type: AppPages.tab3,
    iconPath: "assets/icons/chart.svg",
  ),
  PageSpecifics(
    name: "tab4",
    type: AppPages.tab4,
    iconPath: "assets/icons/bell.svg",
  ),
  PageSpecifics(
    name: "Account",
    type: AppPages.account,
    iconPath: "assets/icons/",
  ),
];
