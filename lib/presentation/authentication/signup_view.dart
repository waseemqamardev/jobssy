import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/authentication/login_view.dart';
import 'package:jobssy/presentation/authentication/password_changed_view.dart';
import 'package:jobssy/presentation/home_screen.dart';
import '../../../core/global_components/primary_button.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/customfield_component.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';
import '../profile_setup/profile_setup_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

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
              24.heightSpace,
              Center(
                child: Image.asset(
                  Assets.imagesBluelogo,
                  width: 187.w,
                  height: 70.h,
                  fit: BoxFit.contain,
                ),
              ),

              30.heightSpace,
              Text(
                "Sign up",
                style: FontHelper.f24w500MediumStyle.copyWith(
                  color: AppColor.black,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              12.heightSpace,
              Text(
                "Create an account to continue!",
                style: FontHelper.f14w500MediumStyle.copyWith(
                  color: Colors.grey.shade500,
                ),
              ),

              25.heightSpace,
              CustomFieldComponents(
                hint: "Full Name",
                hintText: "Muhammad Farooq Ali",
                controller: nameController,
              ),
              12.heightSpace,
              CustomFieldComponents(
                hint: "Email",
                hintText: "abcde123@gmail.com",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              12.heightSpace,
              CustomFieldComponents(
                hint: "Birth of date",
                hintText: "18/03/2024",
                controller: dobController,
                suffixIconWidget: Image.asset(
                  Assets.iconsCalender,
                  width: 16.w,
                  height: 16.h,
                ),
                onTap: () async {
                  // Date Picker Logic
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      dobController.text =
                          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                    });
                  }
                },
              ),

              12.heightSpace,

              // Set Password Field
              CustomFieldComponents(
                hint: "Set Password",
                hintText: "1234567",
                controller: passwordController,
                obscureText: obscurePassword,
                suffixIconWidget: Image.asset(
                  obscurePassword ? Assets.iconsEye : Assets.iconsEyeOff,
                  width: 16.w,
                  height: 16.h,
                  color: AppColor.tertiary,
                ),
                onSuffixIconTap: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
              ),

              12.heightSpace,

              // Confirm Password Field
              CustomFieldComponents(
                hint: "Confirm Password",
                hintText: "*********",
                controller: confirmPasswordController,
                obscureText: obscureConfirmPassword,
                suffixIconWidget: Image.asset(
                  obscurePassword ? Assets.iconsEye : Assets.iconsEyeOff,
                  width: 16.w,
                  height: 16.h,
                  color: AppColor.tertiary,
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
                  Get.offAll(() => const ProfileSetupView());
                },
                childWidget: Text(
                  "Sign Up",
                  style: FontHelper.f16w500MediumStyle.copyWith(
                      fontWeight: FontWeight.w600, color: AppColor.white),
                ),
                bgColor: AppColor.primary,
                borderRadius: 11.85.r,
                width: double.infinity,
              ),

              30.heightSpace,

              Center(
                child: GestureDetector(
                  onTap: () {
                    Get.offAll(() => const LoginView());
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: FontHelper.f14w500MediumStyle
                          .copyWith(color: Colors.grey),
                      children: [
                        TextSpan(
                          text: "Login",
                          style: FontHelper.f14w500MediumStyle.copyWith(
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
}
