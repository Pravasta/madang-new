import 'package:madang_app/core/constant/constant.dart';
import 'package:madang_app/core/constant/other/assets.gen.dart';
import 'package:madang_app/core/core.dart';
import 'package:madang_app/core/extensions/num_ext.dart';
import 'package:madang_app/data/model/response/menu_response_model.dart';

class MenuModalBottomSheet extends StatelessWidget {
  const MenuModalBottomSheet({super.key, required this.menu});

  final Menu menu;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.deviceHeight * 3 / 5,
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: menu.image == null
                ? Image.asset(
                    Assets.images.menus.path,
                    height: context.deviceHeight * 1 / 3,
                    width: context.deviceWidth,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    menu.image,
                    height: context.deviceHeight * 1 / 3,
                    width: context.deviceWidth,
                    fit: BoxFit.cover,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            menu.name ?? '',
                            style: AppText.text20.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              for (int i = 0;
                                  i < double.parse(menu.rating!);
                                  i++)
                                const Icon(Icons.star, color: Colors.orange),
                              const SizedBox(width: 10),
                              Text(
                                double.parse(menu.rating!).toStringAsFixed(1),
                                style: AppText.text16
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.grayColor,
                          ),
                          child: const Icon(
                            Icons.remove,
                            size: 15,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          '0',
                          style: AppText.text16.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primary50Color,
                          ),
                          child: const Icon(
                            Icons.add,
                            size: 15,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  double.parse(menu.price!).currencyFormatRp,
                  style: AppText.text18.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                DefaultButton(
                  title: 'Place Order',
                  onTap: () {},
                  borderRadius: 7,
                  height: 50,
                  titleColor: AppColors.whiteColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
