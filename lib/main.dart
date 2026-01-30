import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:jobssy/presentation/authentication/check_mail_view.dart';
import 'package:jobssy/presentation/authentication/forgot_password_view.dart';
import 'package:jobssy/presentation/authentication/login_view.dart';
import 'package:jobssy/presentation/authentication/password_changed_view.dart';
import 'package:jobssy/presentation/authentication/set_new_password_view.dart';
import 'package:jobssy/presentation/authentication/employee_sign_up/signup_view.dart';
import 'package:jobssy/presentation/customer_auth/customer_profile_setup_view.dart';
import 'package:jobssy/presentation/customer_auth/customer_signup_view.dart';
import 'package:jobssy/presentation/customer_auth/customer_verify_email_view.dart';

import 'package:jobssy/presentation/customer_bottom_nav/customer_bottomnav.dart';
import 'package:jobssy/presentation/customer_home/add_jobpost_view.dart';
import 'package:jobssy/presentation/customer_home/customer_home_view.dart';
import 'package:jobssy/presentation/customer_jobs/all_reviews_view.dart';
import 'package:jobssy/presentation/customer_jobs/customer_jobs_view.dart';
import 'package:jobssy/presentation/customer_jobs/job_summary_view.dart';
import 'package:jobssy/presentation/customer_jobs/posted_job_details_view.dart';
import 'package:jobssy/presentation/customer_profile/customer_view_profile_view.dart';
import 'package:jobssy/presentation/customer_wallet/customer_wallet_view.dart';
import 'package:jobssy/presentation/employee_profile_setup/employee_profile_setup_view.dart';
import 'package:jobssy/presentation/home/home_view.dart';
import 'package:jobssy/presentation/home/job_application_view.dart';
import 'package:jobssy/presentation/home/job_details_view.dart';
import 'package:jobssy/presentation/home/search_jobs_view.dart';
import 'package:jobssy/presentation/home/search_result_list_view.dart';
import 'package:jobssy/presentation/home_screen.dart';
import 'package:jobssy/presentation/jobs/applied_job_detail_view.dart';
import 'package:jobssy/presentation/jobs/my_jobs_view.dart';
import 'package:jobssy/presentation/jobs/ongoing_job_view.dart';
import 'package:jobssy/presentation/jobs/upcoming_job_detail_view.dart';
import 'package:jobssy/presentation/kyc/kyc_info_view.dart';
import 'package:jobssy/presentation/notifications/notifications_view.dart';
import 'package:jobssy/presentation/onboarding/onboarding_view.dart';

import 'package:jobssy/presentation/profile/change_password_view.dart';
import 'package:jobssy/presentation/profile/profile_notifications_view.dart';
import 'package:jobssy/presentation/profile/profile_view.dart';
import 'package:jobssy/presentation/profile/verification_code_view.dart';
import 'package:jobssy/presentation/profile/verification_email_view.dart';
import 'package:jobssy/presentation/profile/view_profile_view.dart';
import 'package:jobssy/presentation/qr_scan/rejected_job_view.dart';
import 'package:jobssy/presentation/qr_scan/scan_active_jobs_detail_view.dart';
import 'package:jobssy/presentation/qr_scan/scan_finish_job_details_view.dart';
import 'package:jobssy/presentation/qr_scan/scan_ongoing_job_view.dart';
import 'package:jobssy/presentation/qr_scan/scan_qrcode_view.dart';
import 'package:jobssy/presentation/qr_scan/scanqr_employee_feedback_view.dart';
import 'package:jobssy/presentation/qr_scan/start_job_view.dart';
import 'package:jobssy/presentation/roles/select_role_view.dart';
import 'package:jobssy/presentation/splash/splash_view.dart';
import 'package:jobssy/presentation/wallet/invoice_details_view.dart';
import 'package:jobssy/presentation/wallet/wallet_view.dart';

import 'core/configs/colors/app_colors.dart';
import 'core/configs/font_style.dart';
import 'core/configs/routers/routers.dart';
import 'core/configs/routers/routers_name.dart';
import 'core/utils/extensions.dart';
import 'generated/assets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColor.reBlueShadeText,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColor.reBlueShadeText,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Jobssy App',
          theme: ThemeData(
            primaryColor: AppColor.black,
            fontFamily: 'Helvetica Now Display',
            iconTheme: const IconThemeData(color: AppColor.black),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.light,
                statusBarColor: Colors.transparent,
                systemNavigationBarIconBrightness: Brightness.light,
              ),
            ),
          ),

          builder: (context, child) {
            return SafeArea(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFDAF0FF),
                      Color(0xFFEEF9FF),
                      Color(0xFFDFE0E2),
                    ],
                  ),
                ),
                child: child,
              ),
            );
          },
          home: const SplashView(),
        );
      },
    );
  }
}


class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFDAF0FF),
            Color(0xFFEEF9FF),
            Color(0xFFDFE0E2),
          ],
        ),
      ),
      child: child,
    );
  }
}



class SimpleBottomNav extends StatefulWidget {
  const SimpleBottomNav({super.key});

  @override
  State<SimpleBottomNav> createState() => _SimpleBottomNavState();
}

class _SimpleBottomNavState extends State<SimpleBottomNav> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    const HomeView(),
    const MyJobsView(),
    const WalletView(),
    const ProfileView(),
  ];

  final List<String> labels = ["Home", "Jobs", "Wallet", "Profile"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: screens[selectedIndex],
      bottomNavigationBar: Container(
        height: 75.h,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(4, (index) {
            bool isActive = selectedIndex == index;

            String iconPath = _getIconPath(index, isActive);

            return GestureDetector(
              onTap: () => setState(() => selectedIndex = index),
              behavior: HitTestBehavior.opaque,
              child: SizedBox(
                width: 60.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      iconPath,
                      height: 24.h,
                      width: 24.w,
                      color: isActive ? AppColor.primary : Colors.grey.shade400,
                    ),
                    4.heightSpace,
                    Text(
                      labels[index],
                      style: FontHelper.f12w500MediumStyle.copyWith(
                        fontSize: 12.sp,
                        fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                        color: isActive ? AppColor.primary : Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  String _getIconPath(int index, bool isActive) {
    switch (index) {
      case 0: return isActive ? Assets.iconsHomeS : Assets.iconsHome;
      case 1: return isActive ? Assets.iconsJobsS : Assets.iconsJobs;
      case 2: return isActive ? Assets.iconsWalletS : Assets.iconsWallet;
      case 3: return isActive ? Assets.iconsUserS : Assets.iconsUser;
      default: return Assets.iconsHome;
    }
  }
}




