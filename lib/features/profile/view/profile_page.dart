import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madang_app/core/common/common.dart';
import 'package:madang_app/core/components/message/message_bar.dart';
import 'package:madang_app/core/constant/other/assets.gen.dart';
import 'package:madang_app/core/extensions/build_context_ext.dart';
import 'package:madang_app/features/auth/bloc/logout/logout_bloc.dart';
import 'package:madang_app/features/profile/model/profile_model.dart';

import '../../../core/constant/constant.dart';
import '../bloc/get_user_by_id_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    AppBar appBar() {
      return AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Profile',
          style: AppText.text20.copyWith(fontWeight: FontWeight.bold),
        ),
      );
    }

    Widget header() {
      return BlocBuilder<GetUserByIdBloc, GetUserByIdState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const SizedBox(),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error) => Center(
              child: Text(error, style: AppText.text16),
            ),
            loaded: (user) {
              return Row(
                children: [
                  Container(
                    width: context.deviceWidth * 1 / 5,
                    height: context.deviceWidth * 1 / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        scale: 4,
                        image: AssetImage(
                          Assets.images.foto.path,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.name ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppText.text16
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          user.email ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppText.text14,
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.edit,
                        color: AppColors.grayColor,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Edit',
                        style: AppText.text12,
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
      );
    }

    Widget logout() {
      return BlocConsumer<LogoutBloc, LogoutState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => TextButton(
              onPressed: () async {
                context.read<LogoutBloc>().add(const LogoutEvent.logout());
              },
              child: Text(
                'Logout',
                style: AppText.text14
                    .copyWith(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
          );
        },
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            error: (error) => MessageBar.messageBar(context, error),
            success: (success) {
              MessageBar.messageBar(context, success);
              Navigation.pushReplacement(RoutesName.intro);
            },
          );
        },
      );
    }

    Widget account() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Text(
            'Account',
            style: AppText.text16.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: ProfileModel.account
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: [
                        Image.asset(
                          e['icon'],
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(width: 20),
                        Text(
                          e['label'],
                          style: AppText.text16,
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.grayColor,
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          )
        ],
      );
    }

    Widget moreInfo() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Text(
            'More Info',
            style: AppText.text16.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: ProfileModel.moreInfo
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: [
                        Image.asset(
                          e['icon'],
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(width: 20),
                        Text(
                          e['label'],
                          style: AppText.text16,
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.grayColor,
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          )
        ],
      );
    }

    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            header(),
            account(),
            moreInfo(),
            logout(),
          ],
        ),
      ),
    );
  }
}
