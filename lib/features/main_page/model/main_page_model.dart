import 'package:madang_app/core/constant/other/assets.gen.dart';

class MainPageModel {
  static List<Map<String, dynamic>> bottomNavbarList = [
    {
      'icon': Assets.icons.home.path,
      'label': 'Home',
      'index': 0,
    },
    {
      'icon': Assets.icons.search.path,
      'label': 'Search',
      'index': 1,
    },
    {
      'icon': Assets.icons.refreshCircle.path,
      'label': 'Recent',
      'index': 2,
    },
    {
      'icon': Assets.icons.person.path,
      'label': 'Profile',
      'index': 3,
    },
  ];
}
