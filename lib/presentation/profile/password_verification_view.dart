import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/authentication/password_changed_view.dart';

import '../../../core/global_components/primary_button.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/customfield_component.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';

class PasswordVerificationView extends StatefulWidget {
  const PasswordVerificationView({super.key});

  @override
  State<PasswordVerificationView> createState() => _PasswordVerificationViewState();
}

class _PasswordVerificationViewState extends State<PasswordVerificationView> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

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
          "Change Password",
          style: FontHelper.f24w500MediumStyle.copyWith(
            color: AppColor.black,
            fontWeight: FontWeight.w700,
            fontSize: 26.sp,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(color: AppColor.border, thickness: 1),

              15.heightSpace,
              Text(
                "Create a new password. Ensure it differs from previous ones for security",
                style: FontHelper.f14w500MediumStyle.copyWith(
                    color: AppColor.tertiary, fontWeight: FontWeight.w400),
              ),
              30.heightSpace,
              CustomFieldComponents(
                hint: "Old Password",
                hintText: "Enter your Password",
                controller: passwordController,
                obscureText: obscurePassword,
                suffixIconWidget: Image.asset(
                  obscurePassword ? Assets.iconsEyeOff :  Assets.iconsEyeOff,width: 16.w,height: 16.h,
                  color: AppColor.tertiary,
                ),
                onSuffixIconTap: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
              ),
              12.heightSpace,
              CustomFieldComponents(
                hint: "Password",
                hintText: "Enter your Password",
                controller: passwordController,
                obscureText: obscurePassword,
                suffixIconWidget: Image.asset(
                  obscurePassword ? Assets.iconsEyeOff :  Assets.iconsEyeOff,width: 16.w,height: 16.h,
                  color: AppColor.tertiary,
                ),
                onSuffixIconTap: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
              ),

              12.heightSpace,

              CustomFieldComponents(
                hint: "Confirm Password",
                hintText: "Re-enter password",
                controller: confirmPasswordController,
                obscureText: obscureConfirmPassword,
                suffixIconWidget: Image.asset(
                  obscurePassword ? Assets.iconsEyeOff :  Assets.iconsEyeOff,width: 16.w,height: 16.h,
                  color: AppColor.tertiary,
                ),
                onSuffixIconTap: () {
                  setState(() {
                    obscureConfirmPassword = !obscureConfirmPassword;
                  });
                },
              ),

              30.heightSpace,

              PrimaryButton(
                height: 48.h,
                onTap: () {
                  Get.to(() => const PasswordChangedView());

                },
                childWidget: Text(
                  "Proceed to Verify",
                  style: FontHelper.f16w500MediumStyle.copyWith(
                      fontWeight: FontWeight.w600, color: AppColor.white),
                ),
                bgColor: AppColor.primary,
                borderRadius: 11.85.r,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSuccessDialog() {
    Get.defaultDialog(
      title: "Success",
      middleText: "Your password has been updated successfully!",
      textConfirm: "Back to Login",
      confirmTextColor: Colors.white,
      buttonColor: AppColor.primary,
      onConfirm: () {
        Get.until((route) => Get.currentRoute == '/LoginView');
      },
    );
  }
}