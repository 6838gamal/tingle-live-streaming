import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:tingle/page/profile_page/controller/profile_controller.dart';
import 'package:tingle/routes/app_routes.dart';
import 'package:tingle/utils/assets.dart';
import 'package:tingle/utils/font_style.dart';
import 'package:tingle/utils/utils.dart';

class GeneralSettingWidget extends StatelessWidget {
  const GeneralSettingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        // ✅ بني للخلفية
        color: const Color(0xFF4E342E),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: GetBuilder<ProfileController>(builder: (controller) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ItemWidget(
                  title: "Live Data",
                  image: AppAssets.icLiveDataIcon,
                  callback: () {},
                ),
                ItemWidget(
                  title: "Backpack",
                  image: AppAssets.icBackpackIcon,
                  callback: () {
                    Get.toNamed(AppRoutes.backpackPage)?.then((value) {
                      Utils.onChangeStatusBar(brightness: Brightness.dark);
                      controller.scrollController.jumpTo(0.0);
                    });
                  },
                ),
                ItemWidget(
                  title: "Help",
                  image: AppAssets.icHelpIcon,
                  callback: () {
                    Get.toNamed(AppRoutes.helpPage)?.then((value) {
                      Utils.onChangeStatusBar(brightness: Brightness.dark);
                      controller.scrollController.jumpTo(0.0);
                    });
                  },
                ),
                ItemWidget(
                  title: "My Agency",
                  image: AppAssets.icMyAgencyIcon,
                  callback: () {},
                ),
              ],
            ),
            15.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ItemWidget(
                  title: "Level",
                  image: AppAssets.icLevelIcon,
                  callback: () {},
                ),
                ItemWidget(
                  title: "About",
                  image: AppAssets.icAboutUsIcon,
                  callback: () {},
                ),
                ItemWidget(
                  title: "Settings",
                  image: AppAssets.icSettingIcon,
                  callback: () {},
                ),
                54.width,
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
              // ✅ زر ذهبي
              color: const Color(0xFFFFD54F),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(
              image,
              width: 26,
              color: const Color(0xFF4E342E), // لون الأيقونة بني
            ),
          ),
          5.height,
          Text(
            title,
            // ✅ نص بني فاتح
            style: AppFontStyle.styleW500(const Color(0xFF6D4C41), 11),
          ),
        ],
      ),
    );
  }
}

