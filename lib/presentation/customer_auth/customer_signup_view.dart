import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/authentication/login_view.dart';
import 'package:jobssy/presentation/customer_auth/customer_verify_email_view.dart';
import '../../../core/configs/colors/app_colors.dart';
import '../../../core/configs/font_style.dart';
import '../../../core/global_components/customfield_component.dart';
import '../../../core/global_components/primary_button.dart';
import '../../../core/utils/extensions.dart';
import '../../../generated/assets.dart';
import '../authentication/employee_sign_up/employee_verify_email.dart';

class CustomerSignUpView extends StatefulWidget {
  const CustomerSignUpView({super.key});

  @override
  State<CustomerSignUpView> createState() => _CustomerSignUpViewState();
}

class _CustomerSignUpViewState extends State<CustomerSignUpView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool isAccurate = false;
  bool isPolicyAgreed = false;

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
              40.heightSpace,
              Center(
                child: Image.asset(
                  Assets.imagesBox,
                  width: 46.w,
                  height: 40.h,
                  fit: BoxFit.contain,
                ),
              ),
              Center(
                child: Text("Jobssy",
                    style: FontHelper.extraBoldStyle),
              ),
              40.heightSpace,
              Text(
                "Sign Up",
                style: FontHelper.extraBoldStyle.copyWith(
                    fontSize: 24.sp, color: AppColor.darkBlueText),
              ),
              6.heightSpace,
              Text(
                "Create an account to continue!",
                style: FontHelper.f14w500MediumStyle.copyWith(
                    color: AppColor.reLightGrey.withOpacity(0.40),
                    fontWeight: FontWeight.w400),
              ),
              24.heightSpace,
              CustomFieldComponents(
                hint: "Full Name",
                hintText: "Muhammad Farooq Ali",
                controller: nameController,
              ),
              16.heightSpace,
              CustomFieldComponents(
                hint: "Email",
                hintText: "abcde123@gmail.com",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              16.heightSpace,

              CustomFieldComponents(
                hint: "Set Password",
                hintText: "********",
                controller: passwordController,
                obscureText: obscurePassword,
                suffixIconWidget: obscurePassword
                    ? Image.asset(
                  Assets.iconsEyeOff,
                  width: 16.w,
                  height: 16.h,
                  color: Colors.grey,
                )
                    : Icon(
                  Icons.visibility_outlined,
                  size: 20.sp,
                  color: Colors.grey,
                ),
                onSuffixIconTap: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
              ),
              16.heightSpace,
              CustomFieldComponents(
                hint: "Confirm Password",
                hintText: "********",
                controller: confirmPasswordController,
                obscureText: obscureConfirmPassword,
                suffixIconWidget: obscureConfirmPassword
                    ? Image.asset(
                  Assets.iconsEyeOff,
                  width: 16.w,
                  height: 16.h,
                  color: Colors.grey,
                )
                    : Icon(
                  Icons.visibility_outlined,
                  size: 20.sp,
                  color: Colors.grey,
                ),
                onSuffixIconTap: () {
                  setState(() {
                    obscureConfirmPassword = !obscureConfirmPassword;
                  });
                },
              ),
              25.heightSpace,
              PrimaryButton(
                height: 48.h,
                onTap: () {
                  Get.to(() => const CustomerVerifyEmailView());
                },
                childWidget: Text(
                  "Sign Up",
                  style: FontHelper.f14w500MediumStyle.copyWith(
                      fontWeight: FontWeight.w600, color: AppColor.white),
                ),
                bgColor: AppColor.btnBlue,
                borderRadius: 12.r,
                width: double.infinity,
              ),
              24.heightSpace,
              // OR Divider

              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const LoginView());
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: FontHelper.f12w500MediumStyle.copyWith(
                        color: AppColor.darkBlueText.withOpacity(0.60),
                      ),
                      children: [
                        TextSpan(
                          text: "Login",
                          style: FontHelper.f12w500MediumStyle.copyWith(
                            color: AppColor.btnBlue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              20.heightSpace,
            ],
          ),
        ),
      ),
    );
  }


}
