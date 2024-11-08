import 'package:madang_app/core/constant/other/assets.gen.dart';

class ProfileModel {
  static final List<Map<String, dynamic>> account = [
    {
      'icon': Assets.icons.payment.path,
      'label': 'Payment Method',
    },
    {
      'icon': Assets.icons.cart.path,
      'label': 'My Cart',
    },
    {
      'icon': Assets.icons.helpCircle.path,
      'label': 'Help & Report',
    },
    {
      'icon': Assets.icons.language.path,
      'label': 'Language',
    },
    {
      'icon': Assets.icons.notification.path,
      'label': 'Notification',
    },
  ];
  static final List<Map<String, dynamic>> moreInfo = [
    {
      'icon': Assets.icons.shield.path,
      'label': 'Privacy Policy',
    },
    {
      'icon': Assets.icons.newspaper.path,
      'label': 'News & Services',
    },
    {
      'icon': Assets.icons.star.path,
      'label': 'Give Rating',
    },
  ];
}
