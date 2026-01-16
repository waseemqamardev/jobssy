import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/wallet/invoice_details_view.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/primary_button.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';

class ProjectOverviewView extends StatelessWidget {
  const ProjectOverviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 100.h,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Project Overview",
          style: FontHelper.f24w500MediumStyle.copyWith(
            color: AppColor.black,
            fontWeight: FontWeight.w700,
            fontSize: 26.sp,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              color: AppColor.border,
              thickness: 1,
            ),
            15.heightSpace,
            Text(
              "About Seller",
              style: FontHelper.f14w400Regular
                  .copyWith(fontWeight: FontWeight.w700, color: AppColor.black),
            ),
            18.heightSpace,
            Row(
              children: [
                CircleAvatar(
                  radius: 15.r,
                  backgroundImage: const AssetImage(Assets.imagesPerson),
                ),
                10.widthSpace,
                Text(
                  "Jessica Malan",
                  style:
                      FontHelper.f14w400Regular.copyWith(color: AppColor.black),
                ),
                5.widthSpace,
                const Icon(Icons.star, color: Colors.amber, size: 14),
                Text(
                  " 4.95 (22)",
                  style: FontHelper.f14w400Regular
                      .copyWith(color: AppColor.black, fontSize: 10.sp),
                ),
              ],
            ),
            15.heightSpace,
            _buildDetailRow("Service Charges", "10\$/hr", isBold: false),

            const Divider(thickness: 1,color: AppColor.border,),
            30.heightSpace,
            Text(
              "Additional Details",
              style: FontHelper.f14w400Regular
                  .copyWith(color: AppColor.black, fontWeight: FontWeight.w700),
            ),
            20.heightSpace,
            _buildDetailRow("Total Time", "8 hours"),
            _buildDetailRow("Total Hours", "180"),
            _buildDetailRow("Job Payment", "+900 \$"),
            _buildDetailRow("Platform fee", "+40 \$"),

            15.heightSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Payable Amount ",
                  style: FontHelper.f14w400Regular
                      .copyWith(color: AppColor.black, fontWeight: FontWeight.w700),
                ),
                Text(
                  "940\$",
                  style: FontHelper.f14w400Regular
                      .copyWith(color: AppColor.black, fontWeight: FontWeight.w700),
                ),
              ],
            ),

            15.heightSpace,
            // Disclaimer Text
            Text(
              "*This amount will be transferred to employee after job is completed",
              style: FontHelper.f12w500MediumStyle
                  .copyWith(color: AppColor.black, ),
            ),

            const Spacer(),

            PrimaryButton(
              height: 48.h,
              onTap: () {
                Get.offAll(() => const InvoiceDetailsView());

              },
              childWidget: Text(
                "Continue to payment",
                style: FontHelper.f16w500MediumStyle.copyWith(
                    fontWeight: FontWeight.w600, color: AppColor.white),
              ),
              bgColor: AppColor.primary,
              borderRadius: 11.85.r,
              width: double.infinity,
            ),
            40.heightSpace,
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: FontHelper.f14w400Regular
                .copyWith(color: AppColor.black, ),
          ),
          Text(
            value,
            style:FontHelper.f14w400Regular
                .copyWith(color: AppColor.black, ),
          ),
        ],
      ),
    );
  }
}
