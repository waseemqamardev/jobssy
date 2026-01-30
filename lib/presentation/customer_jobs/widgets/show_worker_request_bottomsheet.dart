import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/customer_jobs/all_reviews_view.dart';
import 'package:jobssy/presentation/customer_jobs/job_summary_view.dart';

import '../../../core/configs/colors/app_colors.dart';
import '../../../core/configs/font_style.dart';
import '../../../core/global_components/primary_button.dart';
import '../../../core/utils/extensions.dart';
import '../../../generated/assets.dart';

void showWorkerRequestBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFDAF0FF),
              Color(0xFFEEF9FF),
              Color(0xFFDFE0E2),
            ],
          ),
        ),

        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              15.heightSpace,
              Text(
                "View Request",
                style: FontHelper.f16BoldStyle
                    .copyWith(color: AppColor.dark, fontWeight: FontWeight.w600),
              ),
              12.heightSpace,
              const Divider(color: AppColor.border, thickness: 1),
              12.heightSpace,
              GestureDetector(
                onTap: (){
                  Get.to(AllReviewsView());
                },
                child: ClipOval(
                  child: Image.asset(
                    Assets.imagesPerson,
                    height: 72.r,
                    width: 72.r,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              6.heightSpace,
              Text(
                "John Doe",
                style: FontHelper.f13w400Regular
                    .copyWith(color: AppColor.dark, fontWeight: FontWeight.w700),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 18.sp),
                  Text(" 4.9 (37)",
                      style: FontHelper.f14w400Regular
                          .copyWith(color: AppColor.tertiary)),
                ],
              ),
              12.heightSpace,
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Profile Details",
                  style: FontHelper.f14w500MediumStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColor.dark,
                  ),
                ),
              ),
              10.heightSpace,
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                padding: EdgeInsets.all(18.r),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProfileRow("Full Name", "John Doe"),
                    12.heightSpace,
                    _buildProfileRow("Email", "john.doe@gmail.com"),
                    12.heightSpace,
                    _buildProfileRow("Phone Number", "+123 123 123 123"),
                    12.heightSpace,
                    _buildProfileRow("Gender", "Male"),
                    12.heightSpace,
                    _buildProfileRow(
                      "Nationality",
                      "United States",
                    ),
                  ],
                ),
              ),
              25.heightSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        onTap: () {},
                        bgColor: AppColor.red,
                        childWidget: Text("Reject",
                            style: FontHelper.f14w500MediumStyle.copyWith(
                                color: AppColor.white,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                    15.widthSpace,
                    Expanded(
                      child: PrimaryButton(
                        onTap: () {
                          Get.to(JobSummaryView());
                        },
                        bgColor: AppColor.primary,
                        childWidget: Text("Accept",
                            style: FontHelper.f14w500MediumStyle.copyWith(
                                color: AppColor.white,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ],
                ),
              ),
              40.heightSpace,
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildProfileRow(String label, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label,
          style: FontHelper.f13w400Regular.copyWith(color: AppColor.dark)),
      5.heightSpace,
      Text(value,
          style: FontHelper.f14w500MediumStyle
              .copyWith(color: AppColor.dark, fontWeight: FontWeight.w600)),
    ],
  );
}
