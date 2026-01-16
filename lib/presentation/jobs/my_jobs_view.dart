import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobssy/presentation/jobs/warehouse_associate_view.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/primary_button.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';
import 'package:get/get.dart';

class MyJobsView extends StatefulWidget {
  const MyJobsView({super.key});

  @override
  State<MyJobsView> createState() => _MyJobsViewState();
}

class _MyJobsViewState extends State<MyJobsView> {
  int selectedTab = 0; // 0 for Upcoming, 1 for In Progress

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        toolbarHeight: 100.h,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            42.heightSpace,
            Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Text(
                    "My Jobs",
                    style: FontHelper.f24w500MediumStyle.copyWith(
                      color: AppColor.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 26.sp,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Image.asset(
                    Assets.iconsJobsQuestionmark,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const Divider(
            color: AppColor.border,
            thickness: 1,
          ),
          15.heightSpace,
          _buildTabSwitcher(),
          30.heightSpace,
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemCount: 2,
              itemBuilder: (context, index) => _buildJobCard(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabSwitcher() {
    return Container(
      height: 55.h,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          _tabButton("Upcoming (2)", 0),
          _tabButton("In Progress (1)", 1),
        ],
      ),
    );
  }

  Widget _tabButton(String title, int index) {
    bool isActive = selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = index),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            color: isActive ? AppColor.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: FontHelper.f14w400Regular
                .copyWith(color: isActive ? AppColor.white : AppColor.black),
          ),
        ),
      ),
    );
  }

  Widget _buildJobCard() {
    bool isInProgress = selectedTab == 1;

    return Container(
      height: 214.h,
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
                "Barista",
                style: FontHelper.f18BoldStyle.copyWith(
                    fontWeight: FontWeight.w600, color: AppColor.black),
              ),
              _statusTag(isInProgress ? "In Progress" : "Upcoming"),
            ],
          ),
          5.heightSpace,
          Text(
            "Blue Bottle Coffee",
            style: FontHelper.f14w400Regular.copyWith(color: AppColor.tertiary),
          ),
          12.heightSpace,
          _iconText(Assets.iconsJobsTime, "Today, 2:00 PM - 6:00 PM"),
          8.heightSpace,
          _iconText(Assets.iconsJobsLocation, "123 Main St, Downtown"),
          20.heightSpace,

          Row(
            children: [
              Expanded(
                child: _actionButton(
                  "View Detail",
                  AppColor.primary,
                  AppColor.white,
                  () {
                    Get.offAll(() =>
                        WarehouseAssociateView(isInProgress: isInProgress));
                  },
                ),
              ),
              12.widthSpace,
              Expanded(
                child: _actionButton(
                  isInProgress ? "Mark as Done" : "Cancel",
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

  Widget _statusTag(String status) {
    bool isInProgress = status == "In Progress";

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: isInProgress ? const Color(0xFFFFF8E1) : const Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        status,
        style: FontHelper.f12w500MediumStyle.copyWith(
          color: AppColor.black,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _iconText(String assetPath, String text) {
    return Row(
      children: [
        Image.asset(
          assetPath,
          width: 16.w,
          height: 16.h,
          fit: BoxFit.contain,
        ),
        8.widthSpace,
        Text(
          text,
          style: FontHelper.f14w400Regular.copyWith(color: AppColor.tertiary),
        ),
      ],
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
