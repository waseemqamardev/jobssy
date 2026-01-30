import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/notifications/notifications_view.dart';
import 'package:jobssy/presentation/wallet/invoice_details_view.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/customfield_component.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';
import '../home/search_jobs_view.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.heightSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Wallet",
                      style: FontHelper.f20BoldStyle.copyWith(
                          color: AppColor.dark, fontWeight: FontWeight.w700)),
                  _buildNotificationIcon(),
                ],
              ),
              20.heightSpace,
              CustomFieldComponents(
                borderColor: AppColor.border,
                controller: TextEditingController(),
                hintText: "Search Receipts",
                height: 48.h,
                prefixIconWidget: Image.asset(Assets.iconsHomesearch,
                    height: 20.h, width: 20.w),
                onTap: () => Get.to(() => const SearchJobsView()),
              ),
              24.heightSpace,
              Text("Receipts",
                  style: FontHelper.f16BoldStyle.copyWith(
                      color: AppColor.dark, fontWeight: FontWeight.w600)),
              10.heightSpace,
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    Get.to(()=>const InvoiceDetailsView());
                  },
                  child: ListView(
                    children: [
                      _buildReceiptCard(
                        title: "Electrical Engineer",
                        date: "18 Dec",
                        time: "7:00 AM - 3:00 PM",
                        amount: "\$1,250.00",
                        status: "Complete",
                        badgeColor: const Color(0xffE8F5E9),
                        textColor: Colors.green,
                        showDownload: true,
                      ),
                      _buildReceiptCard(
                        title: "Car Mechanic",
                        date: "18 Dec",
                        time: "7:00 AM - 3:00 PM",
                        amount: "\$720.00",
                        status: "Pending",
                        badgeColor: const Color(0xffFFF3E0),
                        textColor: Colors.orange,
                        showDownload: false,
                      ),
                      _buildReceiptCard(
                        title: "Decor & Lights",
                        date: "18 Dec",
                        time: "7:00 AM - 3:00 PM",
                        amount: "\$720.00",
                        status: "Declined",
                        badgeColor: const Color(0xffFFEBEE),
                        textColor: Colors.red,
                        showDownload: false,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReceiptCard({
    required String title,
    required String date,
    required String time,
    required String amount,
    required String status,
    required Color badgeColor,
    required Color textColor,
    bool showDownload = false,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppColor.border),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.asset(Assets.imagesCoffeeshop,
                    width: 45.w, height: 45.h, fit: BoxFit.cover),
              ),
              12.widthSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(title,
                            style: FontHelper.f16BoldStyle
                                .copyWith(color: AppColor.dark,fontWeight: FontWeight.w600)),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: badgeColor,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Text(status,
                              style: TextStyle(
                                  color: textColor,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    5.heightSpace,
                    Row(
                      children: [
                        Image.asset(
                          Assets.iconsBlueCalender,
                          width: 14.w,
                          height: 14.h,
                          color: AppColor.primary,
                        ),
                        4.widthSpace,
                        Text(date,
                            style: FontHelper.f12w500MediumStyle
                                .copyWith(color: AppColor.tertiary)),
                        12.widthSpace,
                        Icon(Icons.access_time,
                            color: AppColor.primary, size: 14.sp),
                        4.widthSpace,
                        Text(time,
                            style: FontHelper.f12w500MediumStyle
                                .copyWith(color: AppColor.tertiary)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          15.heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(amount,
                  style: FontHelper.f18BoldStyle.copyWith(
                      color: AppColor.dark, fontWeight: FontWeight.w700)),
              Row(
                children: [
                  _buildIconButton(Assets.iconsWalletEye),
                  if (showDownload) ...[
                    8.widthSpace,
                    _buildIconButton(Assets.iconsWalletDownload),
                  ],
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(String assetPath) {
    return Container(
      height: 36.r,
      width: 36.r,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColor.border),
      ),
      child: Center(
          child: Image.asset(
        assetPath,
        width: 20.w,
        height: 20.h,
        color: AppColor.primary,
      )),
    );
  }

  Widget _buildNotificationIcon() {
    return GestureDetector(
      onTap: (){
        Get.to(NotificationsView());
      },
      child: Container(
        height: 48.h,
        width: 48.w,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColor.border),
        ),
        child: Center(
            child: Image.asset(Assets.iconsNotificationnew,
                height: 22.h, width: 22.w)),
      ),
    );
  }
}
