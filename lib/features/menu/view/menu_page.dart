import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madang_app/core/constant/constant.dart';
import 'package:madang_app/core/core.dart';
import 'package:madang_app/features/menu/view/widget/menu_card_widget.dart';
import 'package:madang_app/features/menu/view/widget/menu_modal_bottom_sheet.dart';

import '../../../core/constant/other/assets.gen.dart';
import '../bloc/get_all_menu/get_all_menu_bloc.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  void initState() {
    context.read<GetAllMenuBloc>().add(const GetAllMenuEvent.getAllMenu());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar() {
      return AppBar(
        leading: const BackButton(color: AppColors.blackColor),
        title: Text('Menu', style: AppText.text20),
        actions: [
          Image.asset(
            Assets.icons.cart.path,
            scale: 3,
            color: AppColors.grayColor,
          ),
          const SizedBox(width: 10),
        ],
      );
    }

    Widget searchField() {
      return const DefaultField(
        hintText: 'Search Food or Drink',
        prefixIcon: Icon(Icons.search),
      );
    }

    Widget searchResult() {
      return BlocBuilder<GetAllMenuBloc, GetAllMenuState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () {
              return const SizedBox();
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error) => Center(child: Text(error, style: AppText.text16)),
            loaded: (data) {
              return GridView.builder(
                itemCount: data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.7,
                  crossAxisCount: 2,
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 7,
                ),
                itemBuilder: (context, index) {
                  final menu = data[index];
                  return GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return MenuModalBottomSheet(menu: menu);
                        },
                      );
                    },
                    child: MenuCardWidget(menu: menu),
                  );
                },
              );
            },
          );
        },
      );
    }

    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20.0, right: 20, top: 20, bottom: 0),
        child: Column(
          children: [
            searchField(),
            const SizedBox(height: 20),
            Expanded(child: searchResult()),
          ],
        ),
      ),
    );
  }
}
