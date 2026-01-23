import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';

class InvoiceDetailsView extends StatelessWidget {
  const InvoiceDetailsView({super.key});

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
                      Icons.arrow_back_ios_new, () => Navigator.pop(context)),
                  Text(
                    "Invoice Details",
                    style: FontHelper.f16BoldStyle.copyWith(
                      color: AppColor.dark,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  _buildCircleButton(null, () {}, isDownload: true),
                ],
              ),
            ),
            10.heightSpace,
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    14.heightSpace,
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 25.h),
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
                          border: Border.all(color: AppColor.border)),
                      child: Column(
                        children: [
                          Text(
                            "Total Amount",
                            style: FontHelper.f14w500MediumStyle
                                .copyWith(color: AppColor.tertiary),
                          ),
                          10.heightSpace,
                          Text(
                            "\$ 1,250.00",
                            style: FontHelper.f24w500MediumStyle.copyWith(
                              fontSize: 28.sp,
                              color: AppColor.dark,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    30.heightSpace,
                    _buildDetailRow("Unique Invoice Number", "1234566789"),
                    _buildDetailRow("VAT Number", "1231231434"),
                    _buildDetailRow("Client", "John Doe"),
                    _buildDetailRow("Email", "john@gmail.com"),
                    _buildDetailRow("Invoice Date", "1 Dec 2025"),
                    14.heightSpace,
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                      style: FontHelper.f13w400Regular.copyWith(
                        color: AppColor.dark,
                        height: 1.5,
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

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: FontHelper.f13w400Regular.copyWith(color: AppColor.dark),
          ),
          Text(
            value,
            style: FontHelper.f14w500MediumStyle.copyWith(
              color: AppColor.dark,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircleButton(IconData? icon, VoidCallback onTap,
      {bool isDownload = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44.r,
        width: 44.r,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColor.border),
        ),
        child: Center(
          child: isDownload
              ? Icon(Icons.file_download_outlined,
                  size: 22.sp, color: AppColor.tertiary)
              : Icon(icon, size: 16.sp, color: AppColor.tertiary),
        ),
      ),
    );
  }
}
