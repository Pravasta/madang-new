import 'package:flutter/material.dart';
import 'package:madang_app/core/common/common.dart';
import 'package:madang_app/core/components/button/default_button.dart';
import 'package:madang_app/core/constant/constant.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget openingText() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Madang',
            style: AppText.text26.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary50Color,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Booking a table and food from\neverywhere.',
            style: AppText.text18.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
    }

    Widget signUpButton() {
      return DefaultButton(
        title: 'Sign Up',
        borderRadius: 5,
        height: 50,
        titleColor: AppColors.whiteColor,
        onTap: () => Navigation.pushName(RoutesName.signUp),
      );
    }

    Widget loginButton() {
      return DefaultButton(
        title: 'Login',
        borderRadius: 5,
        height: 50,
        backgroundColor: AppColors.whiteColor,
        titleColor: AppColors.blackColor,
        borderColor: AppColors.primary50Color,
        elevation: 0,
        onTap: () => Navigation.pushName(RoutesName.login),
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            openingText(),
            const SizedBox(height: 100),
            signUpButton(),
            const SizedBox(height: 15),
            loginButton(),
          ],
        ),
      ),
    );
  }
}
