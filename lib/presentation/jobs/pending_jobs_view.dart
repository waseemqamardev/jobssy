import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/primary_button.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';

class PendingJobsView extends StatelessWidget {
  const PendingJobsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 100.h,
        elevation: 0,
        centerTitle: true,
        leadingWidth: 5.w,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Pending Job Requests",
          style: FontHelper.f24w500MediumStyle.copyWith(
            color: AppColor.black,
            fontWeight: FontWeight.w700,
            fontSize: 26.sp,
          ),
        ),
      ),

      body: Column(
        children: [
          const Divider(color: AppColor.border, thickness: 1),
          20.heightSpace,
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemCount: 2,
              itemBuilder: (context, index) {
                String title = index == 0 ? "Cashier" : "Cleaner";
                String agency = index == 0 ? "Design Agency" : "Cash n Co.";
                String profilePic = index == 0 ? Assets.imagesOnboard1 : Assets.imagesOnboard1;

                return _buildPendingJobCard(title, agency, profilePic);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPendingJobCard(String title, String agency, String profilePath) {
    return Container(
      width: 354.w,
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColor.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: FontHelper.f18BoldStyle.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColor.black,
                ),
              ),
              Row(
                children: [
                  Image.asset(Assets.iconsJobsTag, width: 20.w, height: 20.h),
                  4.widthSpace,
                  Text(
                    "10\$/hr",
                    style: FontHelper.f14w400Regular.copyWith(color: AppColor.black),
                  ),
                ],
              ),
            ],
          ),
          12.heightSpace,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(Assets.iconsPendingJobsCalender, width: 22.w, height: 22.h),
                  8.widthSpace,
                  Text(
                    "12/2/2025",
                    style: FontHelper.f14w400Regular.copyWith(color: AppColor.black),
                  ),
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 12.r,
                    backgroundImage: AssetImage(profilePath),
                  ),
                  8.widthSpace,
                  Text(
                    agency,
                    style: FontHelper.f14w400Regular.copyWith(
                      color: AppColor.tertiary,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),

          10.heightSpace,
          const Divider(color: AppColor.border, thickness: 0.5),
          12.heightSpace,

          Row(
            children: [
              Expanded(
                child: _actionButton(
                  "View Detail",
                  AppColor.primary,
                  AppColor.white,
                      () {},
                ),
              ),
              12.widthSpace,
              Expanded(
                child: _actionButton(
                  "Delete",
                  AppColor.white,
                  AppColor.primary,
                      () {},
                  isOutlined: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _actionButton(String title, Color bg, Color text, VoidCallback onTap,
      {bool isOutlined = false}) {
    return PrimaryButton(
      onTap: onTap,
      width: double.infinity,
      height: 44.h,
      bgColor: bg,
      borderColor: isOutlined ? AppColor.primary : null,
      borderRadius: 10.r,
      childWidget: Text(
        title,
        style: FontHelper.f15w600SemiBold.copyWith(color: text),
      ),
    );
  }
}