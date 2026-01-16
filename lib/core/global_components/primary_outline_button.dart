 
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryOutLineButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget childWidget;
  final double? width;
  final double? height;
  final double? borderRadius, elevation;
  final bool isShape;
  final IconData? iconData;
 final Color borderColor;
  final Color? bgColor;
  const PrimaryOutLineButton({
    Key? key,
    required this.onTap,
    this.isShape = false,
    required this.childWidget,
    this.width,
    this.height,
    this.elevation = 0,
    this.borderRadius = 12,
    required this.bgColor,
    this.iconData,required this.borderColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  borderRadius: BorderRadius.circular(borderRadius!),
      
      onTap: () {
        onTap();
      },
      child: Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        height: height ?? 55.h,
        alignment: Alignment.center,
        width: width ?? 100.w,
        decoration: BoxDecoration(
          color: bgColor,
          shape:  BoxShape.rectangle,
          border:  Border.all( color: borderColor)  ,
          borderRadius:   BorderRadius.circular(borderRadius!),
        ),
        child: childWidget,
      ),
    );
  }
}
