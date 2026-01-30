import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/configs/colors/app_colors.dart';
import '../../../core/configs/font_style.dart';
import '../../../core/global_components/primary_button.dart';
import '../../../core/utils/extensions.dart';
import '../../../generated/assets.dart';
import '../customer_bottom_nav/customer_bottomnav.dart';
import '../wallet/invoice_details_view.dart';

class JobSummaryView extends StatelessWidget {
  const JobSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              30.heightSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCircleButton(
                      Icons.arrow_back_ios_new, () => Get.back()),
                  Text("Summary",
                      style: FontHelper.f16BoldStyle.copyWith(
                          color: AppColor.dark, fontWeight: FontWeight.w700)),
                  _buildCircleButton(Icons.more_vert, () {}),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      24.heightSpace,
                      Text(
                        "About Seller",
                        style: FontHelper.f14w500MediumStyle.copyWith(
                            color: AppColor.dark, fontWeight: FontWeight.w700),
                      ),
                      16.heightSpace,
                      Row(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              Assets.imagesPerson,
                              height: 40.r,
                              width: 40.r,
                              fit: BoxFit.cover,
                            ),
                          ),
                          6.widthSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("John Doe",
                                  style: FontHelper.f13w400Regular.copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: AppColor.dark)),
                              Row(
                                children: [
                                  Icon(Icons.star,
                                      color: Colors.amber, size: 16.sp),
                                  2.widthSpace,
                                  Text("4.9 (37)",
                                      style: FontHelper.f14w400Regular
                                          .copyWith(color: AppColor.tertiary)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      30.heightSpace,
                      Text(
                        "Additional Details",
                        style: FontHelper.f14w500MediumStyle.copyWith(
                            color: AppColor.dark, fontWeight: FontWeight.w700),
                      ),
                      20.heightSpace,
                      _buildSummaryRow("Total Time", "4 hours"),
                      14.heightSpace,
                      _buildSummaryRow("Hourly Rate", "\$30/hr"),
                      14.heightSpace,
                      _buildSummaryRow("Total Payment", "\$120.00"),
                      14.heightSpace,
                      _buildSummaryRow("Platform Fee", "\$3.00"),
                      16.heightSpace,
                      const Divider(color: AppColor.border),
                      16.heightSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Payable Amount",
                              style: FontHelper.f15w400Regular.copyWith(
                                  color: AppColor.dark,
                                  fontWeight: FontWeight.w700)),
                          Text("\$123.00",
                              style: FontHelper.f15w400Regular.copyWith(
                                  color: AppColor.dark,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                      16.heightSpace,
                      Text(
                          "*This amount will be transferred to employee after job is completed and approved by you, till then it will be in escrow.",
                          style: FontHelper.f12w500MediumStyle.copyWith(
                              color: AppColor.tertiary,
                              fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
              ),
              PrimaryButton(
                onTap: () {
                  _showSuccessDialog(context);
                },
                height: 48.h,
                width: double.infinity,
                bgColor: AppColor.primary,
                borderRadius: 12.r,
                childWidget: Text(
                  "Accept & Continue to Payment",
                  style: FontHelper.f14w500MediumStyle.copyWith(
                      color: AppColor.white, fontWeight: FontWeight.w600),
                ),
              ),
              20.heightSpace,
            ],
          ),
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

    // ⏳ Delay then navigate
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context); // Close dialog
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => InvoiceDetailsView(), // your next screen
        ),
      );
    });
  }

  Widget _buildSummaryRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: FontHelper.f13w400Regular.copyWith(color: AppColor.dark)),
        Text(value,
            style: FontHelper.f14w500MediumStyle
                .copyWith(color: AppColor.dark, fontWeight: FontWeight.w600)),
      ],
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
