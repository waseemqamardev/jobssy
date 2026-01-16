//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:wink_up/core/global_components/textstyle_component.dart' show TextComponents;
//
// import '../../core/configs/colors/app_colors.dart';
//
// class AccountComponents extends StatelessWidget {
//   final String title;
//   final String btnText;
//   final VoidCallback onPressed;
//
//   const AccountComponents({
//     super.key,
//     required this.title,
//     required this.btnText,
//     required this.onPressed,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {},
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           TextComponents(
//             title: title,
//             size: 14.sp,
//             color: AppColor.hintColor,
//             weight: FontWeight.w300,
//           ),
//           InkWell(
//             onTap: onPressed,
//             child: TextComponents(
//               title: btnText,
//               size: 14.sp,
//               color: AppColor.primary,
//               weight: FontWeight.w300,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
