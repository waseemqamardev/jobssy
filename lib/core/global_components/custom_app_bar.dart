//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:wink_up/core/global_components/textstyle_component.dart';
//
// import '../../core/configs/assets/app_icons.dart';
// import '../../core/configs/colors/app_colors.dart';
//
// class CustomAppBar extends StatelessWidget {
//  final Function()  leadingOnTap;
//  final Function()  homeOnTap;
//  final String title;
//   const CustomAppBar({
//     super.key, required this.homeOnTap,required this.leadingOnTap,required this.title
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 17.w),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           // Back Button
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               shape: BoxShape.circle,
//               boxShadow: [
//                 BoxShadow(
//                   offset: Offset(0, 4),
//                   blurRadius: 80.r,
//                   color: Color(
//                     0XFFA7AEC1,
//                   ).withValues(alpha: 0.3),
//                 ),
//               ],
//             ),
//             child: IconButton(
//               icon: const Icon(
//                 Icons.arrow_back,
//                 color: Colors.black,
//               ),
//               onPressed: leadingOnTap,
//             ),
//           ),
//          TextComponents(
//           title: title,
//           size: 16.sp,
//           weight: FontWeight.bold,
//           color: AppColor.kBlackColor,
//         ), // Home Button
//           InkWell(
//             onTap: homeOnTap,
//             child: Container(
//               padding: EdgeInsets.all(10.sp),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 shape: BoxShape.circle,
//                 boxShadow: [
//                   BoxShadow(
//                     offset: Offset(0, 4),
//                     blurRadius: 80.r,
//                     color: Color(
//                       0XFFA7AEC1,
//                     ).withValues(alpha: 0.3),
//                   ),
//                 ],
//               ),
//               child: SvgPicture.asset(AppIcons.home),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
