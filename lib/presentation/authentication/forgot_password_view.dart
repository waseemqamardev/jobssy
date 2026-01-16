import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/authentication/check_mail_view.dart';

import '../../../core/global_components/primary_button.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/customfield_component.dart';
import '../../core/utils/extensions.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        toolbarHeight: 100.h,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(top: 50.h),
          child: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColor.black,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              50.heightSpace,
              Text(
                "Forgot Password",
                style: FontHelper.f32w500MediumStyle.copyWith(
                    color: AppColor.black, fontWeight: FontWeight.w700),
              ),
              12.heightSpace,
              Text(
                "Enter your email and password to reset the password",
                style: FontHelper.f14w500MediumStyle.copyWith(
                    color: AppColor.tertiary, fontWeight: FontWeight.w400),
              ),
              30.heightSpace,
              CustomFieldComponents(
                hint: "Email",
                hintText: "example123@gmail.com",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                prefixIconWidget: Icon(Icons.person_outline,
                    color: AppColor.black.withOpacity(0.7), size: 22.sp),
              ),
              30.heightSpace,
              PrimaryButton(
                height: 48.h,
                onTap: () {
                  Get.to(() => const CheckEmailView());
                },
                childWidget: Text(
                  "Reset Password",
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
}
