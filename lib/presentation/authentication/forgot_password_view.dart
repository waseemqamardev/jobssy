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
      backgroundColor: Colors.transparent,


      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.heightSpace,

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

            30.heightSpace,

            Text(
              "Forgot Password",
              style: FontHelper.extraBoldStyle.copyWith(
                color: AppColor.darkBlueText,
                fontSize: 24.sp
              ),
            ),

            12.heightSpace,

            Text(
              "Please enter your email to reset the password",
              style: FontHelper.f13w500MediumStyle.copyWith(
                color: AppColor.reLightGrey.withOpacity(0.60),
                fontWeight: FontWeight.w400,
              ),
            ),

            30.heightSpace,

            CustomFieldComponents(
              hint: "Email",
              hintText: "example123@gmail.com",
              controller: emailController,
              keyboardType: TextInputType.emailAddress,

            ),

            30.heightSpace,

            PrimaryButton(
              height: 48.h,
              width: double.infinity,
              bgColor: AppColor.primary,
              borderRadius: 11.85.r,
              onTap: () {
                Get.to(() => const CheckEmailView());
              },
              childWidget: Text(
                "Reset Password",
                style: FontHelper.f16w500MediumStyle.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColor.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
