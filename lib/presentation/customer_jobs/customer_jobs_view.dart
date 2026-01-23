import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/customer_jobs/posted_job_details_view.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';
import '../notifications/notifications_view.dart';

class CustomerJobsView extends StatefulWidget {
  const CustomerJobsView({super.key});

  @override
  State<CustomerJobsView> createState() => _CustomerJobsViewState();
}

class _CustomerJobsViewState extends State<CustomerJobsView> {
  int selectedTab = 0; // 0: Posted, 1: Active, 2: Closed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.heightSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Jobs Posted",
                      style: FontHelper.f20BoldStyle.copyWith(
                          fontWeight: FontWeight.w700, color: AppColor.dark)),
                  _buildNotificationIcon(),
                ],
              ),
            ),
            24.heightSpace,
            _buildCustomTabBar(),
            15.heightSpace,
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: _buildTabContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    if (selectedTab == 0) {
      return Column(
        children: [
          GestureDetector(
            onTap: (){
              Get.to(PostedJobDetailsView());
            },
            child: _buildJobCard(

                title: "Electrical Engineer",
                subtitle: "Coffee, Dubai",
                badgeText: "12 Request",
                isBlueBadge: true),
          ),
          GestureDetector(
            onTap: (){
              Get.to(PostedJobDetailsView());
            },
            child: _buildJobCard(
                title: "Car Mechanic",
                subtitle: "Porsche, Dubai",
                badgeText: "0 Request",
                isBlueBadge: false),
          ),
        ],
      );
    } else if (selectedTab == 1) {
      return Column(
        children: [
          _buildJobCard(
              title: "Electrical Engineer",
              subtitle: "Coffee, Dubai",
              badgeText: "Finished",
              isBlueBadge: true,
              showAssigned: true),
          _buildJobCard(
              title: "Electrical Engineer",
              subtitle: "Coffee, Dubai",
              badgeText: "Ongoing",
              isGreenBadge: true,
              showAssigned: true),
          _buildJobCard(
              title: "Car Mechanic",
              subtitle: "Porsche, Dubai",
              badgeText: "Upcoming",
              isOrangeBadge: true,
              showAssigned: true),
        ],
      );
    } else {
      return Column(
        children: [
          _buildJobCard(
              title: "Electrical Engineer",
              subtitle: "Coffee, Dubai",
              badgeText: "Completed",
              isGreyBadge: true,
              showAssigned: true,
              showFeedbackButton: true),
          _buildJobCard(
              title: "Car Mechanic",
              subtitle: "Porsche, Dubai",
              badgeText: "Completed",
              isGreyBadge: true,
              showAssigned: true,
              showRating: true),
        ],
      );
    }
  }

  Widget _buildJobCard({
    required String title,
    required String subtitle,
    required String badgeText,
    bool isBlueBadge = false,
    bool isGreenBadge = false,
    bool isOrangeBadge = false,
    bool isGreyBadge = false,
    bool showAssigned = false,
    bool showFeedbackButton = false,
    bool showRating = false,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColor.border.withOpacity(0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row 1: Image, Title, Badge
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.asset(Assets.imagesCoffeeshop,
                    height: 45.r, width: 45.r, fit: BoxFit.cover),
              ),
              12.widthSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: FontHelper.f14w500MediumStyle.copyWith(
                            fontWeight: FontWeight.bold, color: AppColor.dark)),
                    Text(subtitle,
                        style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
                  ],
                ),
              ),
              _buildBadge(badgeText, isBlueBadge, isGreenBadge, isOrangeBadge,
                  isGreyBadge),
            ],
          ),
          12.heightSpace,

          Row(
            children: [
              _infoItem(Assets.iconsDollar, "\$ 25/hr"),
              12.widthSpace,
              _infoItem(Assets.iconsBlueCalender, "18 Dec"),
              12.widthSpace,
              _infoItem(Assets.iconsJobsTime, "7:00 AM - 3:00 PM"),
            ],
          ),

          if (showAssigned) ...[
            12.heightSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Assigned to",
                  style: FontHelper.f12w500MediumStyle.copyWith(
                    color: AppColor.dark,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward, size: 14, color: Colors.grey),
                const Spacer(),
                ClipOval(
                    child: Image.asset(Assets.imagesHomeprofile,
                        height: 24.r, width: 24.r)),
                8.widthSpace,
                Text(
                  "John Doe",
                  style: FontHelper.f12w500MediumStyle.copyWith(
                    color: AppColor.black,
                  ),
                ),
              ],
            ),
          ],

          if (showFeedbackButton) ...[
            15.heightSpace,
            Container(
              width: double.infinity,
              height: 40.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: AppColor.primary),
              ),
              child: const Center(
                  child: Text("Give Feedback",
                      style: TextStyle(
                          color: AppColor.primary,
                          fontWeight: FontWeight.w600))),
            ),
          ],

          if (showRating) ...[
            15.heightSpace,
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                  color: const Color(0xffF8F9FA),
                  borderRadius: BorderRadius.circular(12.r)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your Feedback",
                        style: FontHelper.f12w500MediumStyle.copyWith(
                            color: AppColor.dark, fontWeight: FontWeight.w600),
                      ),
                      Row(children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        Text(" 5.0", style: TextStyle(fontSize: 12.sp))
                      ]),
                    ],
                  ),
                  4.heightSpace,
                  Text(
                    "Lorem ipsum is simply dummy text of the printing and typesetting industry.",
                    style: FontHelper.f12w500MediumStyle.copyWith(
                        color: AppColor.dark,
                        fontWeight: FontWeight.w400,
                        fontSize: 11.sp),
                  )
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildBadge(
      String text, bool isBlue, bool isGreen, bool isOrange, bool isGrey) {
    Color bgColor = isBlue
        ? const Color(0xffE6F0FF)
        : isGreen
            ? const Color(0xffE7F8F1)
            : isOrange
                ? const Color(0xffFFF4EC)
                : const Color(0xffF2F2F2);
    Color txtColor = isBlue
        ? AppColor.primary
        : isGreen
            ? Colors.green
            : isOrange
                ? Colors.orange
                : Colors.grey;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(20.r)),
      child: Text(text,
          style: TextStyle(
              color: txtColor, fontSize: 11.sp, fontWeight: FontWeight.w500)),
    );
  }

  Widget _infoItem(String icon, String text) {
    return Row(
      children: [
        Image.asset(icon, width: 14.r, height: 14.r, color: AppColor.primary),
        4.widthSpace,
        Text(text, style: TextStyle(fontSize: 11.sp, color: AppColor.tertiary)),
      ],
    );
  }

  Widget _buildCustomTabBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18.w),
      padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30.r)),
      child: Row(
        children: [
          _tabItem("Posted", 0),
          _tabItem("Active", 1),
          _tabItem("Closed", 2),
        ],
      ),
    );
  }

  Widget _tabItem(String title, int index) {
    bool isSelected = selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedTab = index),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
              color: isSelected ? AppColor.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(30.r)),
          child: Center(
            child: Text(title,
                style: TextStyle(
                    color: isSelected ? Colors.white : Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 13.sp)),
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationIcon() {
    return GestureDetector(
      onTap: () {
        Get.to(() => const NotificationsView());
      },
      child: Container(
        height: 48.h,
        width: 48.w,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColor.border)),
        child: Center(
            child: Image.asset(Assets.iconsNotificationnew, height: 22.h)),
      ),
    );
  }
}
