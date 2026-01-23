import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/customer_home/add_jobpost_view.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';
import '../notifications/notifications_view.dart';

class CustomerHomeView extends StatefulWidget {
  const CustomerHomeView({super.key});

  @override
  State<CustomerHomeView> createState() => _CustomerHomeViewState();
}

class _CustomerHomeViewState extends State<CustomerHomeView> {
  bool isMapView = false;
  bool isLocationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  30.heightSpace,
                  _buildHeader(),
                  20.heightSpace,
                  _buildSectionTitle("Quick Access"),
                  12.heightSpace,
                  _buildQuickAccess(),
                  25.heightSpace,
                  _buildSectionTitle("My Actions"),
                  15.heightSpace,
                  _buildMyActions(),
                  25.heightSpace,
                  _buildSectionTitleWithLink("Recent Job Posts"),
                  15.heightSpace,
                  _buildSuggestedJobsList(),
                  30.heightSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Image.asset(
            Assets.imagesHomeprofile,
            height: 45.h,
            width: 45.w,
            fit: BoxFit.cover,
          ),
        ),
        12.widthSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi, Martin.",
                style: FontHelper.f16BoldStyle.copyWith(color: AppColor.black)),
            2.heightSpace,
            Row(
              children: [
                Image.asset(Assets.iconsHomelocation,
                    height: 18.h, width: 14.w),
                4.widthSpace,
                Text("Downtown Dubai, UAE ",
                    style: TextStyle(fontSize: 11.sp, color: Colors.grey)),
                GestureDetector(
                  onTap: () {},
                  child: Text("Change",
                      style: TextStyle(
                          fontSize: 11.sp,
                          color: AppColor.primary,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => Get.to(() => const NotificationsView()),
          child: Container(
            height: 48.h,
            width: 48.w,
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColor.border),
            ),
            child: Center(
                child: Image.asset(Assets.iconsNotificationnew,
                    height: 22.h, width: 22.w)),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickAccess() {
    return Row(
      children: [
        _quickAccessItem("My Jobs", Assets.iconsFindjobs),
        30.widthSpace,
        _quickAccessItem("Receipts", Assets.iconsEarnings),
        30.widthSpace,
        GestureDetector(
            onTap: (){
              Get.to(Get.to(AddJobPostView()));
            },
            child: _quickAccessItem("Create a Job", Assets.iconsCreatejobicon)),
      ],
    );
  }

  Widget _quickAccessItem(String title, String icon) {
    return Column(
      children: [
        Container(
          height: 60.h,
          width: 60.w,
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.border),
              color: AppColor.white,
              borderRadius: BorderRadius.circular(15.r)),
          child: Center(child: Image.asset(icon, width: 32.w, height: 32.h)),
        ),
        8.heightSpace,
        Text(title,
            style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildMyActions() {
    return Row(
      children: [
        _actionCard("2", "Active Jobs", Assets.iconsActivejobs),
        15.widthSpace,
        _actionCard("18", "Applied Jobs", Assets.iconsAppliedjobs),
      ],
    );
  }

  Widget _actionCard(String count, String title, String icon) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(15.w),
        decoration: BoxDecoration(
            color: AppColor.white,
            border: Border.all(color: AppColor.border),
            borderRadius: BorderRadius.circular(15.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(count,
                    style: TextStyle(
                        fontSize: 24.sp, fontWeight: FontWeight.bold)),
                Image.asset(icon, width: 22.w),
              ],
            ),
            5.heightSpace,
            Text(title, style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
          ],
        ),
      ),
    );
  }

  Widget _buildSuggestedJobsList() {
    return Column(
      children: [
        _buildJobCard("Electrical Engineer", "Coffee, Dubai", "12",
            hasRequests: true),
        _buildJobCard("Car Mechanic", "Porsche, Dubai", "0",
            hasRequests: false),
        _buildJobCard("Car Mechanic", "Porsche, Dubai", "0",
            hasRequests: false),
      ],
    );
  }

  Widget _buildJobCard(String title, String subtitle, String requestCount,
      {bool hasRequests = false}) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColor.border),
      ),
      child: Row(
        children: [
          // 1. Job Image
          Container(
            height: 50.r,
            width: 50.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              image: const DecorationImage(
                image: AssetImage(Assets.imagesCoffeeshop),
                fit: BoxFit.cover,
              ),
            ),
          ),
          10.widthSpace,

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: FontHelper.f16BoldStyle.copyWith(
                    color: AppColor.dark,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                4.heightSpace,
                Text(
                  subtitle,
                  style: FontHelper.f12w500MediumStyle.copyWith(
                    color: AppColor.dark,
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: 90.w,
            height: 24.h,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: hasRequests
                  ? const Color(0xffE6F0FF)
                  : const Color(0xffF2F2F2),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              "$requestCount Request",
              style: TextStyle(
                color: hasRequests ? AppColor.primary : Colors.grey,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(title,
        style: FontHelper.f14w400Regular
            .copyWith(color: AppColor.dark, fontWeight: FontWeight.w700));
  }

  Widget _buildSectionTitleWithLink(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildSectionTitle(title),
        Text("View All >",
            style: TextStyle(
                color: AppColor.primary,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600)),
      ],
    );
  }
}
