import 'package:flutter/material.dart';

import 'package:madang_app/core/constant/constant.dart';
import 'package:madang_app/core/constant/other/assets.gen.dart';
import 'package:madang_app/data/datasources/auth_datasource/auth_local_datasources.dart';
import 'package:madang_app/features/main_page/view/main_page.dart';
import 'package:madang_app/features/splash_intro/view/intro_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(
        const Duration(seconds: 3),
        () => AuthLocalDatasourceImpl().isLogin(),
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == true) {
            return const MainPage();
          } else {
            return const IntroPage();
          }
        } else {
          return Scaffold(
              backgroundColor: AppColors.primary50Color,
              body: Stack(
                children: [
                  Center(
                    child: Text(
                      'Madang',
                      style: AppText.bigText.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                  Image.asset(
                    Assets.icons.vector.path,
                    scale: 4,
                  ),
                  Positioned(
                    right: 0,
                    bottom: 100,
                    child: Image.asset(
                      Assets.icons.vector1.path,
                      scale: 4,
                    ),
                  )
                ],
              ));
        }
      },
    );
  }
}
