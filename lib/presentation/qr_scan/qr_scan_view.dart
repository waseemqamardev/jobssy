import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../core/configs/font_style.dart';
import 'ar_scan_controller.dart';

class QRScanView extends StatelessWidget {
  const QRScanView({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller initialize karein
    final controller = Get.put(QRScanController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // 1. Live Camera Feed
          MobileScanner(
            controller: controller.scannerController,
            onDetect: (capture) => controller.handleDetection(capture),
          ),

          // 2. Translucent Overlay with Cutout
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6),
              BlendMode.srcOut,
            ),
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    backgroundBlendMode: BlendMode.dstOut,
                  ),
                ),
                Center(
                  child: Container(
                    height: 260.h,
                    width: 260.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 3. Scanner Frame Corners
          Center(
            child: SizedBox(
              height: 260.h,
              width: 260.w,
              child: CustomPaint(painter: ScannerOverlayPainter()),
            ),
          ),

          // 4. Top Header (Bina Flash Button ke)
          Positioned(
            top: 50.h,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () => Get.back(),
                  ),
                  const Spacer(),
                  Text(
                    "QR Scan",
                    style: FontHelper.f24w500MediumStyle.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  // UI ko balance rakhne ke liye empty space
                  SizedBox(width: 48.w),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Corner Borders logic remains the same
class ScannerOverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    const cornerLength = 30.0;
    canvas.drawPath(Path()..moveTo(0, cornerLength)..lineTo(0, 0)..lineTo(cornerLength, 0), paint);
    canvas.drawPath(Path()..moveTo(size.width - cornerLength, 0)..lineTo(size.width, 0)..lineTo(size.width, cornerLength), paint);
    canvas.drawPath(Path()..moveTo(0, size.height - cornerLength)..lineTo(0, size.height)..lineTo(cornerLength, size.height), paint);
    canvas.drawPath(Path()..moveTo(size.width - cornerLength, size.height)..lineTo(size.width, size.height)..lineTo(size.width, size.height - cornerLength), paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}