import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madang_app/core/constant/constant.dart';
import 'package:madang_app/features/home/view/home_page.dart';
import 'package:madang_app/features/main_page/model/main_page_model.dart';
import 'package:madang_app/features/profile/bloc/get_user_by_id_bloc.dart';
import 'package:madang_app/features/profile/view/profile_page.dart';
import 'package:madang_app/features/recent/view/recent_page.dart';
import 'package:madang_app/features/search/view/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  void initState() {
    context.read<GetUserByIdBloc>().add(const GetUserByIdEvent.getUserById());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetBottomNavbar = [
      const HomePage(),
      const SearchPage(),
      const RecentPage(),
      const ProfilePage(),
    ];

    return Scaffold(
      body: widgetBottomNavbar.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.whiteColor,
        elevation: 4,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        currentIndex: currentIndex,
        items: MainPageModel.bottomNavbarList
            .map(
              (e) => BottomNavigationBarItem(
                icon: Image.asset(
                  e['icon'],
                  color: currentIndex == e['index']
                      ? AppColors.primary50Color
                      : AppColors.grayColor,
                  scale: 3.5,
                  height: 35,
                ),
                label: e['label'],
              ),
            )
            .toList(),
      ),
    );
  }
}
