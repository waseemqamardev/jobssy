import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/primary_button.dart';
import '../../core/global_components/customfield_component.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';

class ContactSupportView extends StatefulWidget {
  const ContactSupportView({super.key});

  @override
  State<ContactSupportView> createState() => _ContactSupportViewState();
}

class _ContactSupportViewState extends State<ContactSupportView> {
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController attachmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            20.heightSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
              child: Row(
                children: [
                  _buildCircleButton(
                      Icons.arrow_back_ios_new, () => Get.back()),
                  const Spacer(),
                  Text(
                    "Contact Support",
                    style: FontHelper.f16BoldStyle.copyWith(
                      color: AppColor.dark,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(width: 44.w), // Balance ke liye
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    24.heightSpace,
                    _buildLabel("Subject"),
                    CustomFieldComponents(
                      hintText: "Write here",
                      controller: subjectController,
                    ),
                    16.heightSpace,
                    _buildLabel("Description"),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: AppColor.border),
                      ),
                      child: TextField(
                        controller: descriptionController,
                        maxLines: 6,
                        decoration: InputDecoration(
                          hintText: "Write here in detail",
                          hintStyle: FontHelper.f14w400Regular
                              .copyWith(color: AppColor.tertiary),
                          contentPadding: EdgeInsets.all(15.r),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    16.heightSpace,
                    _buildLabel("Attachment (Optional)"),
                    CustomFieldComponents(
                      hintText: "Upload or Attach here",
                      controller: attachmentController,
                      suffixIconWidget: Image.asset(
                        Assets.iconsAttachment,
                        height: 18.h,
                        width: 18.w,
                      ),
                      onSuffixIconTap: () {},
                    ),
                    16.heightSpace,
                    PrimaryButton(
                      height: 52.h,
                      onTap: () {},
                      childWidget: Text(
                        "Send",
                        style: FontHelper.f16w500MediumStyle.copyWith(
                            fontWeight: FontWeight.w600, color: AppColor.white),
                      ),
                      bgColor: const Color(0xffA6C8FF),
                      borderRadius: 12.r,
                      width: double.infinity,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Label Style helper
  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        text,
        style: FontHelper.f14w500MediumStyle.copyWith(
          color: AppColor.dark,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // Header Back Button helper
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
}
