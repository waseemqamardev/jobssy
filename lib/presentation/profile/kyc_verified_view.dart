import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/primary_button.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';

class KYCVerifiedView extends StatelessWidget {
  const KYCVerifiedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 100.h,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "KYC Status",
          style: FontHelper.f24w500MediumStyle.copyWith(
            color: AppColor.black,
            fontWeight: FontWeight.w700,
            fontSize: 26.sp,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            const Divider(color: AppColor.border, thickness: 1),
            const Spacer(flex: 2),

            Center(
              child: Image.asset(
                Assets.imagesVerified,
                width: 250.w,
                height: 250.h,
                fit: BoxFit.contain,
              ),
            ),

            15.heightSpace,

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                "You are KYC verified. Happy Job hunting Season",
                textAlign: TextAlign.center,
                style: FontHelper.f12w500MediumStyle.copyWith(
                  color: AppColor.tertiary,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
            ),

            const Spacer(flex: 3),

          ],
        ),
      ),
    );
  }
}