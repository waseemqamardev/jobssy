import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/authentication/employee_sign_up/signup_view.dart';

import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';
import '../customer_auth/customer_signup_view.dart';

class SelectRoleView extends StatefulWidget {
  const SelectRoleView({super.key});

  @override
  State<SelectRoleView> createState() => _SelectRoleViewState();
}

class _SelectRoleViewState extends State<SelectRoleView> {
  // 0 for Employee, 1 for Customer
  int selectedRole = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                child: Text("Jobssy",
                    style: FontHelper.extraBoldStyle

                ),
              ),

              40.heightSpace,

              // Subtitle
              Text(
                "Select a role to continue",
                style: FontHelper.f16BoldStyle.copyWith(
                  fontSize: 14.sp,
                    color: AppColor.darkBlueText, fontWeight: FontWeight.w700),
              ),

              31.heightSpace,

              // Role Cards Row
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  children: [
                    // Employee Card
                    Expanded(
                      child: RoleCard(
                        icon: Assets.imagesEmployee,
                        title: "Sign up as\nemployee",
                        isSelected: selectedRole == 0,
                        onTap: () {
                          setState(() {
                            selectedRole = 0;
                          });
                          Get.to(() => const SignUpView());
                        },
                      ),
                    ),

                    20.widthSpace,

                    // Customer Card
                    Expanded(
                      child: RoleCard(
                        icon: Assets.imagesCustomer,
                        title: "Sign up as\nCustomer",
                        isSelected: selectedRole == 1,
                        onTap: () {
                          setState(() {
                            selectedRole = 1;
                          });
                          Get.to(() => const CustomerSignUpView());

                        },
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Yahan aap apna PrimaryButton bhi add kar sakte hain "Continue" ke liye
            ],
          ),
        ),
      ),
    );
  }
}


class RoleCard extends StatelessWidget {
  final String icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const RoleCard({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 159.5.h,
        width: 118.w,
        decoration: BoxDecoration(
          color: isSelected ? AppColor.btnBlue : AppColor.white, // container blue when selected
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ?const Color(0xff166DDF1A).withOpacity(0.10) : const Color(0xffE7E7E7),
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: 55.w,
              height: 55.h,
            ),
            11.heightSpace,
            Text(
              title,
              textAlign: TextAlign.center,
              style: FontHelper.f14w500MediumStyle.copyWith(
                fontSize: 12.sp,
                color: isSelected ? AppColor.white : AppColor.darkBlueText,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
