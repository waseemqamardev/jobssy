import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/primary_button.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';

class UpcomingJobDetailView extends StatelessWidget {
  const UpcomingJobDetailView({super.key});

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
                          color: AppColor.dark, fontWeight: FontWeight.w700)),
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
                    24.heightSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text("Coffee Shop",
                                style: FontHelper.f20BoldStyle.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.dark)),
                            5.widthSpace,
                            Image.asset(
                              Assets.iconsVerificationBadget,
                              width: 20.w,
                              height: 20.h,
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 6.h),
                          decoration: BoxDecoration(
                            color: const Color(0xffFFF3E0),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Text("Upcoming",
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    20.heightSpace,

                    _buildDetailRow(
                        Assets.iconsJobdetailsuitcase, "Electrical Engineer"),
                    _buildDetailRow(
                        Assets.iconsJobdetailloc, "123 Street, Lorem Ipsum"),
                    _buildDetailRow(Assets.iconsJobdetailbuilding, "Dubai"),
                    _buildDetailRow(Assets.iconsJobdetailpay, "\$30/hr"),
                    _buildDetailRow(Assets.iconsJobdetailcalender, "18 Dec"),
                    _buildDetailRow(
                        Assets.iconsJobdetailtime, "8:00 AM - 11:00 AM"),
                    _buildDetailRow(
                        Assets.iconsJobdetailcontact, "+1 (123) 456-7890"),

                    20.heightSpace,

                    Text("Enter OTP to get started",
                        style: FontHelper.f13w500MediumStyle
                            .copyWith(color: AppColor.dark)),
                    8.heightSpace,
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50.h,
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(color: AppColor.border),
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "4 digit code",
                                hintStyle: TextStyle(
                                    color: AppColor.tertiary, fontSize: 13.sp),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        15.widthSpace,
                        PrimaryButton(
                          height: 50.h,
                          width: 120.w,
                          onTap: () {},
                          childWidget: Text("Verify Code",
                               style: FontHelper.f13w500MediumStyle
                                  .copyWith(color: AppColor.white,fontWeight: FontWeight.w400)),
                          bgColor: AppColor.primary,
                          borderRadius: 12.r,
                        ),
                      ],
                    ),

                    20.heightSpace,
                     Center(
                        child:
                            Text("or", style: FontHelper.f14w400Regular
                                .copyWith(color: AppColor.tertiary,fontWeight: FontWeight.w400))),
                    20.heightSpace,

                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20.r),
                      decoration: BoxDecoration(

                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xffDAF0FF),
                            Color(0xffEEF9FF),
                            Color(0xffDFE0E2),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Column(
                        children: [
                          Text("Scan QR Code",
                              style: FontHelper.f20w500MediumStyle
                                  .copyWith(color: AppColor.dark,fontWeight: FontWeight.w600)),
                          15.heightSpace,
                          Image.asset(Assets.imagesJobdetailqr,
                              height: 150.r,
                              width: 150.r),
                          15.heightSpace,
                          Text(
                              "Ask your employer to scan this code to start the job",
                              textAlign: TextAlign.center,
                              style: FontHelper.f14w400Regular
                                  .copyWith(color: AppColor.dark)),
                        ],
                      ),
                    ),
                    30.heightSpace,
                  ],
                ),
              ),
            ),
          ],
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

  Widget _buildDetailRow(String iconAsset, String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: [
          Image.asset(iconAsset, height: 20.h, width: 20.r),
          6.widthSpace,
          Text(text,
              style: FontHelper.f12w500MediumStyle.copyWith(
                color: AppColor.dark,
              )),
        ],
      ),
    );
  }
}
