import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/authentication/signup_view.dart';

import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';

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
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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

              15.heightSpace,

              // Subtitle
              Text(
                "Select a role to continue",
                style: FontHelper.f16BoldStyle.copyWith(
                    color: AppColor.black, fontWeight: FontWeight.bold),
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
                        icon: Assets.iconsEmployee,
                        title: "Sign up as\nemployee",
                        isSelected: selectedRole == 0,
                        onTap: () {
                          setState(() {
                            selectedRole = 0;
                          });
                          Get.offAll(() => const SignUpView());
                        },
                      ),
                    ),

                    20.widthSpace,

                    // Customer Card
                    Expanded(
                      child: RoleCard(
                        icon: Assets.iconsCustomer,
                        title: "Sign up as\nCustomer",
                        isSelected: selectedRole == 1,
                        onTap: () {
                          setState(() {
                            selectedRole = 1;
                          });
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

// Reusable Role Card Widget
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
        height: 169.h,
        width: 145.w,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: isSelected ? AppColor.primary : const Color(0xffE7E7E7),
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
                color: isSelected ? AppColor.primary : AppColor.tertiary,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
