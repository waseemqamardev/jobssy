import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/configs/colors/app_colors.dart';
import '../../../core/configs/font_style.dart';
import '../../../core/utils/extensions.dart';
import '../../../generated/assets.dart';

class LocationPermissionDialog extends StatelessWidget {
  const LocationPermissionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          25.heightSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              "Allow “Jobsy” to use your location?",
              textAlign: TextAlign.center,
              style: FontHelper.f18BoldStyle.copyWith(
                fontSize: 17.sp,
                fontWeight: FontWeight.w700,
                color: AppColor.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Text(
              "Turning on location services allows us to show you when coyotes are nearby.",
              textAlign: TextAlign.center,
              style: FontHelper.f13w400Regular.copyWith(
                color: AppColor.black,
                height: 1.4,
              ),
            ),
          ),
          20.heightSpace,
          Image.asset(
            Assets.imagesDialogMap,
            width: double.infinity,
            height: 180.h,
            fit: BoxFit.cover,
          ),
          _dialogButton("Allow Once", () => Navigator.pop(context)),
          const Divider(height: 1, color: AppColor.border),
          _dialogButton("Allow While Using App", () => Navigator.pop(context)),
          const Divider(height: 1, color: AppColor.border),
          _dialogButton("Don’t Allow", () => Navigator.pop(context)),
        ],
      ),
    );
  }

  Widget _dialogButton(String title, VoidCallback onTap) {
    return SizedBox(
      width: double.infinity,
      height: 55.h,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          foregroundColor: AppColor.primary,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        ),
        child: Text(
          title,
          style: FontHelper.f14w400Regular.copyWith(
            color: AppColor.primary,
          ),
        ),
      ),
    );
  }
}
