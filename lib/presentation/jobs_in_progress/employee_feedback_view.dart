import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/jobs_in_progress/job_successfully_completed_view.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/primary_button.dart';
import '../../core/utils/extensions.dart';

class EmployeeFeedbackView extends StatefulWidget {
  const EmployeeFeedbackView({super.key});

  @override
  State<EmployeeFeedbackView> createState() => _EmployeeFeedbackViewState();
}

class _EmployeeFeedbackViewState extends State<EmployeeFeedbackView> {
  final List<String> tags = [
    "ON-TIME",
    "PROBLEM SOLVER",
    "HELPFUL",
    "CONVENIENT",
    "FRIENDLY"
  ];
  String selectedTag = "HELPFUL";

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
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              color: AppColor.border,
              thickness: 1,
            ),
            20.heightSpace,
            Center(
              child: Text(
                "You have marked your project as completed.",
                style:
                    FontHelper.f14w400Regular.copyWith(color: AppColor.black),
              ),
            ),
            15.heightSpace,

            Text(
              "How would you rate Ali?",
              style: FontHelper.f14w400Regular
                  .copyWith(color: AppColor.black, fontWeight: FontWeight.w700),
            ),
            7.5.heightSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Icon(
                  index < 2 ? Icons.star : Icons.star_border, // 2 stars filled
                  color: index < 2 ? Colors.amber : Colors.grey.shade400,
                  size: 40.sp,
                );
              }),
            ),
            30.heightSpace,

            // Tags Section
            Text(
              "What did you like about it?",
              style: FontHelper.f14w400Regular
                  .copyWith(color: AppColor.black, fontWeight: FontWeight.w700),
            ),
            15.heightSpace,
            Wrap(
              spacing: 10.w,
              runSpacing: 10.h,
              children: tags.map((tag) => _buildTag(tag)).toList(),
            ),
            30.heightSpace,
            Text(
              "Anything else?",
              style: FontHelper.f14w400Regular
                  .copyWith(color: AppColor.black, fontWeight: FontWeight.w700),
            ),
            10.heightSpace,
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: "Hello! loreum ipsum loreum ipsum loreum ipsum...",
                hintStyle:
                    TextStyle(color: AppColor.lightGrey, fontSize: 13.sp),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(color: AppColor.border),
                ),
              ),
            ),
            120.heightSpace,
            PrimaryButton(
              onTap: () {
                Get.to(JobSuccessfullyCompleteView);
              },
              height: 48.h,
              width: double.infinity,
              bgColor: AppColor.primary,
              borderRadius: 10.r,
              childWidget: Text(
                "Complete & Pay",
                style:
                FontHelper.f15w600SemiBold.copyWith(color: AppColor.white),
              ),
            ),
            20.heightSpace,
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String label) {
    bool isSelected = label == "HELPFUL" || label == "CONVENIENT";
    return GestureDetector(
      onTap: () => setState(() => selectedTag = label),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primary : AppColor.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
              color: isSelected ? AppColor.primary : AppColor.lightGrey),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? AppColor.white : AppColor.black,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
