import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/core/utils/extensions.dart';
import 'package:jobssy/presentation/customer_auth/customer_profile_setup_view.dart';

import '../../../core/configs/colors/app_colors.dart';
import '../../../core/configs/font_style.dart';
import '../../core/global_components/primary_button.dart';
import '../../generated/assets.dart';
import '../employee_profile_setup/employee_profile_setup_view.dart';


class CustomerVerifyEmailView extends StatefulWidget {
  const CustomerVerifyEmailView({super.key});

  @override
  State<CustomerVerifyEmailView> createState() => _CustomerVerifyEmailViewState();
}

class _CustomerVerifyEmailViewState extends State<CustomerVerifyEmailView> {
  final List<TextEditingController> _controllers =
  List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  int _seconds = 20; // countdown timer
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    // Focus listeners for OTP boxes
    for (var node in _focusNodes) {
      node.addListener(() {
        setState(() {}); // rebuild on focus change
      });
    }

    // Start countdown timer
    _startTimer();
  }

  void _startTimer() {
    _seconds = 20;
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    _timer?.cancel();
    super.dispose();
  }

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
              "Check your email",
              style: FontHelper.extraBoldStyle.copyWith(
                color: AppColor.darkBlueText,
                fontSize: 24.sp,
              ),
            ),

            6.heightSpace,

            // Instruction text with highlighted email
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

            // OTP Boxes
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) => _buildOtpBox(index)),
            ),

            23.heightSpace,

            // Resend & Timer
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    _startTimer(); // restart timer
                    Get.to(() => const CustomerProfileSetupView());
                  },
                  child: Text(
                    "Send code again",
                    style: FontHelper.defaultFontStyle.copyWith(
                      color: AppColor.btnBlue,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColor.btnBlue,
                      decorationThickness: 0.2,

                    ),
                  ),
                ),

                // Countdown Timer
                Text(
                  "00:${_seconds.toString().padLeft(2, '0')}",
                  style: FontHelper.defaultFontStyle.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColor.tertiary,
                  ),
                ),
              ],
            ),
            24.heightSpace,
            PrimaryButton(
              onTap: () {
                _showSuccessDialog(context);
              },
              height: 48.h,
              width: double.infinity,
              bgColor: AppColor.primary,
              borderRadius: 10.r,
              childWidget: Text(
                "Verify",
                style: FontHelper.f15w600SemiBold
                    .copyWith(color: AppColor.white),
              ),
            ),
          ],
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
                  "Successful",
                  style: FontHelper.f24w500MediumStyle.copyWith(
                      color: AppColor.black, fontWeight: FontWeight.w600),
                ),
                12.heightSpace,
                Text(
                  "Your email has been successfully verified. Complete your profile and do kyc to continue",
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
                    Get.offAll(() => const CustomerProfileSetupView());
                  },
                  childWidget: Text(
                    "Profile Setup",
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

  // OTP Box Widget
  Widget _buildOtpBox(int index) {
    return SizedBox(
      width: 44.w,
      height: 44.h,
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: FontHelper.f24w500MediumStyle.copyWith(
          color: AppColor.darkBlueText,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColor.white,
          contentPadding: EdgeInsets.zero,

          // Unfocused border
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(
              color: const Color(0xff166DDF1A).withOpacity(0.10),
              width: 1,
            ),
          ),

          // Focused border
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(
              color: AppColor.btnBlue,
              width: 1.5,
            ),
          ),

          counterText: "",
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 5) {
            _focusNodes[index + 1].requestFocus();
          } else if (value.isEmpty && index > 0) {
            _focusNodes[index - 1].requestFocus();
          }
        },
      ),
    );
  }
}
