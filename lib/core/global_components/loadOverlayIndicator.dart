import 'dart:ui';
 
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../core/configs/colors/app_colors.dart';

class LoadOverlayWidget extends StatelessWidget {
  final Widget child;
  const LoadOverlayWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
          overlayColor: Colors.transparent,

          overlayWidgetBuilder: (progress) {
            return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.1, sigmaY: 2.1),
              child: Padding(
                padding: EdgeInsets.only(top: 150.h),
                child: Center(
                  child: CircularProgressIndicator.adaptive(
                    value: 100,
                    backgroundColor: AppColor.primary,
                    padding: EdgeInsets.all(10.r),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      const Color.fromRGBO(131, 191, 219, 1),
                    ),
                  ),
                ),
              ),
            );
          },
          child: child,
        );
  }
}
