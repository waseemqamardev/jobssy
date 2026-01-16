import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/global_components/primary_button.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/customfield_component.dart'; // Ensure filename is correct
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';

class AddJobPostView extends StatefulWidget {
  const AddJobPostView({super.key});

  @override
  State<AddJobPostView> createState() => _AddJobPostViewState();
}

class _AddJobPostViewState extends State<AddJobPostView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String selectedHour = "1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Edit Profile",
          style: FontHelper.f24w500MediumStyle.copyWith(
            color: AppColor.black,
            fontWeight: FontWeight.w700,
            fontSize: 26.sp,
          ),
        ),
      ),
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(
                color: AppColor.border,
                thickness: 1,
              ),
              15.heightSpace,
              Text(
                "Enter details below",
                style: FontHelper.f14w500MediumStyle
                    .copyWith(color: Colors.grey.shade500),
              ),
              15.heightSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    CustomFieldComponents(
                      hint: "Job Title",
                      hintText: "Driver",
                      controller: nameController,
                    ),
                    12.heightSpace,
                    CustomFieldComponents(
                      hint: "Shift Time",
                      hintText: "10 am",
                      controller: nameController,
                      suffixIconWidget: Icon(Icons.keyboard_arrow_down_outlined),
                    ),
                    12.heightSpace,
                    CustomFieldComponents(
                      hint: "Pay",
                      hintText: "25/ hour",
                      controller: nameController,
                      suffixIconWidget: Icon(Icons.keyboard_arrow_down_outlined),
                    ),
                    12.heightSpace,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Total Hours",
                        style: FontHelper.f14w500MediumStyle.copyWith(
                          color: AppColor.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    3.heightSpace,
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 14.w),
                      height: 56.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedHour,
                          isExpanded: true,
                          icon: const Icon(Icons.keyboard_arrow_down,
                              color: Colors.black),
                          items:
                          ["1", "2", "3", "4"].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,
                                  style: FontHelper.f16w500MediumStyle
                                      .copyWith(color: AppColor.black)),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedHour = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                    12.heightSpace,

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Job Details",
                        style: FontHelper.f14w500MediumStyle.copyWith(
                          color: AppColor.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    4.heightSpace,
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 10.h),
                      height: 92.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r
                        ),border: Border.all(color: AppColor.border)
                    ),
                    child: Text(
                      "Write briefly about your project",
                      style: FontHelper.f14w500MediumStyle.copyWith(
                        color: AppColor.tertiary,
                      ),
                    ),
                    ),
                    30.heightSpace,
                    PrimaryButton(
                      onTap: () {},
                      childWidget: Text(
                        "Next",
                        style: FontHelper.f16w500MediumStyle
                            .copyWith(color: AppColor.white),
                      ),
                      bgColor: AppColor.primary,
                      borderRadius: 12.r,
                      width: double.infinity,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _consentCheckbox(String text) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(value: false, onChanged: (_) {}),
          Expanded(
              child: Text(
            text,
            style: FontHelper.f12w500MediumStyle.copyWith(
                color: AppColor.tertiary, fontWeight: FontWeight.w400),
            maxLines: 4,
          )),
        ],
      );
}
