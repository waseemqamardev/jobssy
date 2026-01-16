import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/primary_button.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';

import '../customer_jobs/proposal_view.dart';

class JobsInProgressView extends StatefulWidget {
  const JobsInProgressView({super.key});

  @override
  State<JobsInProgressView> createState() => _JobsInProgressViewState();
}

class _JobsInProgressViewState extends State<JobsInProgressView> {
  // Mockup states
  bool isInProgressSelected = true; // Right side (In progress)
  bool isPostedSelected = true;     // Right side (Posted)
  bool hasPostedJobs = true;       // Toggle for empty state vs list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          "My Jobs",
          style: FontHelper.f24w500MediumStyle.copyWith(
            color: AppColor.black,
            fontWeight: FontWeight.w700,
            fontSize: 26.sp,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            const Divider(color: AppColor.border, thickness: 1),
            15.heightSpace,

            // First Row: Just Posted | In progress
            _buildToggleTab(
              leftLabel: "Just Posted",
              rightLabel: "In progress",
              isSelected: isInProgressSelected,
              onChanged: (val) => setState(() => isInProgressSelected = val),
            ),
            15.heightSpace,

            // Second Row: Ongoing (2) | Posted (1)
            _buildToggleTab(
              leftLabel: "Ongoing (2)",
              rightLabel: "Posted (1)",
              isSelected: isPostedSelected,
              onChanged: (val) => setState(() => isPostedSelected = val),
            ),

            // Dropdown visible when "Posted" is selected
            if (isPostedSelected)
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.border),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("On going", style: TextStyle(fontSize: 12.sp, color: AppColor.black)),
                        5.widthSpace,
                        Icon(Icons.keyboard_arrow_down, size: 16.sp, color: AppColor.black),
                      ],
                    ),
                  ),
                ),
              ),

            20.heightSpace,

            // Main Content Area
            Expanded(
              child: (isInProgressSelected && isPostedSelected && hasPostedJobs)
                  ? _buildJobsList()
                  : _buildEmptyState(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJobsList() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        _buildJobPostCard("Barista", "1 day", AppColor.lightGrey, AppColor.primary),
        _buildJobPostCard("Barista", "Closed", Colors.red.withOpacity(0.1), Colors.red),
        _buildJobPostCard("Barista", "1 day", AppColor.lightGrey, AppColor.primary),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Nothing here. For now.",
          style: FontHelper.f18BoldStyle.copyWith(
              fontWeight: FontWeight.w700, color: AppColor.black),
        ),
        5.heightSpace,
        Text(
          "This is where you'll find your projects.",
          style: FontHelper.f14w400Regular.copyWith(color: AppColor.tertiary),
        ),
        40.heightSpace,
        PrimaryButton(
          onTap: () => setState(() => hasPostedJobs = true),
          width: 133.w,
          height: 36.h,
          bgColor: AppColor.primary,
          borderRadius: 10.r,
          childWidget: Text(
            "Post Now",
            style: FontHelper.f15w600SemiBold.copyWith(color: AppColor.white),
          ),
        )
      ],
    );
  }

  Widget _buildJobPostCard(String role, String status, Color tagBg, Color tagTextColor) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.border),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(role,
                  style: FontHelper.f18BoldStyle.copyWith(
                      fontWeight: FontWeight.w600, color: AppColor.black)),
              Container(
                decoration: BoxDecoration(
                  color: tagBg,
                  borderRadius: BorderRadius.circular(7.5.r),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: Text(
                  status,
                  style: FontHelper.f12w500MediumStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: tagTextColor,
                    fontSize: 10.sp,
                  ),
                ),
              ),
            ],
          ),
          4.heightSpace,
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Blue Bottle Coffee",
                style: FontHelper.f14w400Regular.copyWith(color: AppColor.tertiary)),
          ),
          15.heightSpace,
          Row(
            children: [
              Image.asset(Assets.iconsDollar, width: 15.w, height: 15.h),
              5.widthSpace,
              Text("\$18/hour", style: FontHelper.f14w400Regular.copyWith(color: AppColor.tertiary)),
              const Spacer(),
              Image.asset(Assets.iconsJobsTime, width: 15.w, height: 15.h),
              Text(" 7:00 AM - 3:00 PM", style: FontHelper.f14w400Regular.copyWith(color: AppColor.tertiary))
            ],
          ),
          15.heightSpace,
          Row(
            children: [
              const Icon(Icons.star, color: Colors.yellow, size: 18),
              5.widthSpace,
              Text("4.8 (124)", style: FontHelper.f14w400Regular.copyWith(color: AppColor.tertiary)),
              const Spacer(),
              Image.asset(Assets.iconsJobsLocation, width: 15.w, height: 15.h),
              Text(" 0.8 mi", style: FontHelper.f14w400Regular.copyWith(color: AppColor.tertiary))
            ],
          ),
          15.heightSpace,
          const Divider(color: AppColor.border),
          12.heightSpace,
          Row(
            children: [
              Expanded(
                child: _actionButton(
                  "View Proposal",
                  AppColor.primary,
                  AppColor.white,
                      () => Get.to(() => const ProposalView()),
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

  Widget _actionButton(String title, Color bgColor, Color textColor, VoidCallback onTap, {bool isOutlined = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 38.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8.r),
          border: isOutlined ? Border.all(color: textColor) : null,
        ),
        child: Text(
          title,
          style: TextStyle(color: textColor, fontWeight: FontWeight.w600, fontSize: 13.sp),
        ),
      ),
    );
  }

  Widget _buildToggleTab({required String leftLabel, required String rightLabel, required bool isSelected, required Function(bool) onChanged}) {
    return Container(
      height: 45.h,
      decoration: BoxDecoration(color: const Color(0xffF1F1F1), borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onChanged(false),
              child: Container(
                decoration: BoxDecoration(
                  color: !isSelected ? AppColor.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                alignment: Alignment.center,
                child: Text(leftLabel, style: TextStyle(color: !isSelected ? AppColor.white : Colors.grey.shade600, fontWeight: FontWeight.w500)),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => onChanged(true),
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? AppColor.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                alignment: Alignment.center,
                child: Text(rightLabel, style: TextStyle(color: isSelected ? AppColor.white : Colors.grey.shade600, fontWeight: FontWeight.w500)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}