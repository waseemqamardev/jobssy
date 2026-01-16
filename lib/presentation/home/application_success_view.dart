import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/home/home_view.dart';
import 'package:jobssy/presentation/home_screen.dart'; // Ensure path is correct
import 'package:jobssy/presentation/roles/select_role_view.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart'; // Font style import karein
import '../../core/global_components/primary_button.dart';
import '../../core/utils/extensions.dart';
import '../../main.dart'; // Button component

class ApplicationSuccessView extends StatefulWidget {
  const ApplicationSuccessView({super.key});

  @override
  State<ApplicationSuccessView> createState() => _ApplicationSuccessViewState();
}

class _ApplicationSuccessViewState extends State<ApplicationSuccessView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      _showSuccessDialog();
    });
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Text(
                  "Application Successful",
                  style: FontHelper.f24w500MediumStyle.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 24.sp,
                  ),
                ),
                16.heightSpace,
                // Subtitle
                Text(
                  "Congratulations! your application was sent to U-HAUL movers.",
                  textAlign: TextAlign.center,
                  style: FontHelper.f14w500MediumStyle.copyWith(
                    color: AppColor.tertiary,
                    height: 1.5,
                  ),
                ),
                32.heightSpace,
                PrimaryButton(
                  height: 48.h,
                  onTap: () {
                    Get.to(SimpleBottomNav());
                  },
                  childWidget: Text(
                    "Back to Home",
                    style: FontHelper.f16w500MediumStyle.copyWith(
                        fontWeight: FontWeight.w600, color: AppColor.white),
                  ),
                  bgColor: AppColor.primary,
                  borderRadius: 11.85.r,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100.w,
              height: 100.h,
              decoration: const BoxDecoration(
                color:AppColor.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check,
                color: AppColor.white,
                size: 50.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}