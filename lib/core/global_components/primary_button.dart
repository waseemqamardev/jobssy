import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/configs/colors/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget childWidget;
  final double? width;
  final double? height;
  final double? borderRadius, elevation;
  final bool isShape;

  final Color? bgColor;
  final Color? borderColor;

  final String? prefixImage;
  final String? suffixImage;

  const PrimaryButton({
    Key? key,
    required this.onTap,
    this.isShape = false,
    required this.childWidget,
    this.width,
    this.height,
    this.elevation = 0,
    this.borderRadius = 12,
    required this.bgColor,
    this.borderColor,
    this.prefixImage,
    this.suffixImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      borderRadius: BorderRadius.circular(borderRadius!),
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.zero,
        elevation: elevation ?? 2,
        shape: isShape
            ? const CircleBorder()
            : RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor ?? AppColor.borderColors,
          ),
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        child: Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          height: height ?? 55.h,
          alignment: Alignment.center,
          width: width ?? 100.w,
          decoration: BoxDecoration(
            color: bgColor ?? AppColor.btnBlue,
            shape: isShape ? BoxShape.circle : BoxShape.rectangle,
            border: isShape
                ? Border.all(color: borderColor ?? AppColor.stoke)
                : null,
            borderRadius:
            isShape ? null : BorderRadius.circular(borderRadius!),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (prefixImage != null)
                Padding(
                  padding: EdgeInsets.only(right: 6.w),
                  child: Image.asset(
                    prefixImage!,
                    height: 20.h,
                    width: 20.w,
                  ),
                ),

              childWidget,

              if (suffixImage != null)
                Padding(
                  padding: EdgeInsets.only(left: 6.w),
                  child: Image.asset(
                    suffixImage!,
                    height: 20.h,
                    width: 20.w,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
