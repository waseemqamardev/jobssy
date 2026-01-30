import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/primary_button.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';
import '../../main.dart';

class JobApplicationView extends StatefulWidget {
  const JobApplicationView({super.key});

  @override
  State<JobApplicationView> createState() => _JobApplicationViewState();
}

class _JobApplicationViewState extends State<JobApplicationView> {
  bool arriveOnTime = true;
  bool completeFullShift = false;

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
                  Text("Application Confirmation",
                      style: FontHelper.f16BoldStyle.copyWith(
                          color: AppColor.dark, fontWeight: FontWeight.w600)),
                  _buildCircleButton(Icons.more_vert, () {}),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    24.heightSpace,
                    Text(
                      "Your privacy and security are our top priorities. Here's how we protect your data and ensure a safe experience on our app.",
                      style: FontHelper.f12w500MediumStyle.copyWith(
                          color: AppColor.dark, fontWeight: FontWeight.w400),
                    ),
                    24.heightSpace,
                    Text(
                      "Who can see my information?",
                      style: FontHelper.f14w500MediumStyle.copyWith(
                          color: AppColor.dark, fontWeight: FontWeight.w700),
                    ),
                    12.heightSpace,
                    Text(
                      "Only you can see your full personal data. Internal access is strictly limited to authorized personnel and only for support or operational purposes.",
                      style: FontHelper.f12w500MediumStyle.copyWith(
                          color: AppColor.dark, fontWeight: FontWeight.w400),
                    ),
                    24.heightSpace,
                    Text(
                      "Contact Us",
                      style: FontHelper.f14w500MediumStyle.copyWith(
                          color: AppColor.dark, fontWeight: FontWeight.w700),
                    ),
                    12.heightSpace,
                    Text(
                      "If you have questions or concerns about your privacy or data security, contact our Data Protection Officer:",
                      style: FontHelper.f12w500MediumStyle.copyWith(
                          color: AppColor.dark, fontWeight: FontWeight.w400),
                    ),
                    24.heightSpace,
                    _buildContactRow(
                        Assets.iconsJobemailicon, "privacy@yourapp.com"),
                    10.heightSpace,
                    _buildContactRow(
                        Assets.iconsJobphoneicon, "+1 (123) 456-7890"),
                    24.heightSpace,
                    _buildAgreementCheckbox(
                        "I agree to arrive on time",
                        arriveOnTime,
                        (val) => setState(() => arriveOnTime = val!)),
                    12.heightSpace,
                    _buildAgreementCheckbox(
                        "I agree to complete the full shift",
                        completeFullShift,
                        (val) => setState(() => completeFullShift = val!)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(18.r),
              child: PrimaryButton(
                height: 52.h,
                onTap: () {
                  _showSuccessDialog(context);
                },
                childWidget: Text(
                  "Confirm & Apply",
                  style: FontHelper.f16BoldStyle.copyWith(color: Colors.white),
                ),
                bgColor: AppColor.primary,
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
                20.heightSpace,
                Text(
                  "Applied Successfully",
                  style: FontHelper.f24w500MediumStyle.copyWith(
                      color: AppColor.black, fontWeight: FontWeight.w600),
                ),
                12.heightSpace,
                Text(
                  "Your application has been submitted.",
                  textAlign: TextAlign.center,
                  style: FontHelper.f14w400Regular.copyWith(
                    color: AppColor.tertiary,
                    height: 1.5,
                  ),
                ),
                30.heightSpace,
                PrimaryButton(
                  height: 48.h,
                  onTap: () {
                    Get.back();
                    Get.offAll(() => SimpleBottomNav());
                  },
                  childWidget: Text(
                    "Go to Home",
                    style: FontHelper.f15w600SemiBold
                        .copyWith(color: AppColor.white),
                  ),
                  bgColor: AppColor.primary,
                  borderRadius: 12.r,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildContactRow(String iconAsset, String text) {
    return Row(
      children: [
        Image.asset(iconAsset, height: 18.h, width: 18.w),
        12.widthSpace,
        Text(
          text,
          style: FontHelper.f12w500MediumStyle
              .copyWith(color: AppColor.dark, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildAgreementCheckbox(
      String title, bool value, Function(bool?) onChanged) {
    return Row(
      children: [
        SizedBox(
          height: 24.r,
          width: 24.r,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: AppColor.primary,
            side: const BorderSide(color: AppColor.border, width: 1.5),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.r)),
          ),
        ),
        12.widthSpace,
        Text(
          title,
          style: FontHelper.f12w500MediumStyle.copyWith(color: AppColor.dark),
        )
      ],
    );
  }
}
