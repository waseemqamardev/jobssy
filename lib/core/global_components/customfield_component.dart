import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../configs/colors/app_colors.dart';
import '../configs/font_style.dart';
import '../utils/extensions.dart';

class CustomFieldComponents extends StatelessWidget {
  final String? hint;
  final String? hintText;
  final TextStyle? hintStyle;
  final double? height;
  final double? width;
  final Widget? suffixIconWidget;
  final VoidCallback? onSuffixIconTap;
  final Widget? prefixIconWidget;
  final TextEditingController controller;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  // 🔹 Added Optional Border Color
  final Color? borderColor;

  const CustomFieldComponents({
    super.key,
    this.hint,
    this.hintText,
    this.hintStyle,
    this.height,
    this.width,
    this.suffixIconWidget,
    this.onSuffixIconTap,
    this.prefixIconWidget,
    this.enabled = true,
    this.inputFormatters,
    this.validator,
    required this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.onChanged,
    this.onTap,
    this.borderColor, // Initialize here
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (hint != null && hint!.isNotEmpty) ...[
          Text(
            hint!,
            style: FontHelper.f14w500MediumStyle.copyWith(
              color: AppColor.darkBlueText,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          8.heightSpace,
        ],

        /// Input Box
        Container(
          width: width ?? double.infinity,
          height: height ?? 44.h,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(

              color: borderColor ?? const Color(0xff166DDF1A).withOpacity(0.10),
              width: 1.w,
            ),
          ),
          child: TextFormField(
            enabled: enabled,
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            validator: validator,
            onChanged: onChanged,
            onTap: onTap,
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
            cursorColor: AppColor.black,
            style: FontHelper.f14w500MediumStyle.copyWith(
              color: AppColor.darkBlueText,
            ),
            decoration: InputDecoration(
              isDense: true,
              hintText: hintText,

              hintStyle: hintStyle ??
                  FontHelper.f16w500MediumStyle.copyWith(
                    color: AppColor.reLightGrey.withOpacity(0.60),
fontSize: 13.sp
                  ),

              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,

              prefixIcon: prefixIconWidget != null
                  ? Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: prefixIconWidget,
              )
                  : null,
              prefixIconConstraints: BoxConstraints(
                minWidth: 24.w,
                minHeight: 24.h,
              ),

              suffixIcon: suffixIconWidget != null
                  ? GestureDetector(
                onTap: onSuffixIconTap,
                child: suffixIconWidget,
              )
                  : null,
              suffixIconConstraints: BoxConstraints(
                minWidth: 24.w,
                minHeight: 24.h,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
