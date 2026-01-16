import 'package:flutter/material.dart'; 

class LinearProgressBar extends StatelessWidget {
  final int? maxSteps;
  final int? currentStep;
  final Color? progressColor;
  final Color? backgroundColor;
  final String? semanticsLabel;
  final String? semanticsValue;
  final double? minHeight;
  final int? progressType;
  final Animation<Color?>? valueColor;
  final BorderRadiusGeometry? borderRadius;
  final Axis? dotsAxis;
  final EdgeInsets dotsSpacing;
  final double dotsActiveSize;
  final double dotsInactiveSize;

  const LinearProgressBar({
    super.key,
    this.progressColor = Colors.red,
    this.backgroundColor = Colors.white,
    this.maxSteps = 1,
    this.currentStep = 0,
    this.minHeight = 10,
    this.semanticsLabel,
    this.semanticsValue,
    this.valueColor,
    this.progressType,
    this.dotsAxis = Axis.horizontal,
    this.dotsSpacing = EdgeInsets.zero,
    this.dotsActiveSize = 8,
    this.dotsInactiveSize = 8,
    this.borderRadius,
  });

  static final int progressTypeLinear = 1;
  static final int progressTypeDots = 2;

  @override
  Widget build(BuildContext context) {
     

    double value = 1;
    double current = 1;

    if (maxSteps != null) {
      value = 1 / maxSteps!;
    } else {
      value = 1 / 1;
    }

    if (currentStep != null) {
      current = value * currentStep!;
    } else {
      current = value * 1;
    }

    return typeChooser(current, currentStep!.ceilToDouble(),  );
  }

  Widget typeChooser(double current, double dotsStep, ) {
     if (progressType == progressTypeLinear) {
      return LinearProgressIndicator(
        value: current,
        backgroundColor: backgroundColor,
        color: progressColor,
        semanticsLabel: semanticsLabel,
        semanticsValue: semanticsValue,
        minHeight: minHeight,
        valueColor: valueColor,
        borderRadius: borderRadius ?? BorderRadius.zero,
      );
    }

    return LinearProgressIndicator(
      value: current,
      backgroundColor: backgroundColor,
      color: progressColor,
      semanticsLabel: semanticsLabel,
      semanticsValue: semanticsValue,
      minHeight: minHeight,
      valueColor: valueColor,
      borderRadius: borderRadius ?? BorderRadius.zero,
    );
  }
}