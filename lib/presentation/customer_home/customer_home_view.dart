import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/customer_home/recent_employee_view.dart';
import 'package:jobssy/presentation/notifications/notifications_view.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';
import 'add_jobpost_view.dart';

class CustomerHomeView extends StatelessWidget {
  const CustomerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle("Recent Posts"),
                  10.heightSpace,
                  _buildJobPostCard("Barista", "21 days"),
                  _buildJobPostCard("Barista", "1 day"),
                  20.heightSpace,
                  _buildSectionTitle("Recent workers and Ratings"),
                  15.heightSpace,
                  GestureDetector(
                      onTap: (){
                        Get.to(RecentEmployeeView());
                      },
                      child: _buildWorkersList()),
                  130.heightSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Blue Curved Header
  Widget _buildHeader() {
    return Container(
      height: 249.h,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(20.w, 60.h, 20.w, 40.h),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.imagesBg),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Good Morning",
                style: FontHelper.f16BoldStyle.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColor.white,
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.to(AddJobPostView());

                    },
                    child: Image.asset(
                      Assets.iconsJobbIcon,
                      height: 24.h,
                    ),
                  ),
                  15.widthSpace,
                  GestureDetector(
                      onTap: (){
                        Get.to(NotificationsView());
                      },
                      child: Image.asset(Assets.iconsPnotifications, height: 24.h)),
                ],
              )
            ],
          ),
          5.heightSpace,
          Row(
            children: [
              Text("AB Traders",
                  style: FontHelper.f24w500MediumStyle.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 28.sp,
                      color: AppColor.white)),
              5.widthSpace,
              Image.asset(Assets.iconsVerificationBadget,
                  width: 16.w, height: 16.h),
            ],
          ),
          10.heightSpace,
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.white, size: 16),
              5.widthSpace,
              Text("Central park, DHA 2, Islamabad",
                  style: FontHelper.f14w400Regular
                      .copyWith(color: AppColor.white)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: FontHelper.f16BoldStyle
                .copyWith(color: AppColor.black, fontWeight: FontWeight.w700)),
        Text("View all",
            style: FontHelper.f12w500MediumStyle.copyWith(
                color: AppColor.primary, fontWeight: FontWeight.w400)),
      ],
    );
  }

  Widget _buildJobPostCard(String role, String days) {
    return Container(
      // height: 110.h,
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
              Text("Barista",
                  style: FontHelper.f18BoldStyle.copyWith(
                      fontWeight: FontWeight.w600, color: AppColor.black)),
              Container(
                  decoration: BoxDecoration(
                    color: AppColor.lightGrey,
                    borderRadius: BorderRadius.circular(7.5.r),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                  child: Text("21 days",
                      style: FontHelper.f12w500MediumStyle.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColor.primary))),
            ],
          ),
          4.heightSpace,
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Blue Bottle Coffee",
              style: FontHelper.f14w400Regular.copyWith(
                color: AppColor.tertiary,
              ),
            ),
          ),
          15.heightSpace,
          Row(
            children: [
              Image.asset(
                Assets.iconsDollar,
                width: 15.w,
                height: 15.h,
              ),
              5.widthSpace,
              Text("\$18/hour",
                  style: FontHelper.f14w400Regular
                      .copyWith(color: AppColor.tertiary)),
              const Spacer(),
              Image.asset(
                Assets.iconsJobsTime,
                width: 15.w,
                height: 15.h,
              ),
              Text(" 7:00 AM - 3:00 PM",
                  style: FontHelper.f14w400Regular
                      .copyWith(color: AppColor.tertiary))
            ],
          ),
          15.heightSpace,
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              5.widthSpace,
              Text("4.8 (124)",
                  style: FontHelper.f14w400Regular
                      .copyWith(color: AppColor.tertiary)),
              const Spacer(),
              Image.asset(
                Assets.iconsJobsLocation,
                width: 15.w,
                height: 15.h,
              ),
              Text(" 0.8 mi",
                  style: FontHelper.f14w400Regular
                      .copyWith(color: AppColor.tertiary))
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildWorkersList() {
    final workers = [
      {"name": "Abhinandan", "img": Assets.imagesPerson, "rating": "4.95"},
      {"name": "Asim", "img": Assets.imagesPerson, "rating": "4.95"},
      {"name": "Raheel", "img": Assets.imagesPerson, "rating": "4.95"},
    ];

    return SizedBox(
      height: 183.h,
      // width: 130.w,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: workers.length,
        itemBuilder: (context, index) {
          return Container(
            // width: 130.w,
            margin: EdgeInsets.only(right: 18.w),
            padding: EdgeInsets.all(15.w),
            decoration: BoxDecoration(
              border: Border.all(color:AppColor.border),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50.r,
                  backgroundImage:
                      AssetImage(workers[index]["img"]!), // Assets used
                ),
                10.heightSpace,
                Text(workers[index]["name"]!,
                    style:
                    FontHelper.f12w500MediumStyle.copyWith(
                        color: AppColor.black, fontWeight: FontWeight.w600)),
                5.heightSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.star, color: Color(0xffFDC700), size: 14),
                    Text(" ${workers[index]["rating"]}",
                        style: FontHelper.f12w500MediumStyle.copyWith(
                          fontSize: 10.sp,
                            color: AppColor.black, fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
