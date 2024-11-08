import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madang_app/core/common/common.dart';
import 'package:madang_app/core/constant/constant.dart';
import 'package:madang_app/core/utils/route_observer.dart';
import 'package:madang_app/features/auth/bloc/login/login_bloc.dart';
import 'package:madang_app/features/auth/bloc/logout/logout_bloc.dart';
import 'package:madang_app/features/auth/bloc/register/register_bloc.dart';
import 'package:madang_app/features/auth/repository/auth_repository.dart';
import 'package:madang_app/features/home/bloc/get_all_package/get_all_package_bloc.dart';
import 'package:madang_app/features/home/repository/home_repository.dart';
import 'package:madang_app/features/menu/bloc/get_all_menu/get_all_menu_bloc.dart';
import 'package:madang_app/features/menu/repository/menu_repository.dart';
import 'package:madang_app/features/profile/bloc/get_user_by_id_bloc.dart';
import 'package:madang_app/features/profile/repository/profile_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginBloc(AuthRepositoryImpl.create())),
        BlocProvider(create: (_) => RegisterBloc(AuthRepositoryImpl.create())),
        BlocProvider(create: (_) => LogoutBloc(AuthRepositoryImpl.create())),
        BlocProvider(
            create: (_) => GetAllPackageBloc(HomeRepositoryImpl.create())),
        BlocProvider(
            create: (_) => GetUserByIdBloc(ProfileRepositoryImpl.create())),
        BlocProvider(
            create: (_) => GetAllMenuBloc(MenuRepositoryImpl.create())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.darkTheme,
        navigatorKey: navigatorKey,
        initialRoute: RoutesName.initial,
        onGenerateRoute: RoutesHandler.onGenerateRoute,
        debugShowCheckedModeBanner: false,
        navigatorObservers: [routeObserver],
      ),
    );
  }
}
