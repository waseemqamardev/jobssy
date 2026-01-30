// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import '../../core/configs/colors/app_colors.dart';
// import '../../core/configs/font_style.dart';
// import '../../core/global_components/customfield_component.dart';
// import '../../core/global_components/primary_button.dart';
// import '../../core/utils/extensions.dart';
// import '../../generated/assets.dart';
//
// class ScanOngoingJobDetailView extends StatefulWidget {
//   const ScanOngoingJobDetailView({super.key});
//
//   @override
//   State<ScanOngoingJobDetailView> createState() =>
//       _ScanOngoingJobDetailViewState();
// }
//
// class _ScanOngoingJobDetailViewState extends State<ScanOngoingJobDetailView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color(0xFFDAF0FF),
//               Color(0xFFEEF9FF),
//               Color(0xFFDFE0E2),
//             ],
//           ),
//         ),
//         child: SafeArea(
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     _buildCircleButton(
//                         Icons.arrow_back_ios_new, () => Get.back()),
//                     Text("Job Details",
//                         style: FontHelper.f16BoldStyle.copyWith(
//                             color: AppColor.dark, fontWeight: FontWeight.w700)),
//                     _buildCircleButton(Icons.more_vert, () {}),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   padding: EdgeInsets.symmetric(horizontal: 18.w),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       10.heightSpace,
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(20.r),
//                         child: Image.asset(
//                           Assets.imagesCoffeeshop,
//                           width: double.infinity,
//                           height: 136.h,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       24.heightSpace,
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               Text("Coffee Shop",
//                                   style: FontHelper.f20BoldStyle.copyWith(
//                                       fontWeight: FontWeight.w700,
//                                       color: AppColor.dark)),
//                               5.widthSpace,
//                               Image.asset(
//                                 Assets.iconsVerificationBadget,
//                                 width: 20.w,
//                                 height: 20.h,
//                               )
//                             ],
//                           ),
//                           Container(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 12.w, vertical: 6.h),
//                             decoration: BoxDecoration(
//                               color: const Color(0xffFFF4EC),
//                               borderRadius: BorderRadius.circular(20.r),
//                             ),
//                             child: Text("Upcoming",
//                                 style: TextStyle(
//                                     color: Colors.orange,
//                                     fontSize: 11.sp,
//                                     fontWeight: FontWeight.bold)),
//                           ),
//                         ],
//                       ),
//                       16.heightSpace,
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Text(
//                             "Assigned to",
//                             style: FontHelper.f12w500MediumStyle.copyWith(
//                               color: AppColor.dark,
//                             ),
//                           ),
//                           const Spacer(),
//                           const Icon(Icons.arrow_forward,
//                               size: 14, color: Colors.grey),
//                           const Spacer(),
//                           ClipOval(
//                               child: Image.asset(Assets.imagesHomeprofile,
//                                   height: 24.r, width: 24.r)),
//                           8.widthSpace,
//                           Text(
//                             "John Doe",
//                             style: FontHelper.f12w500MediumStyle.copyWith(
//                               color: AppColor.black,
//                             ),
//                           ),
//                         ],
//                       ),
//                       16.heightSpace,
//                       _buildDetailRow(
//                           Assets.iconsJobdetailsuitcase, "Electrical Engineer"),
//                       _buildDetailRow(
//                           Assets.iconsJobdetailloc, "123 Street, Lorem Ipsum"),
//                       _buildDetailRow(Assets.iconsJobdetailbuilding, "Dubai"),
//                       _buildDetailRow(Assets.iconsJobdetailpay, "\$30/hr"),
//                       _buildDetailRow(Assets.iconsJobdetailcalender, "18 Dec"),
//                       _buildDetailRow(
//                           Assets.iconsJobdetailtime, "8:00 AM - 11:00 AM"),
//                       16.heightSpace,
//                       Text("Short Description",
//                           style: FontHelper.f13w400Regular
//                               .copyWith(color: AppColor.dark)),
//                       5.heightSpace,
//                       Text(
//                           "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's...",
//                           style: FontHelper.f12w500MediumStyle.copyWith(
//                               color: AppColor.dark, fontWeight: FontWeight.w400)),
//                       20.heightSpace,
//                       Row(
//                         children: [
//                           Expanded(
//                             child: PrimaryButton(
//                               height: 48.h,
//                               // width: 143.w,
//                               onTap: () {},
//                               childWidget: Text(
//                                 "Scan Qr Code",
//                                 style: FontHelper.f14w500MediumStyle.copyWith(
//                                     fontWeight: FontWeight.w700,
//                                     color: AppColor.primary),
//                               ),
//                               bgColor: Colors.transparent,
//                               borderColor: AppColor.primary,
//                               borderRadius: 11.85.r,
//                             ),
//                           ),
//                           16.widthSpace,
//                           Text(
//                             "OR",
//                             style: FontHelper.f12w400Regular
//                                 .copyWith(color: AppColor.dark),
//                           ),
//                           16.widthSpace,
//                           Expanded(
//                             child: PrimaryButton(
//                               height: 48.h,
//                               // width: 143.w,
//                               onTap: () {
//                                 _showEditSheet();
//                               },
//                               childWidget: Text(
//                                 "Share OTP",
//                                 style: FontHelper.f14w500MediumStyle.copyWith(
//                                     fontWeight: FontWeight.w700,
//                                     color: AppColor.primary),
//                               ),
//                               bgColor: Colors.transparent,
//                               borderColor: AppColor.primary,
//                               borderRadius: 11.85.r,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _showEditSheet() {
//     final controller = TextEditingController();
//
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (context) {
//         return Container(
//           width: double.infinity,
//           // height: double.infinity,
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 Color(0xFFDAF0FF),
//                 Color(0xFFEEF9FF),
//                 Color(0xFFDFE0E2),
//               ],
//             ),
//           ),
//           child: Padding(
//             padding: EdgeInsets.only(
//               bottom: MediaQuery.of(context).viewInsets.bottom,
//             ),
//             child: Container(
//               padding: EdgeInsets.all(20.r),
//               decoration: BoxDecoration(
//                 color: Colors.transparent,
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   20.heightSpace,
//                   Text(
//                     "4 Digit Otp",
//                     style: FontHelper.f18BoldStyle.copyWith(color: AppColor.dark),
//                   ),
//                   const Divider(),
//                   15.heightSpace,
//                   Text(
//                     "One Time Passcode",
//                     style: FontHelper.f13w500MediumStyle.copyWith(
//                       color: AppColor.dark,
//                     ),
//                   ),
//                   8.heightSpace,
//                   CustomFieldComponents(
//                     controller: controller,
//                     hintText: "1234",
//                     borderColor: AppColor.border,
//                     hintStyle:
//                         FontHelper.f13w400Regular.copyWith(color: AppColor.dark),
//                     suffixIconWidget: Text(
//                       "Refresh",
//                       style: FontHelper.f12w500MediumStyle.copyWith(
//                         color: AppColor.primary,
//                       ),
//                     ),
//                   ),
//                   16.heightSpace,
//                   Text(
//                     "*Share this OTP with the employee so he can start working on the assigned job.",
//                     style: FontHelper.f12w400Regular.copyWith(
//                       color: AppColor.dark,
//                     ),
//                   ),
//                   25.heightSpace,
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildCircleButton(IconData icon, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: 44.h,
//         width: 44.w,
//         decoration: BoxDecoration(
//           color: AppColor.white,
//           borderRadius: BorderRadius.circular(12.r),
//           border: Border.all(color: AppColor.border),
//         ),
//         child: Icon(icon, size: 16.sp, color: AppColor.dark),
//       ),
//     );
//   }
//
//   Widget _buildDetailRow(String iconAsset, String text) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 10.h),
//       child: Row(
//         children: [
//           Image.asset(iconAsset, height: 20.h, width: 20.r),
//           6.widthSpace,
//           Text(text,
//               style: FontHelper.f12w500MediumStyle.copyWith(
//                 color: AppColor.dark,
//               )),
//         ],
//       ),
//     );
//   }
// }
//




import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/qr_scan/rejected_job_view.dart';
import 'package:jobssy/presentation/qr_scan/scanqr_employee_feedback_view.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/customfield_component.dart';
import '../../core/global_components/primary_button.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';

enum JobStatus { upcoming, ongoing, finished }

class ScanJobDetailView extends StatefulWidget {
  const ScanJobDetailView({super.key});

  @override
  State<ScanJobDetailView> createState() => _ScanJobDetailViewState();
}

class _ScanJobDetailViewState extends State<ScanJobDetailView> {
  JobStatus _status = JobStatus.upcoming;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFDAF0FF),
              Color(0xFFEEF9FF),
              Color(0xFFDFE0E2),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.heightSpace,
                      _buildHeaderImage(),
                      24.heightSpace,
                      _buildTitleRow(),
                      16.heightSpace,
                      _buildAssignedRow(),
                      16.heightSpace,
                      _buildDetails(),
                      16.heightSpace,
                      _buildDescription(),
                      24.heightSpace,
                      _buildStatusActions(),
                      30.heightSpace,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: AppColor.white,
          insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  Assets.imagesSuccessdialog,
                  width: 170.w,
                  height: 180.h,
                  fit: BoxFit.contain,
                ),
                20.heightSpace,
                Text(
                  "You Approved this Job",
                  style: FontHelper.f24w500MediumStyle.copyWith(
                      color: AppColor.black, fontWeight: FontWeight.w600),
                ),
                12.heightSpace,
                Text(
                  "This job has been approved by you as employee completed this job successfully. Share your feedback and rate the employee.",
                  textAlign: TextAlign.center,
                  style: FontHelper.f14w400Regular.copyWith(
                    color: AppColor.tertiary,
                    height: 1.5,
                  ),
                ),
                30.heightSpace,
                PrimaryButton(
                  height: 48.h,
                  onTap: () {
                    Get.back();
                    Get.offAll(() => const ScanQrEmployeeFeedbackView());
                  },
                  childWidget: Text(
                    "Rate Employee",
                    style: FontHelper.f15w600SemiBold
                        .copyWith(color: AppColor.white),
                  ),
                  bgColor: AppColor.primary,
                  borderRadius: 12.r,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        );
      },
    );
  }



  void _showEditSheet() {
    final controller = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          width: double.infinity,
          // height: double.infinity,
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12.r),
              topLeft: Radius.circular(12.r),
            ),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFDAF0FF),
                Color(0xFFEEF9FF),
                Color(0xFFDFE0E2),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.heightSpace,
                  Text(
                    "4 Digit Otp",
                    style: FontHelper.f18BoldStyle.copyWith(color: AppColor.dark),
                  ),
                  const Divider(),
                  15.heightSpace,
                  Text(
                    "One Time Passcode",
                    style: FontHelper.f13w500MediumStyle.copyWith(
                      color: AppColor.dark,
                    ),
                  ),
                  8.heightSpace,
                  CustomFieldComponents(
                    controller: controller,
                    hintText: "1234",
                    borderColor: AppColor.border,
                    hintStyle:
                    FontHelper.f13w400Regular.copyWith(color: AppColor.dark),
                    suffixIconWidget: Text(
                      "Refresh",
                      style: FontHelper.f12w500MediumStyle.copyWith(
                        color: AppColor.primary,
                      ),
                    ),
                  ),
                  16.heightSpace,
                  Text(
                    "*Share this OTP with the employee so he can start working on the assigned job.",
                    style: FontHelper.f12w400Regular.copyWith(
                      color: AppColor.dark,
                    ),
                  ),
                  25.heightSpace,
                ],
              ),
            ),
          ),
        );
      },
    );
  }


  // ---------------- APP BAR ----------------

  Widget _buildAppBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _circleButton(Icons.arrow_back_ios_new, () => Get.back()),
          Text(
            "Job Details",
            style: FontHelper.f16BoldStyle.copyWith(
              color: AppColor.dark,
              fontWeight: FontWeight.w700,
            ),
          ),
          PopupMenuButton<JobStatus>(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              setState(() => _status = value);
            },
            itemBuilder: (_) => const [
              PopupMenuItem(
                value: JobStatus.upcoming,
                child: Text("Upcoming"),
              ),
              PopupMenuItem(
                value: JobStatus.ongoing,
                child: Text("Ongoing"),
              ),
              PopupMenuItem(
                value: JobStatus.finished,
                child: Text("Finished"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ---------------- HEADER IMAGE ----------------

  Widget _buildHeaderImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Image.asset(
        Assets.imagesCoffeeshop,
        width: double.infinity,
        height: 136.h,
        fit: BoxFit.cover,
      ),
    );
  }

  // ---------------- TITLE + STATUS ----------------

  Widget _buildTitleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              "Coffee Shop",
              style: FontHelper.f20BoldStyle.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColor.dark,
              ),
            ),
            5.widthSpace,
            Image.asset(
              Assets.iconsVerificationBadget,
              width: 20.w,
              height: 20.h,
            ),
          ],
        ),
        _buildStatusChip(),
      ],
    );
  }

  Widget _buildStatusChip() {
    switch (_status) {
      case JobStatus.upcoming:
        return _chip("Upcoming", Colors.orange, const Color(0xffFFF4EC));
      case JobStatus.ongoing:
        return _chip("Ongoing", Colors.green, const Color(0xffE7F8F1));
      case JobStatus.finished:
        return _chip(
          "Finished",
          AppColor.primary,
          AppColor.primary.withOpacity(0.1),
        );
    }
  }

  Widget _chip(String text, Color textColor, Color bg) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 11.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // ---------------- ASSIGNED ROW ----------------

  Widget _buildAssignedRow() {
    return Row(
      children: [
        Text(
          "Assigned to",
          style: FontHelper.f12w500MediumStyle.copyWith(
            color: AppColor.dark,
          ),
        ),
        const Spacer(),
        const Icon(Icons.arrow_forward, size: 14, color: Colors.grey),
        const Spacer(),
        ClipOval(
          child: Image.asset(
            Assets.imagesHomeprofile,
            height: 24.r,
            width: 24.r,
          ),
        ),
        8.widthSpace,
        Text(
          "John Doe",
          style: FontHelper.f12w500MediumStyle.copyWith(
            color: AppColor.black,
          ),
        ),
      ],
    );
  }

  // ---------------- DETAILS ----------------

  Widget _buildDetails() {
    return Column(
      children: [
        _detailRow(Assets.iconsJobdetailsuitcase, "Electrical Engineer"),
        _detailRow(Assets.iconsJobdetailloc, "123 Street, Lorem Ipsum"),
        _detailRow(Assets.iconsJobdetailbuilding, "Dubai"),
        _detailRow(Assets.iconsJobdetailpay, "\$30/hr"),
        _detailRow(Assets.iconsJobdetailcalender, "18 Dec"),
        _detailRow(Assets.iconsJobdetailtime, "8:00 AM - 11:00 AM"),
      ],
    );
  }

  Widget _detailRow(String icon, String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: [
          Image.asset(icon, height: 20.h, width: 20.w),
          6.widthSpace,
          Text(
            text,
            style: FontHelper.f12w500MediumStyle.copyWith(
              color: AppColor.dark,
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- DESCRIPTION ----------------

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Short Description",
          style: FontHelper.f13w400Regular.copyWith(
              color: AppColor.dark,
              fontWeight: FontWeight.w700
          ),
        ),
        6.heightSpace,
        Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          style: FontHelper.f12w500MediumStyle.copyWith(
            color: AppColor.dark,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  // ---------------- ACTIONS (DYNAMIC) ----------------

  Widget _buildStatusActions() {
    switch (_status) {
      case JobStatus.upcoming:
        return Row(
          children: [
            Expanded(
              child: PrimaryButton(
                height: 48.h,
                bgColor: Colors.transparent,
                borderColor: AppColor.primary,
                onTap: () {},
                childWidget: Text(
                  "Scan QR Code",
                  style: FontHelper.f14w500MediumStyle.copyWith(
                    color: AppColor.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            16.widthSpace,
            Expanded(
              child: PrimaryButton(
                height: 48.h,
                bgColor: Colors.transparent,
                borderColor: AppColor.primary,
                onTap: () {
                  _showEditSheet();
                },
                childWidget: Text(
                  "Share OTP",
                  style: FontHelper.f14w500MediumStyle.copyWith(
                    color: AppColor.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        );

      case JobStatus.ongoing:
        return const SizedBox();

      case JobStatus.finished:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Employee marked this job as completed",
              style: FontHelper.f13w400Regular.copyWith(
                  color: AppColor.dark,
                  fontWeight: FontWeight.w700
              ),
            ),
            12.heightSpace,
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    height: 48.h,
                    bgColor: AppColor.red,
                    onTap: () {
                      Get.to(const RejectedJobView());
                    },
                    childWidget:  Text("Reject"
                      ,
                      style: FontHelper.f14w400Regular.copyWith(
                        color: AppColor.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                16.widthSpace,
                Expanded(
                  child: PrimaryButton(
                    height: 48.h,
                    bgColor: AppColor.primary,
                    onTap: () {
                      _showSuccessDialog(context);
                    },
                    childWidget:  Text("Approve"
                      ,
                      style: FontHelper.f14w400Regular.copyWith(
                        color: AppColor.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
    }
  }

  // ---------------- COMMON BUTTON ----------------



  Widget _circleButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44.h,
        width: 44.w,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColor.border),
        ),
        child: Icon(icon, size: 16.sp, color: AppColor.dark),
      ),
    );
  }



}
