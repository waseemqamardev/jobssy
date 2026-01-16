import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/kyc/kyc_success.dart';
import '../../../core/global_components/primary_button.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/customfield_component.dart';
import '../../core/utils/extensions.dart';
import '../authentication/password_changed_view.dart';

class KYCInfoView extends StatefulWidget {
  const KYCInfoView({super.key});

  @override
  State<KYCInfoView> createState() => _KYCInfoViewState();
}

class _KYCInfoViewState extends State<KYCInfoView> {
  int activeStep = 0;

  // Controllers
  final nameController = TextEditingController(text: "Zain Waraich");
  final dobController = TextEditingController(text: "12/03/2025");
  final contactController = TextEditingController(text: "+470 5467 0000 123");
  final emiratesIdController = TextEditingController();
  final passportController = TextEditingController();
  final ibanController = TextEditingController();
  final accountNoController = TextEditingController();
  final bankNameController = TextEditingController();
  final addressController = TextEditingController();

  // Dropdown values
  String selectedBirthplace = "Kuwait";
  String selectedNationality = "Pakistani";
  String selectedGender = "Male";
  String selectedAccountType = "Current";
  String selectedBranch = "DEIRA155";

  Widget _buildStepContent() {
    switch (activeStep) {
      case 0:
        return _personalDetails();
      case 1:
        return _emiratesID();
      case 2:
        return _passport();
      case 3:
        return _bankDetails();
      case 4:
        return _addressVerification();
      case 5:
        return _profilePic();
      default:
        return _personalDetails();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "KYC",
          style: FontHelper.f24w500MediumStyle.copyWith(
            color: AppColor.black,
            fontWeight: FontWeight.w700,
            fontSize: 32.sp,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Row(
              children: [
                Text("Skip",
                    style: FontHelper.f12w500MediumStyle.copyWith(
                        color: AppColor.black,
                        fontWeight: FontWeight.w600)),
                5.widthSpace,
                Icon(Icons.arrow_forward,
                    size: 20.sp, color: Colors.grey.shade600),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          20.heightSpace,
          _buildStepper(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  20.heightSpace,
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildStepContent(),
                        40.heightSpace,
                        PrimaryButton(
                          onTap: () {
                            if (activeStep < 5) {
                              setState(() => activeStep++);
                            } else {
                             Get.offAll(KycSuccessView());
                            }
                          },
                          height: 48.h,
                          width: double.infinity,
                          bgColor: AppColor.primary,
                          borderRadius: 12.r,
                          childWidget: Text(
                            activeStep == 5 ? "Submit" : "Next",
                            style: FontHelper.f15w600SemiBold
                                .copyWith(color: AppColor.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  30.heightSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // -------- Screens --------

  Widget _personalDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle("Personal Details"),
        25.heightSpace,
        CustomFieldComponents(
            hint: "Name(As on Identity card)",
            hintText: "Enter your name",
            controller: nameController),
        16.heightSpace,
        CustomFieldComponents(
            hint: "Date of Birth",
            hintText: "DD/MM/YYYY",
            controller: dobController),
        16.heightSpace,
        _buildLabel("Birthplace"),
        _buildDropdown(selectedBirthplace,
            ["Kuwait", "Pakistan", "UAE"], (v) {
              setState(() => selectedBirthplace = v!);
            }),
        16.heightSpace,
        _buildLabel("Nationality"),
        _buildDropdown(selectedNationality,
            ["Pakistani", "Indian", "Kuwaiti"], (v) {
              setState(() => selectedNationality = v!);
            }),
        16.heightSpace,
        _buildLabel("Gender"),
        _buildDropdown(selectedGender, ["Male", "Female", "Other"], (v) {
          setState(() => selectedGender = v!);
        }),
        16.heightSpace,
        CustomFieldComponents(
            hint: "Contact",
            hintText: "+000 0000 0000",
            controller: contactController),
      ],
    );
  }

  Widget _emiratesID() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle("Emirates ID"),
        6.heightSpace,
        Text("Please upload your Emirates ID below for completing this step of KYC.",
            style: FontHelper.f12w500MediumStyle.copyWith(
                color: AppColor.tertiary,
                fontWeight: FontWeight.w400)),
        25.heightSpace,
        CustomFieldComponents(
            hint: "Enter ID No.",
            hintText: "0000 0000 0000",
            controller: emiratesIdController),
        24.heightSpace,
        _uploadBox("Upload Emirates card front photo"),
        16.heightSpace,
        _consentCheckbox("I hereby agree that the above document belongs to me and voluntarily give my consent to Jobsy Ltd (Wint Wealth) to utilize it as my Emirates ID proof for KYC on purpose only"),
      ],
    );
  }

  Widget _passport() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle("Passport"),
        6.heightSpace,
        Text("Please upload your Passport below for completing this step of KYC.",
            style: FontHelper.f12w500MediumStyle.copyWith(
                color: AppColor.tertiary,
                fontWeight: FontWeight.w400)),
        25.heightSpace,
        CustomFieldComponents(
            hint: "Enter Passport No.",
            hintText: "P0000000",
            controller: passportController),
        24.heightSpace,
        _uploadBox("Upload Passport front photo"),
        16.heightSpace,
        _consentCheckbox("I hereby agree that the above document belongs to me and voluntarily give my consent to jobsy Ltd (Wint Wealth) to utilize it as my passport proof for KYC on purpose only"),
      ],
    );
  }

  Widget _bankDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle("Bank Account Details"),
        6.heightSpace,
        Text("Please enter your bank account details with which you are going to make payments.",
            style: FontHelper.f12w500MediumStyle.copyWith(
                color: AppColor.tertiary,
                fontWeight: FontWeight.w400)),
        25.heightSpace,
        CustomFieldComponents(
            hint: "Enter your IBAN No.",
            hintText: "AE00 0000...",
            controller: ibanController),
        16.heightSpace,
        CustomFieldComponents(
            hint: "Enter Account No.",
            hintText: "000000000",
            controller: accountNoController),
        16.heightSpace,
        CustomFieldComponents(
            hint: "Bank Name",
            hintText: "Enter Bank Name",
            controller: bankNameController),
        16.heightSpace,
        _buildLabel("Account Type"),
        _buildDropdown(
            selectedAccountType, ["Current", "Savings"], (v) {
          setState(() => selectedAccountType = v!);
        }),
        16.heightSpace,
        _buildLabel("Branch Code"),
        _buildDropdown(selectedBranch, ["DEIRA155", "DXB001"], (v) {
          setState(() => selectedBranch = v!);
        }),
        25.heightSpace,
        Center(
          child: SizedBox(
              width: 260.w,
              child: _uploadBox("Upload your any bank document")),
        ),

      ],
    );
  }

  Widget _addressVerification() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle("Address Verification"),
        6.heightSpace,
        Text("Please upload a document that proves your address",
            style: FontHelper.f12w500MediumStyle.copyWith(
                color: AppColor.tertiary,
                fontWeight: FontWeight.w400)),
        24.heightSpace,
        CustomFieldComponents(
            hint: "Enter Address",
            hintText: "Full Address",
            controller: addressController),
        24.heightSpace,
        Center(child: SizedBox(
            width: 260.w,
            child: _uploadBox("Upload Utility Bills, Municipal Tax Records, Property purchase docs, Insurance Policy "))),
        16.heightSpace,
        _consentCheckbox("I hereby agree that the above document belongs to me and voluntarily give my consent to jobsy Ltd (Wint Wealth) to utilize it as my address proof for KYC on purpose only"),
      ],
    );
  }

  Widget _profilePic() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle("Photo"),
        6.heightSpace,
        Text("Please Upload a recent photograph",
            style: FontHelper.f12w500MediumStyle.copyWith(
                color: AppColor.tertiary,
                fontWeight: FontWeight.w400)),
        40.heightSpace,
        Center(child: SizedBox(
            width: 260.w,
            child: _uploadBox("Upload your Photo "))),
        16.heightSpace,
      ],
    );
  }


  Widget _sectionTitle(String title) => Text(
    title,
    style: FontHelper.f18BoldStyle.copyWith(
        color: AppColor.black, fontWeight: FontWeight.w400),
  );

  Widget _buildLabel(String label) => Padding(
    padding: EdgeInsets.only(bottom: 8.h),
    child: Text(label,
        style: FontHelper.f12w500MediumStyle.copyWith(
            color: AppColor.black, fontWeight: FontWeight.w400)),
  );

  Widget _buildDropdown(
      String value, List<String> items, Function(String?) onChanged) {
    return Container(
      height: 56.h,
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xffE7E7E7)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: items
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _uploadBox(String text) => Container(
    width: double.infinity,
    padding: EdgeInsets.all(20.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.r),
      border: Border.all(color: Colors.grey.shade200),
    ),
    child: Column(
      children: [
        Text(text, textAlign: TextAlign.center,style: FontHelper.f12w500MediumStyle.copyWith(
        color: AppColor.tertiary, fontWeight: FontWeight.w400) ,),
        16.heightSpace,
        PrimaryButton(
          onTap: () {},
          height: 35.h,
          width: 120.w,
          borderColor: AppColor.primary,
          bgColor: AppColor.white,
          borderRadius: 10.r,
          childWidget:
          Text("Upload +", style: TextStyle(color: AppColor.primary)),
        ),
      ],
    ),
  );

  Widget _consentCheckbox(String text) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Checkbox(value: false, onChanged: (_) {}),
      Expanded(child: Text(text,style: FontHelper.f12w500MediumStyle.copyWith(
          color: AppColor.tertiary, fontWeight: FontWeight.w400) ,maxLines: 4,)),
    ],
  );

  Widget _buildStepper() {
    return EasyStepper(
      activeStep: activeStep,
      stepRadius: 18.r,
      showStepBorder: false,
      showLoadingAnimation: false,
      // unreachedStepType: StepType.custom,
      // activeStepType: StepType.custom,
      // finishedStepType: StepType.custom,
      // // Solid line settings
      lineStyle: LineStyle(
        lineLength: 30.w,
        lineWidth: 5.w,
        lineType: LineType.normal,
        lineThickness: 2,
        defaultLineColor: const Color(0xFFE0E0E0),
        finishedLineColor: AppColor.primary,
      ),
      onStepReached: (index) => setState(() => activeStep = index),
      steps: [
        _buildStep(1, "Personal\nInfo", 0),
        _buildStep(2, "Emirates\nID", 1),
        _buildStep(3, "Passport", 2),
        _buildStep(4, "Bank A/c\nDetails", 3),
        _buildStep(5, "Address\nVeri.", 4),
        _buildStep(6, "Profile\nPic", 5),
      ],
    );
  }

  EasyStep _buildStep(int num, String title, int index) {
    return EasyStep(
      customStep: _stepCircle(num, index),
      customTitle: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 10.sp,
          color: index <= activeStep ? AppColor.black : AppColor.tertiary,
        ),
      ),
    );
  }

  Widget _stepCircle(int number, int index) {
    bool isFinished = index < activeStep;
    bool isActive = index == activeStep;

    return Container(
      width: 36.w,
      height: 36.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: (isActive || isFinished) ? AppColor.primary : AppColor.white,
        border: Border.all(
          color: (isActive || isFinished) ? AppColor.primary : const Color(0xFFE0E0E0),
          width: 1.5,
        ),
      ),
      child: Center(
        child: isFinished
            ? Icon(Icons.check, color: Colors.white, size: 20.sp)
            : Text(
          "$number",
          style: TextStyle(
            color: isActive ? Colors.white : AppColor.tertiary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
