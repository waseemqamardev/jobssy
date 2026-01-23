import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/configs/colors/app_colors.dart';
import '../../../core/configs/font_style.dart';
import '../../../core/utils/extensions.dart';
import '../../../generated/assets.dart';

class ScanQRCodeView extends StatelessWidget {
  const ScanQRCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            20.heightSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: _buildCircleButton(
                      Icons.arrow_back_ios_new,
                          () => Get.back(),
                    ),
                  ),
                  Text(
                    "Scan QR Code",
                    style: FontHelper.f16BoldStyle.copyWith(
                      color: AppColor.dark,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Image.asset(
              Assets.iconsQrscanicon,
              width: 260.w,
              height: 260.h,
              fit: BoxFit.contain,

            ),
            const Spacer(),
            Container(
              height: 64.r,
              width: 64.r,
              decoration: const BoxDecoration(
                color: AppColor.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                  )
                ],
              ),
            ),
            40.heightSpace,
          ],
        ),
      ),
    );
  }

  Widget _buildCircleButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44.h,
        width: 44.w,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColor.border),
        ),
        child: Icon(icon, size: 16.sp, color: AppColor.dark),
      ),
    );
  }
}