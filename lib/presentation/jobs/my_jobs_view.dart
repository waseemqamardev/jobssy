import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/jobs/applied_job_detail_view.dart';
import 'package:jobssy/presentation/jobs/upcoming_job_detail_view.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';
import '../notifications/notifications_view.dart';
import 'ongoing_job_view.dart';

class MyJobsView extends StatefulWidget {
  const MyJobsView({super.key});

  @override
  State<MyJobsView> createState() => _MyJobsViewState();
}

class _MyJobsViewState extends State<MyJobsView> {
  int selectedTab = 0;

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Jobs",
                      style: FontHelper.f20BoldStyle
                          .copyWith(fontWeight: FontWeight.w700,color: AppColor.dark)),
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
              ),
            ),
            _buildCustomTabBar(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
                children: _getJobListByTab(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getJobListByTab() {
    if (selectedTab == 0) {
      return [
        _buildJobItem(
            statusBadge: "Ongoing",
            onTap: (){
              Get.to(()=>const OngoingJobDetailView());
            },
            badgeColor: const Color(0xffE8F5E9),
            textColor: Colors.green),
        _buildJobItem(
            statusBadge: "Upcoming",
            onTap: (){
              Get.to(()=>const UpcomingJobDetailView());
            },
            badgeColor: const Color(0xffFFF3E0),
            textColor: Colors.orange),
      ];
    }  else if (selectedTab == 1) {
      return [
        _buildJobItem(showHeart: true, isFavorite: false,onTap: (){
          Get.to(()=>const AppliedJobDetailsView());
        }),
        _buildJobItem(showHeart: true, isFavorite: false,onTap: (){
          Get.to(()=>const AppliedJobDetailsView());
        }),      ];
    }

    else {
      return [
        _buildJobItem(showHeart: true, isFavorite: true),
        _buildJobItem(showHeart: true, isFavorite: true),
      ];
    }
  }

  Widget _buildCustomTabBar() {
    return Container(

      margin: EdgeInsets.symmetric(horizontal: 18.w),
      padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        children: [
          _tabItem("Active", 0),
          _tabItem("Applied", 1),
          _tabItem("Saved", 2),
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
            color: isSelected ? AppColor.primary : AppColor.white,
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Center(
            child: Text(
              title,
              style: FontHelper.f14w500MediumStyle.copyWith(
                color: isSelected ? AppColor.white : AppColor.dark,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildJobItem({
    String? statusBadge,
    Color? badgeColor,
    Color? textColor,
    bool showHeart = false,
    bool isFavorite = false,
    VoidCallback? onTap,

  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(15.w),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: AppColor.border),
        ),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.asset(
                    Assets.imagesOnboard2,
                    height: 45.h,
                    width: 45.w,
                    fit: BoxFit.cover,
                  ),
                ),
                12.widthSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Electrical Engineer", style: FontHelper.f16BoldStyle),
                    Row(
                      children: [
                        Text(
                          "Coffee, Dubai  .",
                          style: FontHelper.f12w500MediumStyle
                              .copyWith(color: AppColor.tertiary),
                        ),
                        10.widthSpace,
                        Image.asset(
                          Assets.iconsJobcardmap,
                          height: 16.h,
                          width: 16.w,
                        ),
                        3.widthSpace,
                        Text(
                          " 0.8 mi",
                          style: FontHelper.f12w500MediumStyle
                              .copyWith(color: AppColor.tertiary),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                if (statusBadge != null)
                  Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: badgeColor,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text(
                      statusBadge,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                else if (showHeart)
                  Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color:
                    isFavorite ? Colors.red : Colors.grey.shade400,
                    size: 20,
                  ),
              ],
            ),
            15.heightSpace,
            Row(
              children: [
                Image.asset(
                  Assets.iconsDollar,
                  width: 15.w,
                  height: 15.h,
                  color: AppColor.primary,
                ),
                4.widthSpace,
                Text(
                  "25/hour",
                  style: FontHelper.f12w500MediumStyle
                      .copyWith(color: AppColor.tertiary),
                ),
                10.widthSpace,
                Image.asset(
                  Assets.iconsBlueCalender,
                  width: 15.w,
                  height: 15.h,
                ),
                Text(
                  " 18 Dec",
                  style: FontHelper.f12w500MediumStyle
                      .copyWith(color: AppColor.tertiary),
                ),
                10.widthSpace,
                Image.asset(
                  Assets.iconsJobsTime,
                  width: 15.w,
                  height: 15.h,
                  color: AppColor.primary,
                ),
                Text(
                  " 7:00 AM - 3:00 PM",
                  style: FontHelper.f12w500MediumStyle
                      .copyWith(color: AppColor.tertiary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
