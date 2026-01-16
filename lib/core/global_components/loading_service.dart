import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 
class LoadingService {
  static bool _isDialogVisible = false;

  static void showLoading({
    required BuildContext context,
    String message = 'Loading...',
  }) {
    if (_isDialogVisible) return;
    _isDialogVisible = true;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: Material(  borderRadius: BorderRadius.circular(12.r),
            color: Colors.white,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              height: 150.h,
              // width: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator.adaptive(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    message,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).primaryColor,
                      decoration: TextDecoration.none,
                      
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static void hideLoading(BuildContext context) {
    if (_isDialogVisible) {
      Navigator.of(context, rootNavigator: true).pop();
      _isDialogVisible = false;
    }
  }
}
