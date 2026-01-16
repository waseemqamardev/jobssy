//
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:shimmer_animation/shimmer_animation.dart';
//
// class ShimmerEffect extends StatelessWidget {
//   const ShimmerEffect({
//     required this.height,
//     required this.width,
//     this.borderRadius = 8,
//     super.key,
//   });
//
//   final double height;
//   final double width;
//   final double borderRadius;
//
//   /// Square shimmer loader
//   const ShimmerEffect.square({
//     required double size,
//     this.borderRadius = 12,
//     super.key,
//   })  : height = size,
//         width = size;
//
//   @override
//   Widget build(BuildContext context) {
//     return Shimmer(
//       duration: const Duration(seconds: 2), // shimmer speed
//       interval: const Duration(seconds: 1), // delay between animations
//       color: Color(0XFFFFF3F3) ,          // shimmer color
//       colorOpacity: 0.7,                    // opacity
//       enabled: true,                        // enable shimmer
//       child: ClipRRect( borderRadius:
//              BorderRadius.circular(borderRadius ?? 12),
//         child: Container(
//
//           width: width,
//           height: height,
//           decoration: BoxDecoration(
//             color:  Color(0XFFFFF3F3) ,
//             borderRadius: BorderRadius.circular(borderRadius),
//           ),
//         ),
//       ),
//     );
//   }
// }class CustomShimmer extends StatelessWidget {
//   final double? borderRadius;
//   final bool isCircle;
//   final double height;
//   final double width;
//
//   const CustomShimmer({
//     super.key,
//     this.borderRadius,
//     this.isCircle = false,
//     required this.height,
//     required this.width,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Shimmer(
//       child: ClipRRect(
//         borderRadius: isCircle
//             ? BorderRadius.circular(width / 2)
//             : BorderRadius.circular(borderRadius ?? 0),
//         child: Container(
//           height: height,
//           width: width,
//           color: Color(0XFFFFF3F3)
//         ),
//       ),
//     );
//   }
// }
