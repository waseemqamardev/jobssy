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
          "Notifications",
          style: FontHelper.f24w500MediumStyle.copyWith(
            color: AppColor.black,
            fontWeight: FontWeight.w700,
            fontSize: 26.sp,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          const Divider(
            color: AppColor.border,
            thickness: 1,
          ),
          20.heightSpace,
          _buildSectionHeader("Today"),
          _buildNotificationItem(
            assetPath: Assets.iconsNotification,
            title: "New Opportunity Alert!",
            subtitle: "User experience designer: 3 opportunities in Rawalpindi",
            hasButton: true,
            buttonText: "View jobs",
          ),

          15.heightSpace,
          _buildSectionHeader("Yesterday"),
          _buildNotificationItem(
            assetPath: Assets.iconsNotification,
            title: "Last Chance",
            subtitle: "Only 24 hours left to apply for this job. Don't miss out.",
          ),
          _buildNotificationItem(
            assetPath: Assets.iconsNotification,
            title: "Boost Your Visibility",
            subtitle: "Profiles with updated resumes are 3x more likely to get noticed. Refresh yours today.",
          ),
          _buildNotificationItem(
            assetPath: Assets.iconsNotification,
            title: "Explore Top Picks for You",
            subtitle: "Handpicked jobs/projects you might love. Check them out!",
            hasButton: true,
            buttonText: "View Details",
          ),

          15.heightSpace,
          _buildSectionHeader("May, 27 2025"),
          _buildNotificationItem(
            assetPath: Assets.iconsNotification,
            title: "Project Just for You!",
            subtitle: "We've found a freelance project that matches your skills. Ready to explore it?",
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: Text(
        title,
        style: FontHelper.f18BoldStyle.copyWith(
          fontWeight: FontWeight.w700,
          color: AppColor.black,
        ),
      ),
    );
  }

  Widget _buildNotificationItem({
    required String assetPath,
    required String title,
    required String subtitle,
    bool hasButton = false,
    String? buttonText,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50.w,
            height: 50.h,
            padding: EdgeInsets.all(10.w),
            decoration: const BoxDecoration(
              color: AppColor.primary,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              assetPath,
              width: 24.w,
              height: 24.h,
              fit: BoxFit.contain,
            ),
          ),
          15.widthSpace,

          // Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: FontHelper.f16BoldStyle.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColor.black,
                  ),
                ),
                5.heightSpace,
                Text(
                  subtitle,
                  style: FontHelper.f12w500MediumStyle.copyWith(
                    color: AppColor.tertiary,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                if (hasButton) ...[
                  10.heightSpace,
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        buttonText ?? '',
                        style: FontHelper.f12w500MediumStyle.copyWith(
                          color: AppColor.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }

}