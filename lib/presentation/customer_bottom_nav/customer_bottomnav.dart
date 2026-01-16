import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobssy/presentation/business_profile/business_profile_view.dart';
import 'package:jobssy/presentation/customer_home/customer_home_view.dart';
import 'package:jobssy/presentation/customer_jobs/customer_jobs_view.dart';
import 'package:jobssy/presentation/jobs_in_progress/jobs_in_progress_view.dart';
import 'package:jobssy/presentation/qr_scan/qr_scan_view.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';
import '../business_profile/customer_profile.dart';
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
    const JobsInProgressView(),
    const QRScanView(),
    const WalletView(),
    const CustomerProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[selectedIndex],

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 65.h,
        width: 65.w,
        decoration: const BoxDecoration(
          color: AppColor.primary,
          shape: BoxShape.circle,
        ),
        child: FloatingActionButton(
          onPressed: () => setState(() => selectedIndex = 2),
          backgroundColor: AppColor.primary,
          elevation: 0,
          shape: const CircleBorder(),
          child: Image.asset(
            Assets.iconsScan,
            height: 30.h,
            color: Colors.white,
          ),
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        notchMargin: 10,
        shape: const CircularNotchedRectangle(),
        color: AppColor.primary,
        child: Container(
          height: 70.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(0, Assets.iconsHome, Assets.iconsHomeS, "Home"),
              _buildNavItem(1, Assets.iconsJobs, Assets.iconsJobsS, "Jobs"),

              SizedBox(width: 40.w),

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
    return GestureDetector(
      onTap: () => setState(() => selectedIndex = index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            isActive ? activeIcon : inactiveIcon,
            height: 22.h,
            width: 22.w,
            color: Colors.white,
          ),
          4.heightSpace,
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}