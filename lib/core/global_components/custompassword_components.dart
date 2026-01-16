//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../../core/configs/colors/app_colors.dart';
//
// class CustomPasswordFieldComponents extends StatelessWidget {
//   final String hint;
//   final String? suffixIconSvg;
//   final String? prefixIconSvg;
//   final TextEditingController controller;
//   final VoidCallback? onpressed;
//   final String? Function(String?)? validator;
//   final bool obscureText;
//   final TextInputType? keyboardType;
//   final Function(String)? onChanged;
//   final List<TextInputFormatter>? inputFormatters;
//   final Widget? labelWidget;
//   final bool enabled;
//   const CustomPasswordFieldComponents({
//     Key? key,
//     required this.hint,
//     this.suffixIconSvg,
//     this.enabled = false,
//     this.inputFormatters,
//     this.prefixIconSvg,
//     this.onpressed,
//     this.validator,
//     this.labelWidget,
//     required this.controller,
//     this.obscureText = false,
//     this.keyboardType,
//     this.onChanged,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//           readOnly: enabled,
//           onTapOutside: (v) {
//             FocusScope.of(context).unfocus();
//           },
//           keyboardType: keyboardType,
//           cursorColor: AppColor.KBlacks,
//           style: TextStyle(
//             fontFamily: 'Montserrat',
//             fontSize: 14.sp,
//             color: AppColor.kBlackColor,
//             fontWeight: FontWeight.w400,
//           ),
//           obscureText: obscureText,
//           decoration: InputDecoration(
//             label: labelWidget,
//             filled: true,
//             fillColor: AppColor.kWhiteColor,
//             contentPadding: EdgeInsets.symmetric(
//               vertical: 16.sp,
//             ).copyWith(left: 12.w),
//             focusColor: Colors.white,
//             hintText: hint,
//             hintStyle: TextStyle(
//               fontFamily: 'Montserrat',
//               fontSize: 14.sp,
//               color: AppColor.hintColor,
//               fontWeight: FontWeight.w400,
//             ),
//             prefixIcon:
//                 prefixIconSvg != null
//                     ? Padding(
//                       padding: const EdgeInsets.only(left: 12, right: 8),
//                       child: SvgPicture.asset(
//                         prefixIconSvg!,
//                         width: 24,
//                         height: 24,
//                         color: AppColor.primary,
//                       ),
//                     )
//                     : null,
//
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(22.r),
//               borderSide: const BorderSide(color: Color(0xffE2E4EA)),
//             ),
//             errorBorder: OutlineInputBorder(
//               borderSide: const BorderSide(color: Colors.red),
//               borderRadius: BorderRadius.circular(22.0.r),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(22.r),
//               borderSide: const BorderSide(color: AppColor.primary),
//             ),
//             // focusedErrorBorder: OutlineInputBorder(
//             //   borderSide: const BorderSide(color: Colors.red),
//             //   borderRadius: BorderRadius.circular(15.0.r),
//             // ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(22.r),
//               borderSide: const BorderSide(color: Color(0xffE2E4EA)),
//             ),
//             errorStyle: const TextStyle(color: Colors.red, height: 0),
//           ),
//           controller: controller,
//           validator: validator,
//           onChanged: onChanged,
//         );
//   }
// }
