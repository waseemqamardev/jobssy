import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/customer_profile/customer_view_profile_view.dart';
import 'package:jobssy/presentation/profile/change_password_view.dart';
import 'package:jobssy/presentation/profile/contact_support_view.dart';
import 'package:jobssy/presentation/profile/profile_notifications_view.dart';
import 'package:jobssy/presentation/profile/view_profile_view.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/primary_button.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';
import '../authentication/login_view.dart';
import '../notifications/notifications_view.dart';

class CustomerProfileView extends StatefulWidget {
  const CustomerProfileView({super.key});

  @override
  State<CustomerProfileView> createState() => _CustomerProfileViewState();
}

class _CustomerProfileViewState extends State<CustomerProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              20.heightSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Profile",
                        style: FontHelper.f20BoldStyle.copyWith(
                            color: AppColor.dark, fontWeight: FontWeight.w700)),
                    _buildNotificationBell(),
                  ],
                ),
              ),
              14.heightSpace,
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 65.r,
                      backgroundImage: AssetImage(Assets.imagesPerson),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(6.r),
                        decoration: BoxDecoration(
                          color: AppColor.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColor.border, width: 1),
                        ),
                        child: Icon(Icons.camera_alt_outlined,
                            size: 18.sp, color: AppColor.tertiary),
                      ),
                    ),
                  ],
                ),
              ),
              10.heightSpace,
              Text("John Doe",
                  style: FontHelper.f18BoldStyle.copyWith(
                      color: AppColor.dark, fontWeight: FontWeight.w700)),
              2.heightSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 18),
                  Text(" 4.9 (37)",
                      style: FontHelper.f14w400Regular
                          .copyWith(color: AppColor.tertiary)),
                ],
              ),
              24.heightSpace,
              _buildSectionHeader("App Preferences"),
              15.heightSpace,
              _buildSettingsContainer([
                _buildListTile(Assets.iconsViewprofilenew, "View Profile",
                    onTap: () {
                      Get.to(CustomerViewProfileView());
                    }),
                const Divider(color: AppColor.border, height: 1, indent: 50),
                _buildListTile(Assets.iconsNotificationnew, "Notifications",
                    onTap: () {
                      Get.to(() => const ProfileNotificationsView());
                    }),
              ]),
              25.heightSpace,
              _buildSectionHeader("Support"),
              15.heightSpace,
              _buildSettingsContainer([
                // _buildListTile(Assets.iconsKycnew, "KYC Status",
                //     trailing: _buildStatusBadge("Verified"), onTap: () {}),
                // const Divider(color: AppColor.border, height: 1, indent: 50),
                _buildListTile(Assets.iconsPasswordchangenew, "Change Password",
                    onTap: () {
                      Get.to(ChangePasswordView());
                    }),
                const Divider(color: AppColor.border, height: 1, indent: 50),
                _buildListTile(Assets.iconsSupportnew, "Contact Support",
                    onTap: () {
                      Get.to(ContactSupportView());
                    }),
                const Divider(color: AppColor.border, height: 1, indent: 50),
                _buildListTile(Assets.iconsPlogout, "Logout",
                    textColor: Colors.red,
                    iconColor: Colors.red,
                    onTap: () => _showLogoutSheet(context)),
              ]),
              40.heightSpace,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Text(title,
          style: FontHelper.f14w400Regular
              .copyWith(color: AppColor.dark, fontWeight: FontWeight.w700)),
    );
  }

  Widget _buildSettingsContainer(List<Widget> children) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18.w),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildListTile(String icon, String title,
      {Widget? trailing,
        VoidCallback? onTap,
        Color? textColor,
        Color? iconColor}) {
    return ListTile(
      onTap: onTap,
      leading: Image.asset(
        icon,
        width: 24.w,
        height: 24.h,
      ),
      title: Text(title,
          style: FontHelper.f14w500MediumStyle.copyWith(
              color: textColor ?? AppColor.dark, fontWeight: FontWeight.w400)),
      trailing: trailing ??
          Icon(Icons.arrow_forward_ios, size: 16.sp, color: AppColor.tertiary),
    );
  }

  Widget _buildStatusBadge(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: const Color(0xffE8F5E9),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(text,
          style: TextStyle(
              color: Colors.green,
              fontSize: 10.sp,
              fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildNotificationBell() {
    return GestureDetector(
      onTap: () {
        Get.to(NotificationsView());
      },
      child: Container(
        height: 48.h,
        width: 48.w,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColor.border),
        ),
        child: Center(
            child: Image.asset(Assets.iconsNotificationnew,
                height: 22.h, width: 22.w)),
      ),
    );
  }

  void _showLogoutSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.r))),
      builder: (context) => Container(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 40.w, height: 4.h, color: Colors.grey.shade300),
            30.heightSpace,
            Text("Are you sure you want to logout",
                style: FontHelper.f18BoldStyle),
            30.heightSpace,
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    onTap: () => Get.to(LoginView()),
                    bgColor: const Color(0xFF4285F4),
                    childWidget: Text("Logout",
                        style: TextStyle(color: Colors.white, fontSize: 16.sp)),
                  ),
                ),
                15.widthSpace,
                Expanded(
                  child: PrimaryButton(
                    onTap: () => Navigator.pop(context),
                    bgColor: Colors.white,
                    borderColor: const Color(0xFF4285F4),
                    childWidget: Text("Cancel",
                        style: TextStyle(
                            color: const Color(0xFF4285F4), fontSize: 16.sp)),
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
