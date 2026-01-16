import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/authentication/set_new_password_view.dart';
import 'package:jobssy/presentation/profile/password_reset_success_view.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/primary_button.dart';
import '../../core/utils/extensions.dart';

class VerificationEmailView extends StatefulWidget {
  const VerificationEmailView({super.key});

  @override
  State<VerificationEmailView> createState() => _VerificationEmailViewState();
}

class _VerificationEmailViewState extends State<VerificationEmailView> {
  final List<TextEditingController> _controllers =
  List.generate(5, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(5, (index) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

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
          "Verification email",
          style: FontHelper.f24w500MediumStyle.copyWith(
            color: AppColor.black,
            fontWeight: FontWeight.w700,
            fontSize: 26.sp,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(color: AppColor.border, thickness: 1),

              15.heightSpace,
              Text(
                "We sent a reset link to abcde123@gmail.com \nenter 5 digit code that mentioned in the email",
                style: FontHelper.f14w500MediumStyle.copyWith(
                    color: AppColor.tertiary, fontWeight: FontWeight.w400),
              ),
              30.heightSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(5, (index) => _buildOtpBox(index)),
              ),
              23.heightSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.offAll(() => const SetNewPasswordView());
                    },
                    child: Text(
                      "Send code again",
                      style: FontHelper.defaultFontStyle.copyWith(
                        color: AppColor.tertiary,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Text(
                    "00:20",
                    style: FontHelper.defaultFontStyle.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColor.tertiary,
                    ),
                  ),
                ],
              ),
              30.heightSpace,
              PrimaryButton(
                height: 48.h,
                onTap: () {
                 Get.offAll(const PasswordResetSuccessView());
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

  Widget _buildOtpBox(int index) {
    return Container(
      width: 60.w,
      height: 64.h,
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: _focusNodes[index].hasFocus
              ? const Color(0xFF004071)
              : Colors.grey.shade100,
          width: 1,
        ),
      ),
      child: Center(
        child: TextField(
          controller: _controllers[index],
          focusNode: _focusNodes[index],
          onChanged: (value) {
            if (value.length == 1 && index < 4) {
              _focusNodes[index + 1].requestFocus();
            } else if (value.isEmpty && index > 0) {
              _focusNodes[index - 1].requestFocus();
            }
            setState(() {});
          },
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
          style: FontHelper.f24w500MediumStyle.copyWith(
              color: AppColor.black,
              fontSize: 30.sp,
              fontWeight: FontWeight.w400
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            counterText: "",
          ),
        ),
      ),
    );
  }
}
