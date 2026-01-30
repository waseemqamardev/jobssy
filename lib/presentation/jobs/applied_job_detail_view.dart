import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/primary_button.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';

class AppliedJobDetailsView extends StatelessWidget {
  const AppliedJobDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCircleButton(
                      Icons.arrow_back_ios_new, () => Get.back()),
                  Text("Job Details",
                      style: FontHelper.f16BoldStyle.copyWith(
                          color: AppColor.dark, fontWeight: FontWeight.w600)),
                  _buildCircleButton(Icons.more_vert, () {}),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.heightSpace,
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Image.asset(
                        Assets.imagesCoffeeshop,
                        width: double.infinity,
                        height: 136.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    15.heightSpace,

                    Row(
                      children: [
                        Text("Sohrab", style: FontHelper.f20BoldStyle.copyWith(fontWeight: FontWeight.w700,color: AppColor.dark)),
                        5.widthSpace,
                        Image.asset(Assets.iconsVerificationBadget,width: 20.w,height: 20.h,)
                      ],
                    ),
                    25.heightSpace,
                    _buildInfoRow("Role", "Mechanic"),
                    _buildInfoRow("Pay", "\$30/hr"),
                    _buildInfoRow("Time", "Part-Time"),
                    _buildInfoRow(
                        "Business/ Location", "Mevrick's Residence, Dubai"),
                    _buildInfoRow("Distance", "1.2 mi"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Ratings",
                        style: FontHelper.f13w400Regular.copyWith(color: AppColor.dark)
                ),

                        Row(
                          children: [
                            ...List.generate(4, (index) => Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                              size: 22.sp,
                            )),
                            Icon(
                              Icons.star_outline_rounded,
                              color: Colors.grey.shade300,
                              size: 22.sp,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: PrimaryButton(
                height: 48.h,

                  onTap: () {
                    _showCancelRequestBottomSheet(context);
                  },

                childWidget: Text(
                  "Cancel Job Request",
                  style: FontHelper.f14w500MediumStyle.copyWith(
                      fontWeight: FontWeight.w600, color: AppColor.white),
                ),
                bgColor: AppColor.lightGrey,
                borderRadius: 12.r,
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCancelRequestBottomSheet(BuildContext context) {
    showModalBottomSheet(

      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(

          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFDAF0FF),
                Color(0xFFEEF9FF),
                Color(0xFFDFE0E2),
              ],
            ),
            borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                "Cancel Request",
                style: FontHelper.f14w400Regular.copyWith(
                  color: AppColor.dark,
                ),
              ),
              15.heightSpace,
              const Divider(color: AppColor.border, thickness: 1),
              15.heightSpace,

              // Label
              Text(
                "Reason for Cancellation",
                style: FontHelper.f13w400Regular.copyWith(color: AppColor.tertiary),
              ),
              10.heightSpace,

              Container(
                height: 120.h,
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: AppColor.border),
                ),
                child: TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Write reason here",
                    hintStyle: FontHelper.f15w400Regular.copyWith(color: AppColor.black),
                    border: InputBorder.none,
                  ),
                ),
              ),
              30.heightSpace,

              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      height: 48.h,
                      onTap: () => Get.back(),
                      childWidget: Text(
                        "No",
                        style: FontHelper.f14w500MediumStyle.copyWith(
                            color: AppColor.tertiary, fontWeight: FontWeight.w600),
                      ),
                      bgColor: AppColor.white,
                      borderRadius: 12.r,
                      width: double.infinity,
                    ),
                  ),
                  15.widthSpace,
                  // Confirm Button
                  Expanded(
                    child: PrimaryButton(
                      height: 48.h,
                      onTap: () {
                        // Cancellation logic here
                        Get.back();
                      },
                      childWidget: Text(
                        "Confirm",
                        style: FontHelper.f14w500MediumStyle.copyWith(
                            color: AppColor.white, fontWeight: FontWeight.w600),
                      ),
                      bgColor: AppColor.primary,
                      borderRadius: 12.r,
                      width: double.infinity,
                    ),
                  ),
                ],
              ),
              20.heightSpace,
            ],
          ),
        );
      },
    );
  }

  Widget _buildCircleButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44.r,
        width: 44.r,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColor.border),
        ),
        child: Icon(icon, size: 16.sp, color: AppColor.tertiary),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: FontHelper.f13w400Regular.copyWith(color: AppColor.dark)),
          Text(value,
              style: FontHelper.f14w500MediumStyle.copyWith(
                  color: AppColor.black, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
