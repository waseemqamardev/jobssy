import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/roles/select_role_view.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/primary_button.dart';
import '../../core/utils/extensions.dart';

class PasswordResetSuccessView extends StatefulWidget {
  const PasswordResetSuccessView({super.key});

  @override
  State<PasswordResetSuccessView> createState() => _PasswordResetSuccessViewState();
}

class _PasswordResetSuccessViewState extends State<PasswordResetSuccessView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 300), () {
          _showSuccessDialog();
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Password Reset Successful",
                  style: FontHelper.f24w500MediumStyle.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 28.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                16.heightSpace,
                Text(
                  "Your withdrawl request has been submitted successfully.",
                  textAlign: TextAlign.center,
                  style: FontHelper.f14w500MediumStyle.copyWith(
                    color: AppColor.tertiary,
                    height: 1.5,
                  ),
                ),
                32.heightSpace,
                PrimaryButton(
                  height: 48.h,
                  onTap: () {},
                  childWidget: Text(
                    "Back to Profile",
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
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Container(
            width: 100.w,
            height: 100.h,
            decoration: const BoxDecoration(
              color: Color(0xFF004071),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check,
              color: AppColor.white,
              size: 50.sp,
            ),
          ),
        ),
      ),
    );
  }
}
