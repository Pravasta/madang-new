import '../../core.dart';
import 'app_colors.dart';
import 'app_text.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData().copyWith(
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      titleTextStyle: AppText.text20.copyWith(fontWeight: FontWeight.bold),
      foregroundColor: AppColors.whiteColor,
      surfaceTintColor: AppColors.whiteColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(5),
        backgroundColor: AppColors.primary50Color,
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      elevation: 4,
      backgroundColor: AppColors.grayColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
    ),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: AppColors.primary50Color),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.blackColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary50Color,
      selectedLabelStyle: AppText.text16.copyWith(fontWeight: FontWeight.bold),
      unselectedItemColor: AppColors.grayColor,
      unselectedLabelStyle: AppText.text16
          .copyWith(color: AppColors.grayColor, fontWeight: FontWeight.bold),
    ),
  );
}
