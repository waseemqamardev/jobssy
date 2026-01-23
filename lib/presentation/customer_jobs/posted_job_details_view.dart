import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/customer_jobs/widgets/show_worker_request_bottomsheet.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/primary_button.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';

class PostedJobDetailsView extends StatelessWidget {
  final bool hasRequests;
  const PostedJobDetailsView({super.key, this.hasRequests = true});

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
                  _buildCircleButton(Icons.arrow_back_ios_new, () => Get.back()),
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
                        height: 180.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    24.heightSpace,
                    Text("Coffee Shop",
                        style: FontHelper.f20BoldStyle.copyWith(
                            fontWeight: FontWeight.w700, color: AppColor.dark)),
                    16.heightSpace,
                    _buildDetailRow(Assets.iconsJobdetailsuitcase, "Electrical Engineer"),
                    _buildDetailRow(Assets.iconsJobdetailloc, "123 Street, Lorem Ipsum"),
                    _buildDetailRow(Assets.iconsJobdetailbuilding, "Dubai"),
                    _buildDetailRow(Assets.iconsJobdetailpay, "\$30/hr"),
                    _buildDetailRow(Assets.iconsJobdetailcalender, "18 Dec"),
                    _buildDetailRow(Assets.iconsJobdetailtime, "8:00 AM - 11:00 AM"),
                    16.heightSpace,
                    Text("Short Job Description",
                        style: FontHelper.f14w500MediumStyle.copyWith(
                            color: AppColor.dark, fontWeight: FontWeight.w700)),
                    8.heightSpace,
                    Text(
                        "Only you can see your full personal data. Internal access is strictly limited to authorized personnel and only for support or operational purposes.",
                        style: TextStyle(color: Colors.grey, fontSize: 12.sp, height: 1.5)),
                    24.heightSpace,
                    Text("Requests",
                        style: FontHelper.f14w500MediumStyle.copyWith(
                            color: AppColor.dark, fontWeight: FontWeight.w700)),
                    12.heightSpace,

                    hasRequests ? _buildRequestsList(context) : _buildNoRequestPlaceholder(),

                    30.heightSpace,
                    PrimaryButton(
                      height: 50.h,
                      width: double.infinity,
                      borderColor: AppColor.red,
                      onTap: () {},
                      childWidget: Text(
                        "Delete this Job",
                        style: FontHelper.f14w500MediumStyle.copyWith(
                            fontWeight: FontWeight.w700, color: AppColor.red),
                      ),
                      bgColor:Colors.transparent,
                      borderRadius: 12.r,
                    ),
                    20.heightSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRequestsList(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      separatorBuilder: (context, index) => 12.heightSpace,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => showWorkerRequestBottomSheet(context),
          child: Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(color: AppColor.border.withOpacity(0.5)),
            ),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(Assets.imagesHomeprofile, height: 44.r, width: 44.r, fit: BoxFit.cover),
                ),
                12.widthSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("John Doe", style: FontHelper.f14w500MediumStyle.copyWith(fontWeight: FontWeight.w700)),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 14.sp),
                          Text(" 4.9 (37)", style: TextStyle(color: Colors.grey, fontSize: 11.sp)),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(Icons.north_east, color: AppColor.primary, size: 18.sp),
                    Text("10 min ago", style: TextStyle(color: Colors.grey, fontSize: 10.sp)),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  Widget _workerStat(String value, String label) {
    return Column(
      children: [
        Text(value, style: FontHelper.f16BoldStyle.copyWith(color: AppColor.dark)),
        Text(label, style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
      ],
    );
  }

  Widget _buildNoRequestPlaceholder() {
    return Text("No request yet.", style: FontHelper.f12w500MediumStyle.copyWith(color: AppColor.dark, fontWeight: FontWeight.w400));
  }

  Widget _buildCircleButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44.h, width: 44.w,
        decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.circular(12.r), border: Border.all(color: AppColor.border)),
        child: Icon(icon, size: 16.sp, color: AppColor.dark),
      ),
    );
  }

  Widget _buildDetailRow(String iconAsset, String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Image.asset(iconAsset, height: 20.h, width: 20.r, color: AppColor.primary),
          12.widthSpace,
          Text(text, style: FontHelper.f13w400Regular.copyWith(color: AppColor.dark, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}