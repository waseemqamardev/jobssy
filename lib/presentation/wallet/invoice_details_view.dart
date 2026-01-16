import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/utils/extensions.dart';

class InvoiceDetailsView extends StatelessWidget {
  const InvoiceDetailsView({super.key});

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
          "Invoice Details",
          style: FontHelper.f24w500MediumStyle.copyWith(
            color: AppColor.black,
            fontWeight: FontWeight.w700,
            fontSize: 26.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              color: AppColor.border,
              thickness: 1,
            ),
            20.heightSpace,

            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 30.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  Text(
                    "Total Amount",
                    style:FontHelper.f16BoldStyle.copyWith(
                        color: AppColor.primary, fontWeight: FontWeight.w700),
                  ),
                  20.heightSpace,
                  Text(
                    "€1,800",
                    style:FontHelper.f24w500MediumStyle.copyWith(
                      fontSize: 27.sp,
                        color: AppColor.black, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            30.heightSpace,

            _buildDetailRow("Unique Invoice Number:", "12345678"),
            12.heightSpace,
            _buildDetailRow("VAT Number:", "1234 5678 9999"),
            25.heightSpace,

            _buildDetailRow("Client:", "John F kennedy"),
            12.heightSpace,
            _buildDetailRow("Email:", "john@gmail.com"),
            20.heightSpace,

            Text(
              "Transfer to your Easypaisa wallet and never do it again because you are beinmg tracked for the first and the laast time ,..but who know what gonna happen but you can still try to be at your bestb.",
              style: FontHelper.f14w400Regular.copyWith(
            color: AppColor.black,),
            ),
            30.heightSpace,

            _buildDateRow("Invoice Date", "1 March 2025"),
            7.heightSpace,
            _buildDateRow("Due Date", "30 March 2025"),
            15.heightSpace,
            const Divider(color: AppColor.border, thickness: 1),

          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return RichText(
      text: TextSpan(
        style: FontHelper.f16BoldStyle.copyWith(
            color: AppColor.black, fontWeight: FontWeight.w400),
        children: [
          TextSpan(
            text: "$label ",
            style: FontHelper.f18BoldStyle.copyWith(
                color: AppColor.black, fontWeight: FontWeight.w700),          ),
          TextSpan(text: value),
        ],
      ),
    );
  }

  Widget _buildDateRow(String label, String date) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: FontHelper.f16BoldStyle.copyWith(
              color: AppColor.black, fontWeight: FontWeight.w400),
        ),
        Text(
          date,
          style: FontHelper.f14w400Regular.copyWith(
              color: AppColor.black,),
        ),
      ],
    );
  }
}