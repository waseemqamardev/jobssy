import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/assets.dart';
import '../configs/colors/app_colors.dart';
import '../configs/font_style.dart';


class CustomSearchBar extends StatelessWidget {
  final Function(String)? onChanged;
  final TextEditingController? controller;

  const CustomSearchBar({
    super.key,
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: FontHelper.defaultTextStyle.copyWith(
          color: AppColor.white,
          fontSize: 14.sp,
        ),
        decoration: InputDecoration(
          hintText: 'Search here...',
          hintStyle: FontHelper.defaultTextStyle.copyWith(
            color: AppColor.white.withOpacity(0.4),
            fontSize: 14.sp,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 12.w, right: 8.w),
            child: Image.asset(
              Assets.iconsHomeS,
              width: 20.w,
              height: 20.h,
            ),
          ),
          prefixIconConstraints:
          BoxConstraints(minWidth: 35.w, minHeight: 35.h),

          filled: true,
          fillColor: AppColor.white.withOpacity(0.05),

          contentPadding: EdgeInsets.zero,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide(color: AppColor.white, width: 1),
          ),
        ),
      ),
    );
  }
}
