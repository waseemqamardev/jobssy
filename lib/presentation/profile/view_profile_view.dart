import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/primary_button.dart';
import '../../core/global_components/customfield_component.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';

class ViewProfileView extends StatefulWidget {
  const ViewProfileView({super.key});

  @override
  State<ViewProfileView> createState() => _ViewProfileViewState();
}

class _ViewProfileViewState extends State<ViewProfileView> {
  String email = "john.doe@gmail.com";
  String address = "Lorem Ipsum Street # House #";
  bool isEdited = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCircleButton(
                      Icons.arrow_back_ios_new, () => Get.back()),
                  Text(
                    "View Profile",
                    style:
                        FontHelper.f18BoldStyle.copyWith(color: AppColor.dark),
                  ),
                  _buildNotificationBell(),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    20.heightSpace,
                    _buildProfileImage(),
                    30.heightSpace,
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20.r),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Profile Details",
                            style: FontHelper.f16BoldStyle
                                .copyWith(color: AppColor.dark),
                          ),
                          20.heightSpace,
                          _buildDetailItem("Full Name", "John Doe"),
                          _buildDetailItem(
                            "Email",
                            email,
                            showEdit: true,
                            onEdit: () => _showEditSheet("Email", email),
                          ),
                          _buildDetailItem("Phone Number", "+123 123 123 123"),
                          _buildDetailItem("DOB", "01/01/2000"),
                          _buildDetailItem("Gender", "Male"),
                          _buildDetailItem("Nationality", "United States"),
                          _buildDetailItem(
                            "Address",
                            address,
                            showEdit: true,
                            onEdit: () => _showEditSheet("Address", address),
                          ),
                        ],
                      ),
                    ),
                    10.heightSpace,
                    PrimaryButton(
                      height: 48.h,
                      width: 355.w,
                      onTap: () {
                        if (isEdited) {
                          debugPrint("Profile Saved!");
                        }
                      },
                      bgColor:
                          isEdited ? AppColor.primary : const Color(0xffBDBDBD),
                      childWidget: Text(
                        "Save Changes",
                        style: TextStyle(color: Colors.white, fontSize: 16.sp),
                      ),
                    ),
                    20.heightSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // -------------------- BOTTOM SHEET --------------------

  void _showEditSheet(String title, String currentValue) {
    final controller = TextEditingController(text: currentValue);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                
                colors: [
                  Color(0xffDAF0FF),
                  Color(0xffEEF9FF),
                  Color(0xffDFE0E2),
                ],
              ),              borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40.w,
                    height: 4.h,
                    color: Colors.grey.shade300,
                  ),
                ),
                20.heightSpace,
                Text(
                  "Edit Profile Information",
                  style: FontHelper.f18BoldStyle.copyWith(color: AppColor.dark),
                ),
                const Divider(),
                15.heightSpace,
                Text(
                  title,
                  style: FontHelper.f13w500MediumStyle.copyWith(
                    color: AppColor.dark,
                  ),
                ),
                8.heightSpace,
                CustomFieldComponents(
                  controller: controller,
                  hintText: "Enter your $title",
                  borderColor: AppColor.border,
                  hintStyle: FontHelper.f13w400Regular
                      .copyWith(color: AppColor.tertiary.withOpacity(0.5)),
                ),
                25.heightSpace,
                PrimaryButton(
                  height: 48.h,
                  width: double.infinity,
                  bgColor: AppColor.primary,
                  onTap: () {
                    if (controller.text.isNotEmpty) {
                      setState(() {
                        if (title == "Email") email = controller.text;
                        if (title == "Address") address = controller.text;
                        isEdited = true;
                      });
                      Navigator.pop(context);
                    }
                  },
                  childWidget: const Text(
                    "Update",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                10.heightSpace,
              ],
            ),
          ),
        );
      },
    );
  }

  // -------------------- FIXED DETAIL ITEM --------------------

  Widget _buildDetailItem(
    String label,
    String value, {
    bool showEdit = false,
    VoidCallback? onEdit,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: InkWell(
        onTap: showEdit ? onEdit : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: FontHelper.f12w500MediumStyle.copyWith(
                    color: AppColor.tertiary,
                  ),
                ),
                if (showEdit)
                  Text(
                    "Edit",
                    style: FontHelper.f12w500MediumStyle.copyWith(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
            4.heightSpace,
            Text(
              value,
              style: FontHelper.f14w500MediumStyle.copyWith(
                color: AppColor.dark,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // -------------------- UI HELPERS --------------------

  Widget _buildProfileImage() {
    return Stack(
      children: [
        CircleAvatar(
          radius: 55.r,
          backgroundImage: const AssetImage(Assets.imagesPerson),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(5.r),
            decoration: BoxDecoration(
              color: AppColor.white,
              shape: BoxShape.circle,
              border: Border.all(color: AppColor.border),
            ),
            child: Icon(
              Icons.camera_alt_outlined,
              size: 16.sp,
              color: AppColor.tertiary,
            ),
          ),
        ),
      ],
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

  Widget _buildNotificationBell() {
    return Container(
      height: 48.h,
      width: 48.w,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColor.border),
      ),
      child: Center(
        child: Image.asset(
          Assets.iconsNotificationnew,
          height: 22.h,
          width: 22.w,
        ),
      ),
    );
  }
}
