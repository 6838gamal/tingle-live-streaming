import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:tingle/page/profile_page/controller/profile_controller.dart';
import 'package:tingle/routes/app_routes.dart';
import 'package:tingle/utils/assets.dart';
import 'package:tingle/utils/color.dart';
import 'package:tingle/utils/enums.dart';
import 'package:tingle/utils/font_style.dart';
import 'package:tingle/utils/utils.dart';

class BenefitBoxWidget extends StatelessWidget {
  const BenefitBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF4E342E), // خلفية بني
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFFD54F).withValues(alpha: 0.25), // ظل ذهبي
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: GetBuilder<ProfileController>(builder: (logic) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ItemWidget(
                  title: EnumLocal.txtReward.name.tr,
                  image: AppAssets.icRewardIcon,
                  callback: () {},
                ),
                ItemWidget(
                  title: EnumLocal.txtRanking.name.tr,
                  image: AppAssets.icRankingIcon,
                  callback: () => Get.toNamed(AppRoutes.rankingPage)?.then((value) {
                    Utils.onChangeStatusBar(brightness: Brightness.dark);
                    logic.scrollController.jumpTo(0.0);
                  }),
                ),
                ItemWidget(
                  title: EnumLocal.txtMyStore.name.tr,
                  image: AppAssets.icMyStoreIcon,
                  callback: () => Get.toNamed(AppRoutes.storePage)?.then((value) {
                    logic.scrollController.jumpTo(0.0);
                    Utils.onChangeStatusBar(brightness: Brightness.dark);
                  }),
                ),
                ItemWidget(
                  title: EnumLocal.txtInvite.name.tr,
                  image: AppAssets.icInviteIcon,
                  callback: () {},
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.title,
    required this.image,
    required this.callback,
  });

  final String title;
  final String image;
  final Callback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Column(
        children: [
          Container(
            height: 54,
            width: 54,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFFFD54F), // زر ذهبي
              borderRadius: BorderRadius.circular(16),
              border: Border.all(width: 1, color: const Color(0xFF4E342E)),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF4E342E).withValues(alpha: 0.4),
                  spreadRadius: 1,
                  blurRadius: 3,
                ),
              ],
            ),
            child: Image.asset(
              image,
              width: 26,
              color: const Color(0xFF4E342E), // الأيقونة بني
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: AppFontStyle.styleW600(
              const Color(0xFF6D4C41), // نص بني فاتح
              11,
            ),
          )
        ],
      ),
    );
  }
}

