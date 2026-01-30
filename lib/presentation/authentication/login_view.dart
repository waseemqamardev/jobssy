import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/authentication/forgot_password_view.dart';
import 'package:jobssy/presentation/authentication/employee_sign_up/signup_view.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/customfield_component.dart';
import '../../core/global_components/primary_button.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';
import '../roles/select_role_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;

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
              44.heightSpace,
              Center(
                child: Image.asset(
                  Assets.imagesBox,
                  width: 46.w,
                  height: 40.h,
                  fit: BoxFit.contain,
                ),
              ),
              Center(
                child: Text("Jobssy", style: FontHelper.extraBoldStyle),
              ),

              15.heightSpace,
              Text("Log In",
                  style: FontHelper.extraBoldStyle
                      .copyWith(fontSize: 24.sp, color: AppColor.darkBlueText)),
              6.heightSpace,
              Text(
                "Enter your email and password to log in",
                style: FontHelper.f14w500MediumStyle.copyWith(
                    color: AppColor.reLightGrey.withOpacity(0.40),
                    fontWeight: FontWeight.w400),
              ),

              24.heightSpace,
              CustomFieldComponents(
                hint: "Email",
                hintText: "example123@gmail.com",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                enabled: true,
              ),

              20.heightSpace,

              // Password Field
              CustomFieldComponents(
                hint: "Password",
                hintText: "********",
                controller: passwordController,
                obscureText: obscurePassword,
                enabled: true,
                suffixIconWidget: obscurePassword
                    ? Image.asset(
                        Assets.iconsEyeOff,
                        width: 18.sp,
                        height: 18.sp,
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

              12.heightSpace,

              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const ForgotPasswordView());
                  },
                  child: Text(
                    "Forgot Password ?",
                    style: FontHelper.f13w500MediumStyle.copyWith(
                      color: AppColor.btnBlue,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

              25.heightSpace,

              PrimaryButton(
                height: 48.h,
                onTap: () {
                  Get.to(const SelectRoleView());
                },
                childWidget: Text(
                  "Login",
                  style: FontHelper.f14w500MediumStyle.copyWith(
                      fontWeight: FontWeight.w600, color: AppColor.white),
                ),
                bgColor: AppColor.btnBlue,
                borderRadius: 12.r,
                width: double.infinity,
              ),

              24.heightSpace,

              // OR Divider
              Row(
                children: [
                  Expanded(
                      child: Divider(
                          color: const Color(0xff1D07431A).withOpacity(0.10))),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text("Or",
                        style: TextStyle(
                            color: const Color(0xff1D0743).withOpacity(0.60),
                            fontSize: 14.sp)),
                  ),
                  Expanded(
                      child: Divider(
                          color: const Color(0xff1D07431A).withOpacity(0.10))),
                ],
              ),

              24.heightSpace,

              _socialButton(
                icon: Assets.iconsGoogle,
                label: "Continue with Google",
                onTap: () {},
              ),

              15.heightSpace,

              _socialButton(
                icon: Assets.iconsApple,
                label: "Continue with AppleID",
                onTap: () {},
              ),

              15.heightSpace,

              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.to(const SelectRoleView());
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: FontHelper.f12w500MediumStyle.copyWith(
                        color: AppColor.darkBlueText.withOpacity(0.60),
                      ),
                      children: [
                        TextSpan(
                          text: "Sign Up",
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

  Widget _socialButton(
      {required String icon,
      required String label,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: const Color(0xff166DDF1A).withOpacity(0.10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, width: 18.w, height: 18.h),
            12.widthSpace,
            Text(
              label,
              style: FontHelper.f14w500MediumStyle.copyWith(
                  fontWeight: FontWeight.w600, color: AppColor.darkBlueText),
            ),
          ],
        ),
      ),
    );
  }
}
