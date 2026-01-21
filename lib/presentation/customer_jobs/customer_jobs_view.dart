import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobssy/presentation/customer_jobs/proposal_view.dart';
import 'package:jobssy/presentation/customer_jobs/proposals_list_view.dart';
import 'package:jobssy/presentation/jobs/warehouse_associate_view.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/primary_button.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';
import 'package:get/get.dart';

class CustomerJobsView extends StatefulWidget {
  const CustomerJobsView({super.key});

  @override
  State<CustomerJobsView> createState() => _CustomerJobsViewState();
}

class _CustomerJobsViewState extends State<CustomerJobsView> {
  int selectedTab = 0; // 0 for Recent, 1 for In Progress

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
                itemBuilder: (context, index) =>
                    GestureDetector(
                        onTap: (){
                          Get.to(() => ProposalsListView());
                        },
                        child: _buildJobPostCard("Barista", "21 days")),

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
          _tabButton("Recent Jobs (2)", 0),
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

  Widget _buildJobPostCard(String role, String days) {
    bool isInProgress = selectedTab == 1;

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
                  child: Text("1 day",
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
          15.heightSpace,
          Divider(color: AppColor.border,),
          12.heightSpace,
          Row(
            children: [
              Expanded(
                child: _actionButton(
                  "View Proposal",
                  AppColor.primary,
                  AppColor.white,
                      () {
                        Get.to(() =>ProposalView());},
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
