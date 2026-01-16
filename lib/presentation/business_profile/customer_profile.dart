import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/authentication/login_view.dart';
import 'package:jobssy/presentation/business_profile/business_profile_view.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/primary_button.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';

class CustomerProfileView extends StatefulWidget {
  const CustomerProfileView({super.key});

  @override
  State<CustomerProfileView> createState() => _CustomerProfileViewState();
}

class _CustomerProfileViewState extends State<CustomerProfileView> {
  bool isNotificationEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        toolbarHeight: 100.h,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            42.heightSpace,
            Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Text(
                    "Profile",
                    style: FontHelper.f24w500MediumStyle.copyWith(
                      color: AppColor.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 26.sp,
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(
              color: AppColor.border,
              thickness: 1,
            ),
            30.heightSpace,
            GestureDetector(
              onTap: (){
                Get.to(const BusinessProfileView());
              },
              child: Center(
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
            12.heightSpace,
            Text(
              "AB Traders",
              style: FontHelper.f18BoldStyle.copyWith(
                color:AppColor.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            30.heightSpace,

            _buildSectionHeader("App prefrences"),
            15.heightSpace,
            _buildSettingsContainer([
              _buildListTile(
                Assets.iconsPnotifications,
                "Notifications",
                trailing: Switch(
                  value: isNotificationEnabled,
                  onChanged: (val) => setState(() => isNotificationEnabled = val),
                  activeColor: AppColor.primary,
                  inactiveTrackColor: AppColor.border,
                  inactiveThumbColor: AppColor.white,
                ),
              ),
              const Divider(color: AppColor.border, height: 1),
              _buildListTile(Assets.iconsPedit, "Edit Profile", onTap: () {}),
            ]),

            20.heightSpace,

            _buildSectionHeader("Support"),
            15.heightSpace,
            _buildSettingsContainer([
              _buildListTile(Assets.iconsPkyc, "KYC Status", onTap: () {}),
              const Divider(color: AppColor.border, height: 1),
              _buildListTile(Assets.iconsPchangePassword, "Change Password", onTap: () {}),
              const Divider(color: AppColor.border, height: 1),
              _buildListTile(
                Assets.iconsPlogout,
                "Logout",
                textColor: Colors.red,
                onTap: () => _showLogoutSheet(context),
              ),
            ]),
            120.heightSpace,
          ],
        ),
      ),
    );
  }


  Widget _buildSectionHeader(String title) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 18.w,),
      child: Text(
        title,
        style: FontHelper.f18BoldStyle.copyWith(color: AppColor.black,fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _buildSettingsContainer(List<Widget> children) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18.w),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColor.border),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildListTile(String assetPath, String title, {Widget? trailing, VoidCallback? onTap, Color? textColor}) {
    return ListTile(
      onTap: onTap,
      leading: Image.asset(assetPath, width: 20.w, height: 20.h),
      title: Text(
        title,
        style: FontHelper.f16w500MediumStyle.copyWith(
          color: textColor ?? AppColor.black,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: trailing,
    );
  }

  void _showLogoutSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25.r))),
      builder: (context) => Container(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 40.w, height: 4.h, color: Colors.grey.shade300),
            30.heightSpace,
            Text("Are you sure you want to logout", style: FontHelper.f18BoldStyle),
            30.heightSpace,
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    onTap: () => Get.to(const LoginView()),
                    bgColor: const Color(0xFF4285F4), // Light blue from image_d42dec
                    childWidget: Text("Logout", style: TextStyle(color: Colors.white, fontSize: 16.sp)),
                  ),
                ),
                15.widthSpace,
                Expanded(
                  child: PrimaryButton(
                    onTap: () => Navigator.pop(context),
                    bgColor: Colors.white,
                    borderColor: const Color(0xFF4285F4),
                    childWidget: Text("Cancel", style: TextStyle(color: const Color(0xFF4285F4), fontSize: 16.sp)),
                  ),
                ),
              ],
            ),
            20.heightSpace,
          ],
        ),
      ),
    );
  }
}