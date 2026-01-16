import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobssy/core/global_components/custom_search_bar.dart';
import 'package:jobssy/core/global_components/customfield_component.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        toolbarHeight: 100.h,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,

        title:Column(
          children: [
            42.heightSpace,
            Text(
              "Wallet",
              style: FontHelper.f24w500MediumStyle.copyWith(
                  color: AppColor.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 26.sp
              ),
            ),
          ],
        )

      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              color: AppColor.border,
              thickness: 1,
            ),
            20.heightSpace,
            Text(
              "Receipts",
              style: FontHelper.f18BoldStyle.copyWith(
                  color: AppColor.black, fontWeight: FontWeight.w400),
            ),
            8.heightSpace,
            Text(
              "View and download your transaction receipts",
              style: FontHelper.f16BoldStyle.copyWith(
                color: AppColor.tertiary,
                fontWeight: FontWeight.w400,
              ),
            ),
            15.heightSpace,
            CustomFieldComponents(
              prefixIconWidget: Image.asset(
                Assets.iconsWalletsearch, width: 16.w, height: 16.h,),
              controller: TextEditingController(),
              hintText: "Search by job title or reciept number",
              hintStyle: FontHelper.f12w500MediumStyle.copyWith(
                color: AppColor.tertiary,
                fontWeight: FontWeight.w200,
              ),
              height: 40.h,
            ),
            25.heightSpace,
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) => _buildReceiptCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildReceiptCard() {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColor.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(Assets.iconsWallets, width: 47.w, height: 47.h,),
              12.widthSpace,
              Expanded(
                child: Text(
                  "Website Redesign Project",
                  style: FontHelper.f18BoldStyle.copyWith(
                      color: AppColor.black, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          12.heightSpace,
          Row(
            children: [
              Image.asset(
                Assets.iconsWalletCalender, width: 15.w, height: 15.h,),
              5.widthSpace,
              Text(
                "Nov 18, 2025",
                style: FontHelper.f14w400Regular.copyWith(
                  color: AppColor.tertiary,),
              ),
            ],
          ),
          8.heightSpace,
          Row(
            children: [
              Text(
                "RCP-2025-001234",
                style: FontHelper.f14w400Regular.copyWith(
                  color: AppColor.tertiary,),),
              12.widthSpace,
              _buildPaymentTag(),
            ],
          ),
          12.heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$1,250.00",
                style: FontHelper.f24w500MediumStyle.copyWith(
                    color: AppColor.black, fontWeight: FontWeight.w400),
              ),
              Row(
                children: [
                  _buildIconButton(Image.asset(Assets.iconsWalletDownload,width: 25.w,height: 25.h,)),
                  8.widthSpace,
                  _buildIconButton(Image.asset(Assets.iconsWalletEye,width: 25.w,height: 25.h,)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentTag() {
    return Container(
      width: 70.w,
      height: 22.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: AppColor.primary,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        "Payment",
        style: FontHelper.f12w500MediumStyle.copyWith(
            color: AppColor.white, fontWeight: FontWeight.w400),

      ),
    );
  }

  Widget _buildIconButton(Image image) {
    return Container(
      padding: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.border),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: image,
    );
  }
}