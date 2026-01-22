import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors/app_colors.dart';

class FontHelper {
  static TextStyle defaultFontStyle =  TextStyle(
    fontFamily: 'Inter',
    color: AppColor.reBlueShadeText,
    fontWeight: FontWeight.normal,
    fontSize: 16.sp,
  );
  static TextStyle  defaultTextStyle = defaultFontStyle.copyWith(
    color: AppColor.reBlueShadeText,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static TextStyle extraBoldStyle = defaultFontStyle.copyWith(
    color: AppColor.reBlueShadeText,
    fontWeight: FontWeight.w800,
    fontSize: 38,
  );

  static TextStyle semiBoldStyle = defaultFontStyle.copyWith(
    color: AppColor.reBlueShadeText,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );



  static TextStyle f16BoldStyle = defaultFontStyle.copyWith(
    color: AppColor.reBlueShadeText,
    fontWeight: FontWeight.w700,
    fontSize: 16,
  );

  static TextStyle f18BoldStyle = defaultFontStyle.copyWith(
    color: AppColor.reBlueShadeText,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );


  static TextStyle f20BoldStyle = defaultFontStyle.copyWith(
    color: AppColor.reBlueShadeText,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static TextStyle f15w600SemiBold = defaultFontStyle.copyWith(
    color: AppColor.reBlueShadeText,
    fontWeight: FontWeight.w600,
    fontSize: 15,
  );

  static TextStyle f15w400Regular = defaultFontStyle.copyWith(
    color: AppColor.reBlueShadeText,
    fontWeight: FontWeight.w400,
    fontSize: 15,
  );

  static TextStyle f14w400Regular = f15w400Regular.copyWith(fontSize: 14);
  static TextStyle f13w400Regular = regularStyle.copyWith(fontSize: 13);
  static TextStyle regularStyle = defaultFontStyle.copyWith(
    color: AppColor.reBlueShadeText,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  static TextStyle f16w500MediumStyle = defaultFontStyle.copyWith(
    color: AppColor.reBlueShadeText,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static TextStyle f24w500 = defaultFontStyle.copyWith(
    color: AppColor.reBlueShadeText,
    fontWeight: FontWeight.w500,
    fontSize: 24,
  );

  static TextStyle f15w500MediumStyle = defaultFontStyle.copyWith(
    color: AppColor.reBlueShadeText,
    fontWeight: FontWeight.w500,
    fontSize: 15,
  );
  static TextStyle f20w500MediumStyle = defaultFontStyle.copyWith(
    color: AppColor.reBlueShadeText,
    fontWeight: FontWeight.w500,
    fontSize: 20,
  );

  static TextStyle hintStyle = defaultFontStyle.copyWith(
    color: AppColor.reBlueShadeText,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );
  static TextStyle f14w500MediumStyle= f16w500MediumStyle.copyWith(fontSize: 14);
  static TextStyle f13w500MediumStyle= f16w500MediumStyle.copyWith(fontSize: 13);
  static TextStyle f12w500MediumStyle= f16w500MediumStyle.copyWith(fontSize: 12);
  static TextStyle f8w500MediumStyle= f16w500MediumStyle.copyWith(fontSize: 8);

  static TextStyle f24w500MediumStyle = f16w500MediumStyle.copyWith(
    fontSize: 24,
  );
  static TextStyle f12w400Regular = f16w500MediumStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400
  );
  static TextStyle f32w500MediumStyle = f16w500MediumStyle.copyWith(
    fontSize: 32,
  );

}
