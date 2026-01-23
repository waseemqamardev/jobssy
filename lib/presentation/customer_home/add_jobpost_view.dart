import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/customer_bottom_nav/customer_bottomnav.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/customfield_component.dart';
import '../../core/global_components/primary_button.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';

class AddJobPostView extends StatefulWidget {
  const AddJobPostView({super.key});

  @override
  State<AddJobPostView> createState() => _AddJobPostViewState();
}

class _AddJobPostViewState extends State<AddJobPostView> {
  bool isInfoAccurate = false;
  bool isPolicyAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.heightSpace,
            Row(
              children: [
                _buildCircleButton(Icons.arrow_back_ios_new, () => Get.back()),
                const Spacer(),
                Text(
                  "Add Job Post",
                  style: FontHelper.f16BoldStyle.copyWith(
                    color: AppColor.dark,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Spacer(),
                SizedBox(width: 44.w),
              ],
            ),
            24.heightSpace,
            _buildLabel("Job Role"),
            CustomFieldComponents(
              hintText: "Electrical Engineer",
              controller: TextEditingController(),
            ),
            16.heightSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLabel("Short Job Description"),
                Text("0/100",
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
              ],
            ),
            Container(
              height: 111.h,
              width: double.infinity,
              color: AppColor.white,
              child: CustomFieldComponents(
                hintText: "Write here...",
                controller: TextEditingController(),
              ),
            ),
            16.heightSpace,
            _buildLabel("Cover Image"),
            Container(
              height: 100.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(color: AppColor.border.withOpacity(0.5)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.iconsImageicon,
                    height: 22.h,
                    width: 22.w,
                  ),
                  4.heightSpace,
                  Text("Upload Cover Image",
                      style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
                ],
              ),
            ),
            16.heightSpace,
            _buildLabel("Pay"),
            CustomFieldComponents(
              hintText: "\$0",
              suffixIconWidget: Padding(
                padding: EdgeInsets.all(12.r),
                child: const Text("/hr",
                    style: TextStyle(
                      color: AppColor.dark,
                    )),
              ),
              controller: TextEditingController(),
            ),
            16.heightSpace,
            _buildLabel("City"),
            CustomFieldComponents(
              hintText: "Lorem Ipsum is a dummy text",
              controller: TextEditingController(),
            ),
            16.heightSpace,
            _buildLabel("Address"),
            CustomFieldComponents(
              hintText: "Lorem Ipsum is a dummy text",
              controller: TextEditingController(),
            ),
            20.heightSpace,
            _buildLabel("Start Date"),
            CustomFieldComponents(
              hintText: "00/00/00",
              suffixIconWidget: Image.asset(
                Assets.iconsCalendar,
                height: 18.h,
                width: 18.w,
              ),
              controller: TextEditingController(),
            ),
            16.heightSpace,
            _buildLabel("Job Time"),
            Row(
              children: [
                Expanded(
                  child: CustomFieldComponents(
                    hintText: "From",
                    controller: TextEditingController(),
                  ),
                ),
                15.widthSpace,
                Expanded(
                  child: CustomFieldComponents(
                    hintText: "To",
                    controller: TextEditingController(),
                  ),
                ),
              ],
            ),
            25.heightSpace,
            _buildCheckboxRow(
                "I confirm that the information provided is accurate.",
                isInfoAccurate, (val) {
              setState(() => isInfoAccurate = val!);
            }),
            10.heightSpace,
            _buildCheckboxRow("I agree to Jobssy's business posting policies.",
                isPolicyAgreed, (val) {
              setState(() => isPolicyAgreed = val!);
            }),
            30.heightSpace,
            PrimaryButton(
              onTap: () {
                _showSuccessDialog(context);
              },
              childWidget: Text(
                "Post Job",
                style: FontHelper.f16BoldStyle.copyWith(color: Colors.white),
              ),
              bgColor: AppColor.primary,
              width: double.infinity,
              height: 50.h,
              borderRadius: 12.r,
            ),
            40.heightSpace,
          ],
        ),
      ),
    );
  }

  Widget _buildCircleButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 44.r,
        width: 44.r,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColor.border),
        ),
        child: Icon(icon, size: 16.sp, color: AppColor.dark),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        text,
        style: FontHelper.f13w500MediumStyle.copyWith(
          color: AppColor.dark,
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
                  "Job Posted",
                  style: FontHelper.f24w500MediumStyle.copyWith(
                      color: AppColor.black, fontWeight: FontWeight.w600),
                ),
                12.heightSpace,
                Text(
                  "Your job has been posted. You will get notification when employees start applying.",
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
                    Get.offAll(() => const CustomerBottomNav());
                  },
                  childWidget: Text(
                    "Ok",
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

  Widget _buildCheckboxRow(String text, bool value, Function(bool?) onChanged) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 24.h,
          width: 24.w,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: AppColor.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r)),
          ),
        ),
        10.widthSpace,
        Expanded(
          child: Text(
            text,
            style: FontHelper.f13w400Regular.copyWith(
              color: AppColor.tertiary,
            ),
          ),
        ),
      ],
    );
  }
}
