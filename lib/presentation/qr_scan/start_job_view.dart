import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/primary_button.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';

class StartJobView extends StatelessWidget {
  final bool isInProgress;

  const StartJobView({super.key, this.isInProgress = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
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
          "Start Job",
          style: FontHelper.f24w500MediumStyle.copyWith(
            color: AppColor.black,
            fontWeight: FontWeight.w700,
            fontSize: 26.sp,
          ),
        ),
      ),
      body: Column(
        children: [
          const Divider(color: AppColor.border, thickness: 1),
          15.heightSpace,
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _infoRow(Assets.iconsJobsBuilding, "QuickShip Logistics"),
                  7.5.heightSpace,
                  _infoRow(Assets.iconsJobsTime,
                      "Nov 25, 2025 at 9:00 AM - 5:00 PM"),
                  7.5.heightSpace,
                  _infoRow(Assets.iconsJobsLocation,
                      "123 Industrial Blvd, Austin, TX"),
                  15.heightSpace,
                  Row(
                    children: [
                      Text(
                        "Status:  ",
                        style: FontHelper.f16w500MediumStyle.copyWith(
                          color: AppColor.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      _statusBadge(isInProgress ? "In Progress" : "Upcoming"),
                    ],
                  ),
                  31.heightSpace,
                  Center(child: _buildQRCodeContainer()),
                  30.heightSpace,
                  Center(
                    child: Text(
                      isInProgress
                          ? "Job QR Code ID: job-001"
                          : "The code is to be scanned by the employer",
                      style: FontHelper.f16w500MediumStyle.copyWith(
                        color: AppColor.tertiary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  40.heightSpace,
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: PrimaryButton(
              onTap: () {},
              width: double.infinity,
              height: 55.h,
              bgColor: AppColor.primary,
              borderRadius: 12.r,
              childWidget: Text(
                "Submit & Complete Job",
                style:
                    FontHelper.f15w600SemiBold.copyWith(color: AppColor.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(String assetPath, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(assetPath, width: 15.w, height: 15.h, fit: BoxFit.contain),
        7.widthSpace,
        Text(text,
            style: FontHelper.f14w400Regular.copyWith(color: AppColor.black)),
      ],
    );
  }

  Widget _statusBadge(String text) {
    bool isYellow = text == "In Progress";
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: isYellow ? const Color(0xFFFFF8E1) : AppColor.border,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(
        text,
        style: FontHelper.f12w500MediumStyle.copyWith(
          color: AppColor.black,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildQRCodeContainer() {
    return Container(
      width: 300.w,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColor.border,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.qr_code_scanner, size: 18.sp),
              4.widthSpace,
              Text(
                "Job QR Code",
                style: FontHelper.f16w500MediumStyle.copyWith(
                    color: AppColor.black, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          15.heightSpace,
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Image.asset(
              Assets.imagesQr,
              width: 279.w,
              height: 231.w,
            ),
          ),
          if (!isInProgress) ...[
            15.heightSpace,
            Text(
              "QR SCAN SUCCESSFUL",
              textAlign: TextAlign.center,
              style:
                  FontHelper.f15w400Regular.copyWith(color: AppColor.tertiary),
            ),
          ],
        ],
      ),
    );
  }
}
