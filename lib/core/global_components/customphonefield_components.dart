// // ignore_for_file: use_super_parameters
//
// import 'package:country_picker/country_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:wink_up/ui/customWidgets/textstyle_component.dart';
//
// import '../../core/configs/colors/app_colors.dart';
// import '../../core/utils/extensions.dart';
//
// class CustomPhoneFieldComponents extends StatelessWidget {
//   final IconData? suffixIcon;
//
//   final TextEditingController EditController;
//   final VoidCallback? onpressed;
//   final String? Function(String?)? validator;
//   final bool obscureText;
//   final TextInputType? keyboardType;
//   final Function(String)? onChanged; // Added this line for real-time validation
//   final Widget? labelWidget;final bool? enable;
//   const CustomPhoneFieldComponents({
//     Key? key,
//     this.suffixIcon,
//     this.onpressed,
//     this.enable=false,
//     this.validator,
//     this.labelWidget,
//     required this.EditController,
//     this.obscureText = false,
//     this.keyboardType,
//     this.onChanged, // Added this line to pass the onChanged function
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // return Consumer<PhoneTextFieldProvider>(
//     //   builder: (context, state,_) {
//     //     return TextFormField(   contextMenuBuilder: (context, editableTextState) {
//     // // 👇 This disables long press/double tap context menu
//     return const SizedBox.shrink();
//   },readOnly: enable!,
//           onTapOutside: (v) {
//             FocusScope.of(context).unfocus();
//           },
//
//           inputFormatters:
//               [
//                 FilteringTextInputFormatter.digitsOnly,
//                 LengthLimitingTextInputFormatter(
//                   state.getMaxPhoneLength(),
//
//                 ), // Adjust the limit as needed
//               ] ,
//           keyboardType: keyboardType,
//           cursorColor: AppColor.KBlacks,
//           style: GoogleFonts.manrope(
//             fontSize: 14.sp,
//             color: AppColor.black,
//             fontWeight: FontWeight.w400,
//           ),
//           obscureText: obscureText,
//           decoration: InputDecoration(
//             label: labelWidget,
//             filled: true,
//             fillColor: AppColor.white,
//             contentPadding: EdgeInsets.all(16.sp),
//             focusColor: Colors.white,
//             hintText: "Enter your phone number",
//             hintStyle: GoogleFonts.manrope(
//               fontSize: 14.sp,
//               color:   Color(0XFFA7AEC1),
//               fontWeight: FontWeight.w400,
//             ),
//             prefixIcon: InkWell(
//               onTap: enable==true?(){}: () {
//                 showCountryPicker(
//                   context: context,
//                   //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
//                   exclude: <String>['KN', 'MF'],
//                   favorite: <String>['SE'],
//                   //Optional. Shows phone code before the country name.
//                   showPhoneCode: true,
//                   onSelect: (Country country) async {
//
//                     state.updateCountry(code:country.phoneCode,emoji:  country.flagEmoji);
//                     print(state.countryCode);
//
//                   },
//                   countryListTheme: CountryListThemeData(
//                     borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(40.0),
//                       topRight: Radius.circular(40.0),
//                     ),
//                     // Optional. Styles the search field.
//                     inputDecoration: InputDecoration(
//                       labelText: 'Search',
//                       hintText: 'Search',
//                       prefixIcon: const Icon(Icons.search),
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: const Color(0xFF8C98A8).withOpacity(0.2),
//                         ),
//                       ),
//                     ),
//                     // Optional. Styles the text in the search field
//                     searchTextStyle: GoogleFonts.manrope(
//                       color: Colors.blue,
//                       fontSize: 18.sp,
//                     ),
//                   ),
//                 );
//               },
//               child: Container(
//                 width: 76.w,
//                 margin: EdgeInsets.all(5.sp),
//                 decoration: BoxDecoration(
//                   border: Border(
//                     right: BorderSide(color: AppColor.stoke, width: 1.w),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     12.widthSpace,
//                     FittedBox(
//                       child: TextComponents(
//                         title: "${state.countryEmoji}",
//                         size: 12.sp,
//                         weight: FontWeight.w400,
//                         color: Color(0XFFA7AEC1),
//                       ),
//                     ),
//                     FittedBox(
//                       child: TextComponents(
//                         title: "+${state.countryCode}",
//                         size: 12.sp,
//                         weight: FontWeight.w400,
//                         color: Color(0XFFA7AEC1)
//                       ),
//                     ),
//                     // FittedBox(
//                     //   child: SvgPicture.asset(
//                     //     AppIcons.arrowDownIcon ,
//                     //     height: 12.h,
//                     //     width: 12.w,color: Color(0XFFA7AEC1)
//                     //   ),
//                     // ),
//                   ],
//                 ),
//               ),
//             ),
//
//             // suffixIcon:
//             //     state.isPrefixIcon!
//             //         ? Padding(
//             //           padding: const EdgeInsets.all(8.0),
//             //           child: SvgPicture.asset(AppIcons.phoneIcon),
//             //         )
//             //         : Padding(
//             //           padding: const EdgeInsets.all(8.0),
//             //           child: SvgPicture.asset(AppIcons.emailIcon),
//             //         ),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(100.r),
//               borderSide: const BorderSide(color: AppColor.stoke),
//             ),
//             errorBorder: OutlineInputBorder(
//               borderSide: const BorderSide(color: Colors.red),
//               borderRadius: BorderRadius.circular(100.0.r),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(100.r),
//               borderSide: const BorderSide(color: AppColor.primary),
//             ),
//             // focusedErrorBorder: OutlineInputBorder(
//             //   borderSide: const BorderSide(color: Colors.red),
//             //   borderRadius: BorderRadius.circular(15.0.r),
//             // ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(100.r),
//               borderSide: const BorderSide(color: AppColor.stoke),
//             ),
//             errorStyle: const TextStyle(color: Colors.red, height: 0),
//           ),
//           controller: EditController,
//           validator: validator,
//           onChanged: onChanged, // Added this line for real-time validation
//         );
//       },
//     );
//   }
// }
