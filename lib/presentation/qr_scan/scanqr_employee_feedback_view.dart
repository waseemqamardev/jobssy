import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/generated/assets.dart';
import 'package:jobssy/presentation/customer_bottom_nav/customer_bottomnav.dart';
import '../../../core/configs/colors/app_colors.dart';
import '../../../core/configs/font_style.dart';
import '../../../core/global_components/primary_button.dart';
import '../../../core/utils/extensions.dart';

class ScanQrEmployeeFeedbackView extends StatelessWidget {
  const ScanQrEmployeeFeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: _buildCircleButton(
                        Icons.arrow_back_ios_new, () =>

                        Get.to(CustomerBottomNav())),
                  ),
                  Text(
                    "Employee Feedback",
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
                    30.heightSpace,
                    Text(
                      "What did you like about it?",
                      style: FontHelper.f14w500MediumStyle.copyWith(
                        color: AppColor.dark,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    15.heightSpace,
                    Wrap(
                      spacing: 10.w,
                      runSpacing: 10.h,
                      children: [
                        _buildFeedbackTag("On-Time", isSelected: false),
                        _buildFeedbackTag("Convenient", isSelected: true),
                        _buildFeedbackTag("Helpful", isSelected: true),
                        _buildFeedbackTag("Friendly", isSelected: false),
                        _buildFeedbackTag("Problem Solver", isSelected: false),
                      ],
                    ),
                    24.heightSpace,
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
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: "Lorem Ipsum",
                          hintStyle: TextStyle(
                              color: Colors.grey.shade400, fontSize: 13.sp),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    160.heightSpace,
                    PrimaryButton(
                      onTap: () {_showSuccessDialog(context);},
                      height: 48.h,
                      width: double.infinity,
                      bgColor: AppColor.primary,
                      borderRadius: 12.r,
                      childWidget: Text(
                        "Submit Feedback",
                        style: FontHelper.f14w500MediumStyle.copyWith(
                          color: AppColor.white,
                          fontWeight: FontWeight.w600,
                        ),
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
  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: AppColor.white,
          insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  Assets.imagesSuccessdialog,
                  width: 170.w,
                  height: 180.h,
                  fit: BoxFit.contain,
                ),

              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildFeedbackTag(String label, {required bool isSelected}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: isSelected ? AppColor.primary : AppColor.white,
        borderRadius: BorderRadius.circular(8.r),
        border:
            Border.all(color: isSelected ? AppColor.primary : AppColor.border),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
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
