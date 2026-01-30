import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobssy/presentation/customer_home/customer_home_view.dart';
import 'package:jobssy/presentation/customer_jobs/customer_jobs_view.dart';
import 'package:jobssy/presentation/customer_profile/customer_profile_view.dart';
import 'package:jobssy/presentation/profile/profile_view.dart';
import 'package:jobssy/presentation/qr_scan/scan_qrcode_view.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';
import '../customer_wallet/customer_wallet_view.dart';
import '../wallet/wallet_view.dart';

class CustomerBottomNav extends StatefulWidget {
  const CustomerBottomNav({super.key});

  @override
  State<CustomerBottomNav> createState() => _CustomerBottomNavState();
}

class _CustomerBottomNavState extends State<CustomerBottomNav> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    const CustomerHomeView(),
    const CustomerJobsView(),
    const ScanQRCodeView(),
    const CustomerWalletView(),
    const CustomerProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: screens[selectedIndex],

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: SizedBox(
          height: 70.h,
          width: 70.w,
          child: FloatingActionButton(
            onPressed: () => setState(() => selectedIndex = 2),
            backgroundColor: AppColor.primary,
            elevation: 4,
            shape: const CircleBorder(),
            child: Image.asset(
              Assets.iconsNewscan,
              height: 28.h,
              color: Colors.white,
            ),
          ),
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        notchMargin: 12,
        shape: const CircularNotchedRectangle(),
        color: Colors.white,
        elevation: 10,
        child: Container(
          height: 75.h,
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(0, Assets.iconsHome, Assets.iconsHomeS, "Home"),
              _buildNavItem(1, Assets.iconsJobs, Assets.iconsJobsS, "Jobs"),

              50.widthSpace,
              _buildNavItem(3, Assets.iconsWallet, Assets.iconsWalletS, "Payments"),
              _buildNavItem(4, Assets.iconsUser, Assets.iconsUserS, "Profile"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String inactiveIcon, String activeIcon, String label) {
    bool isActive = selectedIndex == index;
    Color color = isActive ? AppColor.primary : const Color(0xff9E9E9E);

    return GestureDetector(
      onTap: () => setState(() => selectedIndex = index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        width: 65.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              isActive ? activeIcon : inactiveIcon,
              height: 24.h,
              width: 24.w,
              color: color,
            ),
            6.heightSpace,
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 12.sp,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}