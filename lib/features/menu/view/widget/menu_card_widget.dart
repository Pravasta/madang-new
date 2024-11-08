import 'package:madang_app/core/core.dart';
import 'package:madang_app/core/extensions/num_ext.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/constant/other/assets.gen.dart';
import '../../../../data/model/response/menu_response_model.dart';

class MenuCardWidget extends StatelessWidget {
  const MenuCardWidget({super.key, required this.menu});

  final Menu menu;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: AppColors.accent10Color),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: menu.image == null
                ? Image.asset(
                    Assets.images.menus.path,
                    height: context.deviceHeight * 2 / 10,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    menu.image,
                    height: context.deviceHeight * 2 / 10,
                    fit: BoxFit.cover,
                  ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(menu.name ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          AppText.text14.copyWith(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 18,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        double.parse(menu.rating!).toStringAsFixed(1),
                        style: AppText.text12
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Text(
                    double.parse(menu.price!).currencyFormatRp,
                    style: AppText.text14.copyWith(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
