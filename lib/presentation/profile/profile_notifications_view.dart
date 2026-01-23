import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/utils/extensions.dart';

class ProfileNotificationsView extends StatefulWidget {
  const ProfileNotificationsView({super.key});

  @override
  State<ProfileNotificationsView> createState() => _ProfileNotificationsViewState();
}

class _ProfileNotificationsViewState extends State<ProfileNotificationsView> {
  bool emailNotifications = true;
  bool alerts = false;
  bool popUps = true;
  bool promotions = true;

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

            20.heightSpace,

            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                children: [
                  _buildNotificationSwitch(
                      "Email Notifications",
                      emailNotifications,
                          (val) => setState(() => emailNotifications = val)
                  ),
                  _buildNotificationSwitch(
                      "Alerts",
                      alerts,
                          (val) => setState(() => alerts = val)
                  ),
                  _buildNotificationSwitch(
                      "Pop Ups",
                      popUps,
                          (val) => setState(() => popUps = val)
                  ),
                  _buildNotificationSwitch(
                      "Promotions",
                      promotions,
                          (val) => setState(() => promotions = val)
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationSwitch(String title, bool value, ValueChanged<bool> onChanged) {
    return Padding(
      padding: EdgeInsets.only(bottom: 25.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: FontHelper.f14w400Regular.copyWith(
              color: AppColor.dark,
              fontWeight: FontWeight.w700,
            ),
          ),
          Transform.scale(
            scale: 0.8,
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeColor: Colors.blue,
              activeTrackColor: AppColor.white,
              inactiveThumbColor: Colors.grey.shade600,
              inactiveTrackColor: Colors.grey.shade300,
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