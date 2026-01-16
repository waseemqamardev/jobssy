import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/home/application_success_view.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/primary_button.dart';
import '../../core/utils/extensions.dart';

class JobApplicationView extends StatefulWidget {
  const JobApplicationView({super.key});

  @override
  State<JobApplicationView> createState() => _JobApplicationViewState();
}

class _JobApplicationViewState extends State<JobApplicationView> {
  // Checkbox states
  bool arriveOnTime = true;
  bool completeFullShift = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 100.h,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Job Application",
          style: FontHelper.f24w500MediumStyle.copyWith(
            color: AppColor.black,
            fontWeight: FontWeight.w700,
            fontSize: 26.sp,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              color: AppColor.border,
              thickness: 1,
            ),
            15.heightSpace,
            Text(
              "Your privacy and security are our top priorities. Here's how we protect your data and ensure a safe experience on our app.",
              style: FontHelper.f12w500MediumStyle.copyWith(
                color: AppColor.tertiary,
                fontWeight: FontWeight.w400,
              ),
            ),
            15.heightSpace,

            Text("Who can see my information?", style: FontHelper.f16w500MediumStyle.copyWith(color:AppColor.black,fontWeight: FontWeight.w700)),
            15.heightSpace,
            Text(
              "Only you can see your full personal data. Internal access is strictly limited to authorized personnel and only for support or operational purposes.",
              style: FontHelper.f12w500MediumStyle.copyWith(color: AppColor.tertiary, fontWeight: FontWeight.w400),
            ),
            30.heightSpace,

            Text("Contact Us",style: FontHelper.f16w500MediumStyle.copyWith(color:AppColor.black,fontWeight: FontWeight.w700)),
            15.heightSpace,
            Text(
              "If you have questions or concerns about your privacy or data security, contact our Data Protection Officer:",
              style: FontHelper.f12w500MediumStyle.copyWith(color: AppColor.tertiary, fontWeight: FontWeight.w400),
            ),
            15.heightSpace,

            _buildContactRow(Icons.email_outlined, "privacy@yourapp.com"),
            _buildContactRow(Icons.phone_outlined, "+1 (123) 456-7890"),

            15.heightSpace,

            _buildAgreementCheckbox(
                "I agree to arrive on time",
                arriveOnTime,
                    (val) => setState(() => arriveOnTime = val!)
            ),
            _buildAgreementCheckbox(
                "I agree to complete the full shift.",
                completeFullShift,
                    (val) => setState(() => completeFullShift = val!)
            ),

            const Spacer(),

            PrimaryButton(
              height: 48.h,
              onTap: () {
                Get.offAll(() => const ApplicationSuccessView());
              },
              childWidget: Text(
                "Confirm and Apply",
                style: FontHelper.f15w500MediumStyle.copyWith(
                    fontWeight: FontWeight.w600, color: AppColor.white),
              ),
              bgColor: AppColor.primary,
              borderRadius: 11.85.r,
              width: double.infinity,
            ),
            20.heightSpace,
          ],
        ),
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16.sp, color:  AppColor.tertiary),
        10.widthSpace,
        Text(text, style: FontHelper.f12w500MediumStyle.copyWith(color: AppColor.tertiary,fontWeight: FontWeight.w400)),
      ],
    );
  }

  Widget _buildAgreementCheckbox(String title, bool value, Function(bool?) onChanged) {
    return Row(
      children: [
        SizedBox(
          height: 24.w,
          width: 24.w,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: AppColor.primary,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
          ),
        ),
        10.widthSpace,
        Text(title, style:  FontHelper.f12w500MediumStyle.copyWith(color: AppColor.black,fontWeight: FontWeight.w400)),
      ],
    );
  }
}