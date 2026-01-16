import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/authentication/forgot_password_view.dart';
import 'package:jobssy/presentation/authentication/signup_view.dart';
import 'package:jobssy/presentation/customer_auth/customer_signup_view.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/customfield_component.dart';
import '../../core/global_components/primary_button.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';

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
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              100.heightSpace,
              Center(
                child: Image.asset(
                  Assets.imagesBluelogo,
                  width: 187.w,
                  height: 70.h,
                  fit: BoxFit.contain,
                ),
              ),

              15.heightSpace,
              Text(
                "Log In",
                style: FontHelper.f32w500MediumStyle.copyWith(
                    color: AppColor.black, fontWeight: FontWeight.w700),
              ),
              12.heightSpace,
              Text(
                "Enter your email and password to log in",
                style: FontHelper.f14w500MediumStyle.copyWith(
                    color: AppColor.tertiary, fontWeight: FontWeight.w400),
              ),

              25.heightSpace,
              CustomFieldComponents(
                hint: "Email",
                hintText: "example123@gmail.com",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                enabled: true,
                prefixIconWidget: Image.asset(
                  Assets.iconsUsericon,
                  width: 15.w,
                  height: 16.h,
                ),
              ),

              20.heightSpace,

              // Password Field
              CustomFieldComponents(
                hint: "Password",
                hintText: "********",
                controller: passwordController,
                obscureText: obscurePassword,
                enabled: true,
                prefixIconWidget: Image.asset(
                  Assets.iconsPasswordicon,
                  width: 15.w,
                  height: 16.h,
                ),
                suffixIconWidget: obscurePassword
                    ? Image.asset(
                        Assets.iconsEyeOff,
                        width: 20.sp,
                        height: 20.sp,
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
                  onTap: (){
                    Get.to(() => const ForgotPasswordView());
                  },
                  child: Text(
                    "Forgot Password ?",
                    style: FontHelper.f12w500MediumStyle.copyWith(
                      color: AppColor.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

              25.heightSpace,

              PrimaryButton(
                height: 48.h,
                onTap: () {},
                childWidget: Text(
                  "Login",
                  style: FontHelper.f16w500MediumStyle.copyWith(
                      fontWeight: FontWeight.w600, color: AppColor.white),
                ),
                bgColor: AppColor.primary,
                borderRadius: 11.85.r,
                width: double.infinity,
              ),

              24.heightSpace,

              // OR Divider
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey.shade300)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text("Or",
                        style: TextStyle(color: Colors.grey, fontSize: 14.sp)),
                  ),
                  Expanded(child: Divider(color: Colors.grey.shade300)),
                ],
              ),

              25.heightSpace,

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
                    Get.to(const CustomerSignUpView());
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: FontHelper.f12w500MediumStyle
                          .copyWith(color: AppColor.tertiary),
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: FontHelper.f12w500MediumStyle.copyWith(
                            color: AppColor.primary,
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
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, width: 18.w, height: 18.h),
            12.widthSpace,
            Text(
              label,
              style: FontHelper.f14w500MediumStyle
                  .copyWith(fontWeight: FontWeight.w600, color: AppColor.black),
            ),
          ],
        ),
      ),
    );
  }
}
