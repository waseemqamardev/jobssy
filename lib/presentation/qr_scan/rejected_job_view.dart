import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/configs/colors/app_colors.dart';
import '../../../core/configs/font_style.dart';
import '../../../core/global_components/primary_button.dart';
import '../../../core/utils/extensions.dart';
import '../../generated/assets.dart';

class RejectedJobView extends StatelessWidget {
  const RejectedJobView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            20.heightSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: _buildCircleButton(
                        Icons.arrow_back_ios_new, () => Get.back()),
                  ),
                  Text(
                    "Rejected",
                    style: FontHelper.f16BoldStyle.copyWith(
                      color: AppColor.dark,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.heightSpace,
                    Text(
                      "How would you rate John Doe?",
                      style: FontHelper.f14w500MediumStyle.copyWith(
                        color: AppColor.dark,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    15.heightSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          5,
                          (index) => Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                child: Image.asset(
                                  Assets.iconsStar,
                                  width: 24.w,
                                  height: 24.h,
                                ),
                              )),
                    ),
                    25.heightSpace,
                    Text(
                      "Reason for rejecting this job",
                      style: FontHelper.f14w500MediumStyle.copyWith(
                        color: AppColor.dark,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    10.heightSpace,
                    _buildCheckboxRow("Didn't complete his work", true),
                    _buildCheckboxRow("Rude behavior", false),
                    _buildCheckboxRow("Not the same person as on app", false),
                    _buildCheckboxRow("Didn't finish work as commited", false),
                    20.heightSpace,
                    Text(
                      "Write something for John Doe",
                      style: FontHelper.f14w500MediumStyle.copyWith(
                        color: AppColor.dark,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    12.heightSpace,
                    Container(
                      padding: EdgeInsets.all(15.r),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(15.r),
                        border:
                            Border.all(color: AppColor.border.withOpacity(0.5)),
                      ),
                      child: TextField(
                        maxLines: 2,
                        decoration: InputDecoration(
                          hintText: "Lorem Ipsum",
                          hintStyle: TextStyle(
                              color: Colors.grey.shade400, fontSize: 13.sp),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    20.heightSpace,
                    Text(
                      "Upload any documents supporting your claims",
                      style: FontHelper.f14w500MediumStyle.copyWith(
                        color: AppColor.dark,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    10.heightSpace,
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 30.h),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(12.r),
                        border:
                            Border.all(color: AppColor.border.withOpacity(0.5)),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            Assets.iconsUpload,
                            width: 15.w,
                            height: 15.h,
                          ),
                          12.heightSpace,
                          Text(
                            "Upload images /documents /reports",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ),
                    50.heightSpace,
                    PrimaryButton(
                      onTap: () {},
                      height: 48.h,
                      width: double.infinity,
                      bgColor: AppColor.primary,
                      borderRadius: 12.r,
                      childWidget: Text(
                        "Submit",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp),
                      ),
                    ),
                    20.heightSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckboxRow(String title, bool value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        children: [
          Text(title,
              style: TextStyle(color: Colors.grey.shade700, fontSize: 13.sp)),
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
