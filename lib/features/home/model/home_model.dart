import 'package:madang_app/core/constant/other/assets.gen.dart';

class HomeModel {
  static List<Map<String, dynamic>> serviceList = [
    {
      'icon': Assets.icons.food.path,
      'title': 'Food',
    },
    {
      'icon': Assets.icons.table.path,
      'title': 'Table',
    },
    {
      'icon': Assets.icons.payment.path,
      'title': 'Payment',
    },
    {
      'icon': Assets.icons.more.path,
      'title': 'More',
    },
  ];

  static List<Map<String, dynamic>> restoRecommendations = [
    {
      'image': Assets.images.resto.path,
      'title': "Family Package",
      'space': '1 large table 6 chair',
      'price': 320000,
    },
    {
      'image': Assets.images.resto.path,
      'title': "20 Package",
      'space': '1 large table 6 chair',
      'price': 320000,
    },
    {
      'image': Assets.images.resto.path,
      'title': "30 Package",
      'space': '1 large table 6 chair',
      'price': 320000,
    },
    {
      'image': Assets.images.resto.path,
      'title': "40 Package",
      'space': '1 large table 6 chair',
      'price': 320000,
    }
  ];
}
