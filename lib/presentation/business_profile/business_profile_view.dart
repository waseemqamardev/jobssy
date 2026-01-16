import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobssy/presentation/authentication/set_new_password_view.dart';

import '../../../core/global_components/primary_button.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/customfield_component.dart'; // Ensure filename is correct
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';

class BusinessProfileView extends StatefulWidget {
  const BusinessProfileView({super.key});

  @override
  State<BusinessProfileView> createState() => _BusinessProfileViewState();
}

class _BusinessProfileViewState extends State<BusinessProfileView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String selectedNationality = "Iraq";

  void _showPermissionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
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
                      style:
                      FontHelper.f16BoldStyle.copyWith(color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 17.sp
                      ),
                    ),
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
              _dialogButton("Select Photos...", isBold: false, onTap: () {
                Navigator.pop(context);
                _pickImage();
              }),
              const Divider(height: 1),
              _dialogButton("Allow Access to all Photos", isBold: true,
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage();
                  }),
              const Divider(height: 1),
              _dialogButton("Don't Allow", isBold: false, onTap: () {
                Navigator.pop(context);
              }),
            ],
          ),
        );
      },
    );
  }

  Widget _dialogButton(String text,
      {required bool isBold, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15.h),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
              color: AppColor.primary,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      print("Image Selected: ${image.path}");
    }
  }

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
          "Business Profile",
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
              Center(
                child: GestureDetector(
                  onTap: () => _showPermissionDialog(context),
                  child: Stack(
                    children: [
                      Container(
                        width: 139.w,
                        height: 139.h,
                        decoration: const BoxDecoration(
                          color: AppColor.primary,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(
                            Assets.iconsPerson,
                            width: 73.w,
                            height: 62.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Image.asset(
                            Assets.iconsCamera,
                            width: 35.w,
                            height: 34.h,
                          )),
                    ],
                  ),
                ),
              ),
              10.heightSpace,
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Joffery starmer",
                  style: FontHelper.f18BoldStyle.copyWith(
                    color:AppColor.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              30.heightSpace,
              CustomFieldComponents(
                hint: "Name ( In-App Name)",
                hintText: "Ulrich Neilson",
                controller: nameController,
              ),12.heightSpace,

              Text(
                "Nationality",
                style: FontHelper.f14w500MediumStyle.copyWith(
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
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
                    value: selectedNationality,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down,
                        color: Colors.black),
                    items:
                    ["Iraq", "Pakistan", "USA", "UK"].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,
                            style: FontHelper.f16w500MediumStyle
                                .copyWith(color: AppColor.black)),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedNationality = newValue!;
                      });
                    },
                  ),
                ),
              ),
              12.heightSpace,
              Text(
                "Location",
                style: FontHelper.f14w500MediumStyle.copyWith(
                  color: AppColor.black,
                  fontWeight: FontWeight.bold,
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
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Baghdad, Iraq",
                        style: FontHelper.f16w500MediumStyle
                            .copyWith(color: AppColor.black),
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                  ],
                ),
              ),
              12.heightSpace,
              CustomFieldComponents(
                hint: "Business Contact",
                hintText: "+91 0897264427",
                controller: nameController,
              ),

              12.heightSpace,
              CustomFieldComponents(
                hint: "Business Address (Enter manually)",
                hintText: "Building#2, street#6, Al-burak block, Abu dahbi",
                controller: nameController,
              ),
              25.heightSpace,
              _consentCheckbox("I confirm that the information provided is accurate."),
              _consentCheckbox("I agree to Jobsy’s business posting policies."),
              30.heightSpace,
              PrimaryButton(
                onTap: () {
                  Get.to(SetNewPasswordView());
                },
                childWidget: Text(
                  "Save",
                  style: FontHelper.f16w500MediumStyle
                      .copyWith(color: AppColor.white),
                ),
                bgColor: AppColor.primary,
                borderRadius: 12.r,
                width: double.infinity,
              ),
              40.heightSpace,
            ],
          ),
        ),
      ),
    );
  }
  Widget _consentCheckbox(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Transform.translate(
            offset: const Offset(0, -2),
            child: SizedBox(
              width: 24.w,
              height: 24.h,
              child: Checkbox(
                checkColor: AppColor.secondary,
                value: false,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
                onChanged: (_) {},
              ),
            ),
          ),
          10.widthSpace,
          Expanded(
            child: Text(
              text,
              style: FontHelper.f12w500MediumStyle.copyWith(
                color: AppColor.black,
                fontWeight: FontWeight.w400,
              ),
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }

}
