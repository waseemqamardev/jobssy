 

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobssy/core/global_components/textstyle_component.dart';

import '../../core/configs/colors/app_colors.dart';
import '../../core/utils/extensions.dart';

class ReUseableRow extends StatelessWidget {
  final String icon;
  final String title;
  const ReUseableRow({Key? key, required this.icon, required this.title})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(icon,color: AppColor.black,),
        5.widthSpace,
        Expanded(
          child: TextComponents(
            title: title,
            size: 12.sp,
            color: AppColor.white70Color,
            weight: FontWeight.w500,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
