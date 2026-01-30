import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:country_picker/country_picker.dart';

import '../../../core/global_components/primary_button.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/customfield_component.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';
import '../kyc/kyc_info_view.dart';

class EmployeeProfileSetupView extends StatefulWidget {
  const EmployeeProfileSetupView({super.key});

  @override
  State<EmployeeProfileSetupView> createState() =>
      _EmployeeProfileSetupViewState();
}

class _EmployeeProfileSetupViewState extends State<EmployeeProfileSetupView> {
  final TextEditingController dobController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String selectedGender = "Male";
  String selectedNationality = "Iraq";
  String selectedCurrencySymbol = "";
  XFile? selectedImage;

  /// Map ISO country codes → currency symbols
  final Map<String, String> _currencyMap = {
    "US": "\$", // United States Dollar
    "PK": "₨", // Pakistani Rupee
    "IQ": "د.ع", // Iraqi Dinar
    "IN": "₹", // Indian Rupee
    "GB": "£", // British Pound
    "EU": "€", // Euro
    "AE": "د.إ", // UAE Dirham
    "JP": "¥", // Japanese Yen
    "CN": "¥", // Chinese Yuan
    "CA": "\$", // Canadian Dollar
    "AU": "\$", // Australian Dollar
    "AF": "؋", // Afghan Afghani
    "BD": "৳", // Bangladesh Taka
    "BH": ".د.ب", // Bahraini Dinar
    "DZ": "د.ج", // Algerian Dinar
    "EG": "£", // Egyptian Pound
    "NG": "₦", // Nigerian Naira
    "SA": "﷼", // Saudi Riyal
    "SG": "\$", // Singapore Dollar
    // You can add more if needed
  };

  /// Show permission dialog for selecting photo
  void _showPermissionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                children: [
                  Text(
                    "“Jobssy” Would Like to Access Your Photos",
                    textAlign: TextAlign.center,
                    style: FontHelper.f16BoldStyle.copyWith(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  10.heightSpace,
                  Text(
                    "This lets you select photos and videos from your library and attach to your entry.",
                    textAlign: TextAlign.center,
                    style: FontHelper.f13w400Regular
                        .copyWith(color: const Color(0xff0E0E0F)),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            _dialogButton("Select Photos...", false, () {
              Navigator.pop(context);
              _pickImage();
            }),
            const Divider(height: 1),
            _dialogButton("Allow Access to all Photos", true, () {
              Navigator.pop(context);
              _pickImage();
            }),
            const Divider(height: 1),
            _dialogButton("Don't Allow", false, () {
              Navigator.pop(context);
            }),
          ],
        ),
      ),
    );
  }

  Widget _dialogButton(String text, bool isBold, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15.h),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: AppColor.btnBlue,
            fontSize: 16.sp,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
          ),
        ),
      ),
    );
  }

  /// Pick image from gallery
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        selectedImage = image;
      });
    }
  }

  /// Open country picker
  void _openCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: false,
      onSelect: (Country country) async {
        final prefs = await SharedPreferences.getInstance();

        // Get currency symbol from map
        String symbol = _currencyMap[country.countryCode] ?? "\$";

        setState(() {
          selectedNationality = country.name;
          selectedCurrencySymbol = symbol;
        });

        // Save locally
        await prefs.setString("nationality", country.name);
        await prefs.setString("currency_symbol", symbol);

        // Debug log
        debugPrint("✅ COUNTRY SAVED: ${country.name}");
        debugPrint("💱 SYMBOL SAVED: $symbol");
      },
    );
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
              24.heightSpace,
              Text(
                "Basic Information",
                style: FontHelper.extraBoldStyle.copyWith(
                  fontSize: 24.sp,
                  color: AppColor.darkBlueText,
                ),
              ),
              6.heightSpace,
              Text(
                "Fill in your personal information",
                style: FontHelper.f14w500MediumStyle.copyWith(
                  color: AppColor.reLightGrey.withOpacity(0.40),
                  fontWeight: FontWeight.w400,
                ),
              ),
              24.heightSpace,

              // Profile Picture Selector
              Center(
                child: GestureDetector(
                  onTap: () => _showPermissionDialog(context),
                  child: Stack(
                    children: [
                      Container(
                        width: 112.w,
                        height: 112.h,
                        decoration: const BoxDecoration(
                          color: AppColor.btnBlue,
                          shape: BoxShape.circle,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(112.r),
                          child: selectedImage != null
                              ? Image.file(
                            File(selectedImage!.path),
                            fit: BoxFit.cover,
                          )
                              : Center(
                            child: Image.asset(
                              Assets.iconsPerson,
                              width: 58.82.w,
                              height: 49.96.h,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 2,
                        right: 2,
                        child: Image.asset(
                          Assets.iconsCamera,
                          width: 30.w,
                          height: 30.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              32.heightSpace,

              // Date of Birth
              CustomFieldComponents(
                hint: "Date of Birth",
                hintText: "00/00/00",
                controller: dobController,
                suffixIconWidget: Image.asset(
                  Assets.iconsCalendar,
                  width: 16.w,
                  height: 16.h,
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      dobController.text =
                      "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                    });
                  }
                },
              ),
              16.heightSpace,

              // Gender Dropdown
              Text(
                "Gender (Optional)",
                style: FontHelper.f14w500MediumStyle.copyWith(
                  color: AppColor.darkBlueText,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              3.heightSpace,
              _buildDropdown(
                value: selectedGender,
                items: ["Male", "Female", "Other"],
                onChanged: (val) {
                  setState(() {
                    selectedGender = val!;
                  });
                },
              ),
              16.heightSpace,

              // Nationality Dropdown
              Text(
                "Nationality",
                style: FontHelper.f14w500MediumStyle.copyWith(
                  color: AppColor.darkBlueText,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              3.heightSpace,
              GestureDetector(
                onTap: _openCountryPicker,
                child: Container(
                  height: 44.h,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: const Color(0xff166DDF1A).withOpacity(0.10),
                      width: 1.w,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectedNationality,
                        style: FontHelper.f16w500MediumStyle
                            .copyWith(color: AppColor.darkBlueText),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColor.reLightGrey.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
              ),
              16.heightSpace,

              // Phone Number
              CustomFieldComponents(
                hint: "Phone Number",
                hintText: "+40 9888 873747",
                controller: phoneController,
                keyboardType: TextInputType.phone,
              ),
              25.heightSpace,

              // Verify Email Button
              PrimaryButton(
                onTap: () {
                  Get.to(const KYCInfoView());
                },
                childWidget: Text(
                  "Next",
                  style: FontHelper.f16w500MediumStyle
                      .copyWith(color: AppColor.white),
                ),
                bgColor: AppColor.btnBlue,
                borderRadius: 12.r,
                width: double.infinity,
              ),
              24.heightSpace,
            ],
          ),
        ),
      ),
    );
  }

  // Reusable dropdown for gender
  Widget _buildDropdown({
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      height: 44.h,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color(0xff166DDF1A).withOpacity(0.10),
          width: 1.w,
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
          items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
