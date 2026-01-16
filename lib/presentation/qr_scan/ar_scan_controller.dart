import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScanController extends GetxController {
  late MobileScannerController scannerController;

  @override
  void onInit() {
    super.onInit();
    scannerController = MobileScannerController(
      detectionSpeed: DetectionSpeed.noDuplicates,
      facing: CameraFacing.back,
      // Torch state ko initial off rakha hai
    );
  }

  void toggleFlash() {
    scannerController.toggleTorch();
  }

  void handleDetection(BarcodeCapture capture) {
    final List<Barcode> barcodes = capture.barcodes;
    for (final barcode in barcodes) {
      if (barcode.rawValue != null) {
        debugPrint('Barcode found! ${barcode.rawValue}');
        scannerController.stop();
        Get.back(result: barcode.rawValue);
      }
    }
  }

  @override
  void onClose() {
    scannerController.dispose();
    super.onClose();
  }
}