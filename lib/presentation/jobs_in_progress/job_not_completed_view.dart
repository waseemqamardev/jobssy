import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/primary_button.dart';
import '../../core/utils/extensions.dart';

class JobNotCompletedView extends StatefulWidget {
  const JobNotCompletedView({super.key});

  @override
  State<JobNotCompletedView> createState() => _JobNotCompletedViewState();
}

class _JobNotCompletedViewState extends State<JobNotCompletedView> {
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
          "Job not Completed",
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
            25.heightSpace,
            _consentCheckbox("Didn’t Complete his work."),
            _consentCheckbox("Rude or Vulgar."),
            _consentCheckbox("Not the same person as on app"),
            _consentCheckbox("Didn’t finish work as commited."),
            25.heightSpace,
            Text(
              "Other",
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
            25.heightSpace,
            Text(
              "Upload any documents supporting your claims",
              style: FontHelper.f14w400Regular
                  .copyWith(color: AppColor.black, fontWeight: FontWeight.w700),
            ),
            14.heightSpace,
            Center(
                child: SizedBox(
                    width: 260.w,
                    child: _uploadBox(
                        "upload Images/ documents/reports"))),
            20.heightSpace,
            PrimaryButton(
              onTap: () {},
              height: 48.h,
              width: double.infinity,
              bgColor: AppColor.primary,
              borderRadius: 10.r,
              childWidget: Text(
                "Submit Report",
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

  Widget _consentCheckbox(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h), // checkbox rows ke beech space
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Transform.translate(
            offset: const Offset(0, -2), // checkbox thoda upar
            child: SizedBox(
              width: 24.w,
              height: 24.h,
              child: Checkbox(
                value: false,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
                onChanged: (_) {},
              ),
            ),
          ),
          10.widthSpace,
          Expanded(
            child: Text(
              text,
              style: FontHelper.f12w500MediumStyle.copyWith(
                color: AppColor.tertiary,
                fontWeight: FontWeight.w400,
              ),
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _uploadBox(String text) => Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: FontHelper.f12w500MediumStyle.copyWith(
                  color: AppColor.tertiary, fontWeight: FontWeight.w400),
            ),
            16.heightSpace,
            PrimaryButton(
              onTap: () {},
              height: 35.h,
              width: 120.w,
              borderColor: AppColor.primary,
              bgColor: AppColor.white,
              borderRadius: 10.r,
              childWidget:
                  Text("Upload +", style: TextStyle(color: AppColor.primary)),
            ),
          ],
        ),
      );
}
