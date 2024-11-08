import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madang_app/core/common/common.dart';
import 'package:madang_app/core/constant/constant.dart';
import 'package:madang_app/core/constant/other/assets.gen.dart';
import 'package:madang_app/features/home/bloc/get_all_package/get_all_package_bloc.dart';
import 'package:madang_app/features/home/model/home_model.dart';

import '../../profile/bloc/get_user_by_id_bloc.dart';
import 'widget/resto_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context
        .read<GetAllPackageBloc>()
        .add(const GetAllPackageEvent.getAllPackage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int current = 0;

    final List<String> imglist = [
      Assets.images.banner.path,
      Assets.images.banner2.path,
    ];

    Widget header() {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              child: BlocBuilder<GetUserByIdBloc, GetUserByIdState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () => const SizedBox(),
                    loading: () {
                      return Text(
                        'Loading...',
                        maxLines: 1,
                        style: AppText.text22
                            .copyWith(fontWeight: FontWeight.bold),
                      );
                    },
                    error: (error) {
                      return Text(
                        'Error',
                        maxLines: 1,
                        style: AppText.text22
                            .copyWith(fontWeight: FontWeight.bold),
                      );
                    },
                    loaded: (user) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name ?? '',
                            maxLines: 1,
                            style: AppText.text22
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Get your favorite food here!',
                            style: AppText.text14
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            Badge(
              backgroundColor: AppColors.primary50Color,
              smallSize: 9,
              child: Image.asset(
                Assets.icons.cart.path,
                scale: 3,
                color: AppColors.grayColor,
              ),
            ),
          ],
        ),
      );
    }

    Widget banner() {
      return Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                children: [
                  CarouselSlider(
                    items: imglist
                        .map(
                          (String e) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                scale: 2,
                                image: AssetImage(
                                  e,
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    options: CarouselOptions(
                        viewportFraction: 1,
                        aspectRatio: 2.1,
                        enableInfiniteScroll: false,
                        onPageChanged: (index, reason) {
                          setState(() {
                            current = index;
                          });
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imglist.asMap().entries.map((entry) {
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? AppColors.grayColor
                                    : AppColors.primary50Color)
                                .withOpacity(current == entry.key ? 0.9 : 0.4)),
                      );
                    }).toList(),
                  ),
                ],
              );
            },
          ));
    }

    Widget serviceResto() {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: HomeModel.serviceList
              .map((e) => Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          switch (e['title']) {
                            case 'Food':
                              Navigation.pushName(RoutesName.menu);
                            default:
                              Navigation.pushName(RoutesName.menu);
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 0.3,
                              color: AppColors.grayColor,
                            ),
                          ),
                          child: Image.asset(
                            e['icon'],
                            scale: 3,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        e['title'],
                        style: AppText.text14
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ))
              .toList(),
        ),
      );
    }

    Widget recommendationResto() {
      return BlocBuilder<GetAllPackageBloc, GetAllPackageState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox(),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error) => Center(
              child: Text(error, style: AppText.text18),
            ),
            loaded: (data) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      'Recommendation',
                      style: AppText.text20.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        data.length,
                        (index) => Container(
                          margin: EdgeInsets.only(
                            right: index == data.length - 1 ? 20 : 15,
                            left: index == 0 ? 20 : 0,
                          ),
                          child: RestoCardWidget(
                            data: data[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              );
            },
          );
        },
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            banner(),
            serviceResto(),
            recommendationResto(),
          ],
        ),
      ),
    );
  }
}
