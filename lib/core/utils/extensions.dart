 
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 
import 'package:flutter/material.dart'; 

extension SizedBoxExtension on num {
  SizedBox get heightSpace =>
      SizedBox(height: kIsWeb ? toDouble() : toDouble().h);

  SizedBox get widthSpace =>
      SizedBox(width: kIsWeb ? toDouble() : toDouble().w);

  SizedBox get space => SizedBox(
    width: kIsWeb ? toDouble() : toDouble().w,
    height: kIsWeb ? toDouble() : toDouble().h,
  );
}
 