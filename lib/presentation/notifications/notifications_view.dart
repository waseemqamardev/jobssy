import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
              child: Row(
                children: [
                  _buildCircleButton(Icons.arrow_back_ios_new, () => Get.back()),
                  const Spacer(),
                  Text(
                    "Notifications",
                    style: FontHelper.f16BoldStyle.copyWith(
                      color: AppColor.dark,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(width: 44.w),
                ],
              ),
            ),

            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
                children: [
                  _buildSectionHeader("Today"),
                  _buildNotificationCard(
                    title: "New Opportunity Alert!",
                    subtitle: "User experience designer: 3 opportunities in Rawalpindi",
                  ),

                  20.heightSpace,

                  _buildSectionHeader("Yesterday"),
                  _buildNotificationCard(
                    title: "Last Chance",
                    subtitle: "Only 24 hours left to apply for this job. Don't miss out.",
                  ),
                  _buildNotificationCard(
                    title: "Boost Your Visibility",
                    subtitle: "Profiles with updated resumes are 3x more likely to get noticed. Refresh yours today.",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Text(
        title,
        style: FontHelper.f14w500MediumStyle.copyWith(
          color: AppColor.dark,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildNotificationCard({
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 45.h,
            width: 45.w,
            decoration: BoxDecoration(
              color: AppColor.lightGrey.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child:  Image.asset(Assets.iconsNotificationnew,
                height: 18.h,
                width: 18.w,
              color: AppColor.primary,),
          ),
          15.widthSpace,
          // Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: FontHelper.f14w500MediumStyle.copyWith(
                    color: AppColor.dark,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                5.heightSpace,
                Text(
                  subtitle,
                  style: FontHelper.f12w500MediumStyle.copyWith(
                    color: AppColor.tertiary,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44.r,
        width: 44.r,
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