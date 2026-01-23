import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/global_components/primary_button.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/customfield_component.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool obscureCurrent = true;
  bool obscureNew = true;
  bool obscureConfirm = true;

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
                children: [
                  _buildCircleButton(
                      Icons.arrow_back_ios_new, () => Navigator.pop(context)),
                  const Spacer(),
                  Text(
                    "Change Password",
                    style: FontHelper.f16BoldStyle.copyWith(
                      color: AppColor.dark,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(width: 44.w),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    25.heightSpace,
                    _buildLabel("Current Password"),
                    CustomFieldComponents(
                      hintText: "************",
                      controller: currentPasswordController,
                      obscureText: obscureCurrent,
                      suffixIconWidget: Icon(
                        obscureCurrent
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColor.tertiary,
                        size: 20.sp,
                      ),
                      onSuffixIconTap: () =>
                          setState(() => obscureCurrent = !obscureCurrent),
                    ),
                    15.heightSpace,
                    _buildLabel("New Password"),
                    CustomFieldComponents(
                      hintText: "************",
                      controller: newPasswordController,
                      obscureText: obscureNew,
                      suffixIconWidget: Icon(
                        obscureNew
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColor.tertiary,
                        size: 20.sp,
                      ),
                      onSuffixIconTap: () =>
                          setState(() => obscureNew = !obscureNew),
                    ),
                    15.heightSpace,
                    _buildLabel("Confirm New Password"),
                    CustomFieldComponents(
                      hintText: "************",
                      controller: confirmPasswordController,
                      obscureText: obscureConfirm,
                      suffixIconWidget: Icon(
                        obscureConfirm
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: AppColor.tertiary,
                        size: 20.sp,
                      ),
                      onSuffixIconTap: () =>
                          setState(() => obscureConfirm = !obscureConfirm),
                    ),
                    40.heightSpace,
                    PrimaryButton(
                      height: 52.h,
                      onTap: () {
                        _showSuccessDialog(context);
                      },
                      childWidget: Text(
                        "Update Password",
                        style: FontHelper.f16w500MediumStyle.copyWith(
                            fontWeight: FontWeight.w600, color: AppColor.white),
                      ),
                      bgColor: AppColor.primary,
                      borderRadius: 12.r,
                      width: double.infinity,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        text,
        style: FontHelper.f14w500MediumStyle.copyWith(
          color: AppColor.dark,
          fontWeight: FontWeight.w600,
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
          color: AppColor.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColor.border),
        ),
        child: Icon(icon, size: 16.sp, color: AppColor.dark),
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
                  "Password Changed",
                  style: FontHelper.f24w500MediumStyle.copyWith(
                      color: AppColor.black, fontWeight: FontWeight.w600),
                ),
                12.heightSpace,
                Text(
                  "Your password has been changed successfully.",
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
                  },
                  childWidget: Text(
                    "Ok",
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

}
