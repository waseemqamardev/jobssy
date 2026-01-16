// ignore_for_file: sized_box_for_whitespace, must_be_immutable


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; 

import 'custom_shimmer.dart';

class CustomCacheImage extends StatelessWidget {
  final String url;
  final String? errorImage;
  final double? height;
  double? width;
  BoxFit? fit;
  final String? name;
  bool? circular = false;
  double? borderRadius;
  CustomCacheImage({
    super.key,
    required this.url,
    this.height,
    this.name,
    this.circular,
    this.width,
    this.errorImage,
    this.fit, this.borderRadius
  });

  @override
  Widget build(BuildContext context) {
    // return circular == false
    //     ? CachedNetworkImage(
    //         imageUrl: url,
    //         height: height,
    //         imageBuilder: (context, imageProvider) {
    //           return Container(
    //             height: height,
    //             width: width,
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(borderRadius!.r),
    //               image: DecorationImage(
    //                 image: imageProvider,
    //                 fit: fit ?? BoxFit.cover,
    //               ),
    //             ),
    //           );
    //         },
    //         errorWidget: (context, url, error) {
    //           return Container(
    //             height: height,
    //             width: width,
    //             decoration: BoxDecoration(  borderRadius: BorderRadius.circular(borderRadius!.r),
    //               shape: circular == false
    //                   ? BoxShape.rectangle
    //                   : BoxShape.circle,
    //             ),
    //             child: ClipRRect(
    //               borderRadius: BorderRadius.circular(
    //                 circular == false ? 0 : borderRadius!,
    //               ),
    //               child: Image.asset(
    //                  ImagesUrls.gathro_logo_placeholder,
    //                 fit: BoxFit.cover,
    //               ),
    //             ),
    //           );
    //         },
    //         placeholder: (context, url) {
    //           return ShimmerEffect(height: height ?? 50,
    // width: width ?? 50,
    // borderRadius: borderRadius ?? 50,);
    //         },
    //         alignment: Alignment.center,
    //         fit: fit ?? BoxFit.cover,
    //       )
    //     : Container(
    //         height: height ?? 50,
    //         width: width ?? 50,
    //         child: CachedNetworkImage(
    //           imageUrl: url,
    //           fit: fit ?? BoxFit.cover,
    //           errorWidget: (context, url, error) {
    //             return Container(
    //               height: height,
    //               decoration: const BoxDecoration(shape: BoxShape.circle),
    //               child: ClipRRect(
    //                 borderRadius: BorderRadius.circular(borderRadius!.r),
    //                 child: Image.asset(
    //                  ImagesUrls.gathro_logo_placeholder,
    //                   fit: BoxFit.fill,
    //                 ),
    //               ),
    //             );
    //           },
    //           imageBuilder: (context, imageProvider) => ClipRRect(
    //             borderRadius: BorderRadius.circular(borderRadius!.r),
    //             child: Container(
    //               height: height ?? 50,
    //               width: width ?? 50,
    //               decoration: BoxDecoration(
    //                 shape: BoxShape.circle,
    //                 image: DecorationImage(
    //                   image: imageProvider,
    //                   fit: fit ?? BoxFit.cover,
    //                 ),
    //               ),
    //               //                backgroundImage: imageProvider,
    //             ),
    //           ),

    //           placeholder: (_, __) =>
    //                 ShimmerEffect(height: height ?? 50,
    // width: width ?? 50,
    // borderRadius: borderRadius ?? 50,),
    //         ),
    //       );
 
     return Image.asset(
                     url,
                    fit: BoxFit.cover,
                  );
  }
}
