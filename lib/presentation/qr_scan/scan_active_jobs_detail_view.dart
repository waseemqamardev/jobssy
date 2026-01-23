import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/customfield_component.dart';
import '../../core/global_components/primary_button.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';

class ScanActiveJobDetailView extends StatefulWidget {
  const ScanActiveJobDetailView({super.key});

  @override
  State<ScanActiveJobDetailView> createState() =>
      _ScanActiveJobDetailViewState();
}

class _ScanActiveJobDetailViewState extends State<ScanActiveJobDetailView> {
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
                            color: const Color(0xffE7F8F1),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Text("Ongoing",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    16.heightSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Assigned to",
                          style: FontHelper.f12w500MediumStyle.copyWith(
                            color: AppColor.dark,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward,
                            size: 14, color: Colors.grey),
                        const Spacer(),
                        ClipOval(
                            child: Image.asset(Assets.imagesHomeprofile,
                                height: 24.r, width: 24.r)),
                        8.widthSpace,
                        Text(
                          "John Doe",
                          style: FontHelper.f12w500MediumStyle.copyWith(
                            color: AppColor.black,
                          ),
                        ),
                      ],
                    ),
                    16.heightSpace,
                    _buildDetailRow(
                        Assets.iconsJobdetailsuitcase, "Electrical Engineer"),
                    _buildDetailRow(
                        Assets.iconsJobdetailloc, "123 Street, Lorem Ipsum"),
                    _buildDetailRow(Assets.iconsJobdetailbuilding, "Dubai"),
                    _buildDetailRow(Assets.iconsJobdetailpay, "\$30/hr"),
                    _buildDetailRow(Assets.iconsJobdetailcalender, "18 Dec"),
                    _buildDetailRow(
                        Assets.iconsJobdetailtime, "8:00 AM - 11:00 AM"),
                    16.heightSpace,
                    Text("Short Description",
                        style: FontHelper.f13w400Regular
                            .copyWith(color: AppColor.dark)),
                    5.heightSpace,
                    Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's...",
                        style: FontHelper.f12w500MediumStyle.copyWith(
                            color: AppColor.dark, fontWeight: FontWeight.w400)),

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
