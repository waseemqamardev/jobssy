import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';

class FaceIdView extends StatefulWidget {
  const FaceIdView({super.key});

  @override
  State<FaceIdView> createState() => _FaceIdViewState();
}

class _FaceIdViewState extends State<FaceIdView> {
  CameraController? _cameraController;
  bool _isCameraReady = false;
  bool _permissionDenied = false;

  @override
  void initState() {
    super.initState();
    _checkPermissionAndInit();
  }

  /// 🔐 Permission handling
  Future<void> _checkPermissionAndInit() async {
    final status = await Permission.camera.status;

    if (status.isGranted) {
      _initCamera();
    } else {
      final result = await Permission.camera.request();
      if (result.isGranted) {
        _initCamera();
      } else {
        setState(() => _permissionDenied = true);
      }
    }
  }

  /// 📷 Camera init
  Future<void> _initCamera() async {
    final cameras = await availableCameras();
    final frontCamera = cameras.firstWhere(
          (c) => c.lensDirection == CameraLensDirection.front,
    );

    _cameraController = CameraController(
      frontCamera,
      ResolutionPreset.high,
      enableAudio: false,
    );

    await _cameraController!.initialize();
    setState(() => _isCameraReady = true);
  }

  /// 📸 Capture image
  Future<void> _captureFace() async {
    if (!_cameraController!.value.isInitialized) return;

    final image = await _cameraController!.takePicture();
    Get.back(result: File(image.path));
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.reLightGrey,
      body: SafeArea(
        child: Stack(
          children: [
            if (_permissionDenied)
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.camera_alt_outlined,
                      size: 60,
                      color: Colors.white,
                    ),
                    16.verticalSpace,
                    const Text(
                      "Camera permission is required",
                      style: TextStyle(color: Colors.white),
                    ),
                    12.verticalSpace,
                    ElevatedButton(
                      onPressed: openAppSettings,
                      child: const Text("Open Settings"),
                    ),
                  ],
                ),
              ),

            /// Camera Preview
            if (_isCameraReady)
              Positioned.fill(
                child: CameraPreview(_cameraController!),
              ),

            /// Blue overlay with oval cutout
            if (_isCameraReady)
              Positioned.fill(
                child: CustomPaint(
                  painter: FaceOverlayPainter(),
                ),
              ),

            /// Back button
            Positioned(
              top: 16.h,
              left: 16.w,
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ),

            /// Instruction text
            if (_isCameraReady)
              Positioned(
                bottom: 200.h,
                left: 0,
                right: 0,
                child: Text(
                  "Keep your face within the oval",
                  textAlign: TextAlign.center,
                  style: FontHelper.f14w500MediumStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColor.white,
                  ),
                ),
              ),

            /// Capture button
            if (_isCameraReady)
              Positioned(
                bottom: 60.h,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: _captureFace,
                  child: Container(
                    width: 64.w,
                    height: 64.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.white.withOpacity(0.60),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    // child: Container(
                    //   margin: EdgeInsets.all(6.r),
                    //   decoration: const BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     color: Colors.white,
                    //   ),
                    // ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class FaceOverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final fullRect = Rect.fromLTWH(0, 0, size.width, size.height);

    final ovalRect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2 - 40),
      width: 317.w,
      height: 348.h,
    );

    /// Blue translucent overlay
    final overlayPaint = Paint()
      ..shader = RadialGradient(
        center: Alignment.center,
        radius: 0.9,
        colors: [
          AppColor.reLightGrey.withOpacity(0.85),
          AppColor.reLightGrey.withOpacity(0.85),
        ],
      ).createShader(fullRect);

    final path = Path()
      ..addRect(fullRect)
      ..addOval(ovalRect)
      ..fillType = PathFillType.evenOdd;

    canvas.drawPath(path, overlayPaint);

    /// Blue oval border
    final borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..color = AppColor.reLightGrey;

    canvas.drawOval(ovalRect, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
