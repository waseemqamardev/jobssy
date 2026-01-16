import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/jobs_in_progress/employee_feedback_view.dart';
import 'package:jobssy/presentation/jobs_in_progress/job_not_completed_view.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/primary_button.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';

class ProposalDetailView extends StatelessWidget {
  const ProposalDetailView({super.key});

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
          "Barista Cafe",
          style: FontHelper.f24w500MediumStyle.copyWith(
            color: AppColor.black,
            fontWeight: FontWeight.w700,
            fontSize: 26.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              color: AppColor.border,
              thickness: 1,
            ),
            15.heightSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Project Details",
                  style: FontHelper.f18BoldStyle.copyWith(
                      fontWeight: FontWeight.w700, color: AppColor.black),
                ),
                Icon(Icons.keyboard_arrow_up, size: 28.sp, color: Colors.black),
              ],
            ),
            10.heightSpace,

            // Role Title
            Text(
              "Waiter",
              style: FontHelper.f16BoldStyle
                  .copyWith(fontWeight: FontWeight.w700, color: AppColor.black),
            ),
            20.heightSpace,

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

            17.heightSpace,
            Row(
              children: [
                Image.asset(
                  Assets.iconsJobsLocation,
                  width: 15.w,
                  height: 15.h,
                ),
                5.widthSpace,
                Text("Central park, DHA 2, Islamabad",
                    style: FontHelper.f14w400Regular
                        .copyWith(color: AppColor.tertiary)),
                const Spacer(),
                Text("8 hours",
                    style: FontHelper.f14w400Regular
                        .copyWith(color: AppColor.tertiary))
              ],
            ),
            24.heightSpace,

            Text(
              "Job Detail",
              style: FontHelper.f16BoldStyle
                  .copyWith(color: AppColor.black, fontWeight: FontWeight.w700),
            ),
            12.heightSpace,
            Text(
              "I'm writing to express my interest in the STEM Enrichment Instructor position from August to October. With a background in [Your Field] and [X years] of experience teaching STEM subjects, I specialize in creating engaging, hands-on lessons that connect theory with real-world application. I'm comfortable with hybrid teaching models and have previously managed similar programs with success. The schedule and scope of this role align perfectly with my expertise, and I'm excited about the opportunity to support your students. Looking forward to the possibility of working together.",
              style: FontHelper.f14w400Regular.copyWith(
                color: AppColor.black,
              ),
            ),

            12.heightSpace,
            GestureDetector(
              onTap: () {},
              child: Text(
                "Terms and Conditions",
                style: FontHelper.f12w500MediumStyle.copyWith(
                    decoration: TextDecoration.underline,
                    color: AppColor.primary,
                    fontWeight: FontWeight.w400),
              ),
            ),
            20.heightSpace,
            PrimaryButton(
              onTap: () {
                Get.to(EmployeeFeedbackView());

              },
              height: 48.h,
              width: double.infinity,
              bgColor: AppColor.primary,
              borderRadius: 10.r,
              childWidget: Text(
                "Mark as Completed",
                style:
                    FontHelper.f15w600SemiBold.copyWith(color: AppColor.white),
              ),
            ),
            7.5.heightSpace,
            PrimaryButton(
              onTap: () {
                Get.to(JobNotCompletedView());
              },
              height: 48.h,
              width: double.infinity,
              bgColor: AppColor.white,
              borderColor: AppColor.primary,
              borderRadius: 10.r,
              childWidget: Text(
                "Job not Completed",
                style:
                FontHelper.f15w600SemiBold.copyWith(color: AppColor.primary),
              ),
            )
          ],
        ),
      ),
    );
  }
}
