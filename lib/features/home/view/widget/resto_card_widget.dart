import 'package:flutter/material.dart';
import 'package:madang_app/core/constant/constant.dart';
import 'package:madang_app/core/constant/other/assets.gen.dart';
import 'package:madang_app/core/extensions/num_ext.dart';
import 'package:madang_app/data/model/response/package_response_model.dart';

class RestoCardWidget extends StatelessWidget {
  const RestoCardWidget({super.key, required this.data});

  final Package data;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      shadowColor: AppColors.grayColor,
      color: AppColors.whiteColor,
      elevation: 1,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.asset(
                  Assets.images.resto.path,
                  scale: 3.5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.name ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          AppText.text16.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${data.numberTable} table ${data.numberChair} chair',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppText.text14.copyWith(
                          color: AppColors.grayColor,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      double.parse(data.price!).currencyFormatRp,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          AppText.text16.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: const BoxDecoration(
                  color: AppColors.secondary90Color,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  )),
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 20,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    double.parse(data.rating!).toStringAsFixed(1),
                    style: AppText.text14.copyWith(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
