import 'package:madang_app/features/auth/view/sign_up_page.dart';
import 'package:madang_app/features/main_page/view/main_page.dart';
import 'package:madang_app/features/menu/view/menu_page.dart';
import 'package:madang_app/features/splash_intro/view/intro_page.dart';

import '../../../features/auth/view/login_page.dart';
import '../../../features/splash_intro/view/splash_page.dart';
import '../../constant/constant.dart';
import '../../core.dart';
import '../common.dart';

class RoutesHandler {
  final String initialRoutes = RoutesName.initial;
  static const initialNavbarVisibility = true;

  static MaterialPageRoute get _emptyPage {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          body: Center(
            child: Text(
              'Not Found',
              style: AppText.text24.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashPage(),
          settings: settings,
        );
      case RoutesName.intro:
        return MaterialPageRoute(
          builder: (context) => const IntroPage(),
          settings: settings,
        );
      case RoutesName.signUp:
        return MaterialPageRoute(
          builder: (context) => const SignUpPage(),
          settings: settings,
        );
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
          settings: settings,
        );
      case RoutesName.mainPage:
        return MaterialPageRoute(
          builder: (context) => const MainPage(),
          settings: settings,
        );
      case RoutesName.menu:
        return MaterialPageRoute(
          builder: (context) => const MenuPage(),
          settings: settings,
        );

      default:
        return _emptyPage;
    }
  }
}
