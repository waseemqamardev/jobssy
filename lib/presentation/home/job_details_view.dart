import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/home/job_application_view.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/primary_button.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';

class JobDetailsView extends StatelessWidget {
  const JobDetailsView({super.key});

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
                        Assets.imagesCycle,
                        width: double.infinity,
                        height: 250.h,
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
                    20.heightSpace,
                    Text("Short Description",
                        style: FontHelper.f13w400Regular.copyWith(color: AppColor.dark)),
                    5.heightSpace,
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's...",
                        style: FontHelper.f12w500MediumStyle.copyWith(color: AppColor.dark,fontWeight: FontWeight.w400)),
                    25.heightSpace,
                    // 6. Info List
                    _buildInfoRow("Role", "Mechanic"),
                    _buildInfoRow("Pay", "\$30/hr"),
                    _buildInfoRow("Time", "Part-Time"),
                    _buildInfoRow(
                        "Business/ Location", "Mevrick's Residence, Dubai"),
                    _buildInfoRow("Distance", "1.2 mi"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: PrimaryButton(
                height: 48.h,
                onTap: () {
                  Get.to(JobApplicationView());

                },
                childWidget: Text(
                  "Apply Now",
                  style: FontHelper.f14w500MediumStyle.copyWith(
                      fontWeight: FontWeight.w600, color: AppColor.white),
                ),
                bgColor: AppColor.btnBlue,
                borderRadius: 12.r,
                width: double.infinity,
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
