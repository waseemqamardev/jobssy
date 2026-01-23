import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/customer_jobs/job_summary_view.dart';
import '../../../core/configs/colors/app_colors.dart';
import '../../../core/configs/font_style.dart';
import '../../../core/utils/extensions.dart';
import '../../../generated/assets.dart';

class AllReviewsView extends StatelessWidget {
  const AllReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.heightSpace,
              Row(
                children: [
                  _buildCircleButton(
                      Icons.arrow_back_ios_new, () => Get.back()),
                  const Spacer(),
                  Text(
                    "All Reviews",
                    style: FontHelper.f16BoldStyle.copyWith(
                      color: AppColor.dark,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(width: 44.w),
                ],
              ),
              24.heightSpace,
              Text(
                "All Reviews",
                style: FontHelper.f14w500MediumStyle.copyWith(
                    color: AppColor.dark, fontWeight: FontWeight.w700),
              ),
              10.heightSpace,
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    Get.to(JobSummaryView());
                  },
                  child: ListView.separated(
                    itemCount: 4,
                    separatorBuilder: (context, index) => 10.heightSpace,
                    itemBuilder: (context, index) {
                      return _buildReviewCard();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReviewCard() {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.asset(
                  Assets.imagesCoffeeshop,
                  height: 24.r,
                  width: 24.r,
                  fit: BoxFit.cover,
                ),
              ),
              8.widthSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Electrical Engineer",
                      style: FontHelper.f13w400Regular.copyWith(
                        color: AppColor.dark,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "2 days ago",
                style: FontHelper.f12w400Regular.copyWith(
                  color: AppColor.tertiary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          8.heightSpace,
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 16.sp),
              2.widthSpace,
              Text("5.0",
                  style: FontHelper.f14w400Regular
                      .copyWith(color: AppColor.tertiary)),
              15.widthSpace,
              Image.asset(
                Assets.iconsDollar,
                width: 15.w,
                height: 15.h,
              ),
              5.widthSpace,
              Text("25/hour",
                  style: FontHelper.f14w400Regular
                      .copyWith(color: AppColor.tertiary)),
            ],
          ),
          8.heightSpace,
          Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industr...",
            style: FontHelper.f12w400Regular.copyWith(
              color: AppColor.dark,
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
        height: 44.h,
        width: 44.w,
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
