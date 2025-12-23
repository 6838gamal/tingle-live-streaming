import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tingle/utils/color.dart';
import 'package:tingle/utils/enums.dart';
import 'package:tingle/utils/font_style.dart';

class ProfileAppBarWidget extends StatelessWidget {
  const ProfileAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).viewPadding.top + 50,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).viewPadding.top,
        left: 15,
        right: 15,
      ),
      alignment: Alignment.center,
      width: Get.width,
      color: const Color(0xFF4E342E), // بني فاخر
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            EnumLocal.txtMyProfile.name.tr,
            style: AppFontStyle.styleW700(
              const Color(0xFFFFD54F), // نص ذهبي
              20,
            ),
          ),
        ],
      ),
    );
  }
}

