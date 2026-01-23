import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/authentication/login_view.dart';
import 'package:jobssy/presentation/authentication/password_changed_view.dart';

import '../../../core/global_components/primary_button.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/customfield_component.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';

class SetNewPasswordView extends StatefulWidget {
  const SetNewPasswordView({super.key});

  @override
  State<SetNewPasswordView> createState() => _SetNewPasswordViewState();
}

class _SetNewPasswordViewState extends State<SetNewPasswordView> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.heightSpace,

              // Back button
              Container(
                width: 48.w,
                height: 48.h,
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: const Color(0xff166DDF1A).withOpacity(0.10),
                  ),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => Get.back(),
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: AppColor.black,
                  ),
                ),
              ),
              24.heightSpace,


              // Title
              Text(
                "Set a new password",
                style: FontHelper.extraBoldStyle.copyWith(
                  color: AppColor.darkBlueText,
                  fontSize: 24.sp,
                ),
              ),
              6.heightSpace,

              Text.rich(
                TextSpan(
                  style: FontHelper.f13w500MediumStyle.copyWith(
                    color: AppColor.reLightGrey.withOpacity(0.6),
                    fontWeight: FontWeight.w400,
                  ),
                  children: const [
                    TextSpan(
                      text: "We sent a reset link to ",
                    ),
                    TextSpan(
                      text: "abcde123@gmail.com",
                      style: TextStyle(
                        color: AppColor.darkBlueText,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: " \nenter 5 digit code that mentioned in the email",
                    ),
                  ],
                ),
              ),

              24.heightSpace,
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
                  "Password Updated",
                  style: FontHelper.f24w500MediumStyle.copyWith(
                      color: AppColor.black, fontWeight: FontWeight.w600),
                ),
                12.heightSpace,
                Text(
                  "Your new password has been updated successfully. Log In to continue",
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
                    Get.offAll(() => const LoginView());
                  },
                  childWidget: Text(
                    "Login",
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