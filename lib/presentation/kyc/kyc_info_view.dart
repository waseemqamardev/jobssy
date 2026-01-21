import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/kyc/kyc_success.dart';

import '../../../core/global_components/primary_button.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/customfield_component.dart';
import '../../core/utils/extensions.dart';

class KYCInfoView extends StatefulWidget {
  const KYCInfoView({super.key});

  @override
  State<KYCInfoView> createState() => _KYCInfoViewState();
}

class _KYCInfoViewState extends State<KYCInfoView> {
  int activeStep = 0;

  // ---------------- Controllers ----------------
  final nameController = TextEditingController(text: "Zain Waraich");
  final dobController = TextEditingController(text: "12/03/2025");
  final emiratesIdController = TextEditingController();
  final passportController = TextEditingController();

  // ---------------- Dropdown values ----------------
  String selectedCountry = "Pakistan";
  String selectedCity = "Islamabad";

  // ---------------- Step Titles ----------------
  final List<Map<String, String>> stepInfo = [
    {
      "title": "Address Information",
      "subtitle": "Fill in your address information",
    },
    {
      "title": "KYC Identity Verification",
      "subtitle": "Enter your Emirates ID details",
    },
    {
      "title": "Upload Documents",
      "subtitle": "Enter your Passport details",
    },
  ];

  int get totalSteps => stepInfo.length;

  // ---------------- Step Content ----------------
  Widget _buildStepContent() {
    switch (activeStep) {
      case 0:
        return _personalDetails();
      case 1:
        return _emiratesID();
      case 2:
        return _passport();
      default:
        return _personalDetails();
    }
  }

  void _nextStep() {
    if (activeStep < totalSteps - 1) {
      setState(() => activeStep++);
    } else {
      Get.to(const KycSuccessView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.heightSpace,

              /// ---------------- Header ----------------
              /// ---------------- Header Alternative ----------------
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Title & Subtitle
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            stepInfo[activeStep]["title"]!,
                            style: FontHelper.extraBoldStyle.copyWith(
                              color: AppColor.darkBlueText,
                              fontSize: 24.sp,
                            ),
                          ),
                          4.heightSpace,
                          Text(
                            stepInfo[activeStep]["subtitle"]!,
                            style: FontHelper.f13w400Regular.copyWith(
                              color: AppColor.darkBlueText.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// Skip Button
                    GestureDetector(
                      onTap: _nextStep,
                      child: Text(
                        "Skip",
                        style: FontHelper.f13w400Regular.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColor.darkBlueText.withOpacity(0.6),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              24.heightSpace,

              /// ---------------- Content ----------------
              _buildStepContent(),

              40.heightSpace,

              /// ---------------- Button ----------------
              PrimaryButton(
                onTap: _nextStep,
                height: 48.h,
                width: double.infinity,
                bgColor: AppColor.primary,
                borderRadius: 12.r,
                childWidget: Text(
                  activeStep == totalSteps - 1 ? "Submit" : "Next",
                  style: FontHelper.f15w600SemiBold
                      .copyWith(color: AppColor.white),
                ),
              ),

              30.heightSpace,
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- Step Screens ----------------

  Widget _personalDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel("Country"),
        _buildDropdown(
          value: selectedCountry,
          items: ["Pakistan", "Kuwait", "UAE"],
          onChanged: (v) => setState(() => selectedCountry = v!),
        ),
        16.heightSpace,
        _buildLabel("City"),
        _buildDropdown(
          value: selectedCity,
          items: ["Islamabad", "Karachi", "Lahore"],
          onChanged: (v) => setState(() => selectedCity = v!),
        ),
        16.heightSpace,
        CustomFieldComponents(
          hint: "Residential Address",
          hintText: "Address Lorem ipsum",
          controller: nameController,
        ),
        16.heightSpace,
        CustomFieldComponents(
          hint: "Postal / Zip Code",
          hintText: "234833",
          controller: dobController,
        ),
      ],
    );
  }

  Widget _emiratesID() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel("Verify ID Via"),
        _buildDropdown(
          value: selectedCity,
          items: ["Islamabad", "Karachi", "Lahore"],
          onChanged: (v) => setState(() => selectedCity = v!),
        ),
      ],
    );
  }

  Widget _passport() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle("Passport"),
        16.heightSpace,
        CustomFieldComponents(
          hint: "Enter Passport No.",
          hintText: "P0000000",
          controller: passportController,
        ),
      ],
    );
  }

  // ---------------- Reusable Widgets ----------------

  Widget _sectionTitle(String title) => Text(
    title,
    style: FontHelper.f18BoldStyle.copyWith(
      color: AppColor.black,
      fontWeight: FontWeight.w400,
    ),
  );

  Widget _buildLabel(String label) => Padding(
    padding: EdgeInsets.only(bottom: 8.h),
    child: Text(
      label,
      style:
      FontHelper.f12w500MediumStyle.copyWith(
          fontSize: 13.sp,
          color: AppColor.darkBlueText),
    ),
  );

  Widget _buildDropdown({
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      height: 44.h,
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color(0xff166DDF1A).withOpacity(0.10),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: AppColor.reLightGrey.withOpacity(0.5),
          ),
          items: items
              .map(
                (e) => DropdownMenuItem(
              value: e,
              child: Text(
                e,
                style: FontHelper.f16w500MediumStyle
                    .copyWith(color: AppColor.darkBlueText),
              ),
            ),
          )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
