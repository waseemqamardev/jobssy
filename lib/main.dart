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
import 'package:jobssy/presentation/authentication/signup_view.dart';
import 'package:jobssy/presentation/business_profile/business_profile_view.dart';
import 'package:jobssy/presentation/customer_auth/customer_profile_setup_view.dart';
import 'package:jobssy/presentation/customer_auth/customer_signup_view.dart';
import 'package:jobssy/presentation/customer_bottom_nav/customer_bottomnav.dart';
import 'package:jobssy/presentation/customer_home/add_jobpost_view.dart';
import 'package:jobssy/presentation/customer_home/customer_home_view.dart';
import 'package:jobssy/presentation/customer_home/recent_employee_view.dart';
import 'package:jobssy/presentation/customer_jobs/customer_jobs_view.dart';
import 'package:jobssy/presentation/customer_jobs/project_overview_view.dart';
import 'package:jobssy/presentation/customer_jobs/proposal_view.dart';
import 'package:jobssy/presentation/customer_jobs/proposals_list_view.dart';
import 'package:jobssy/presentation/home/home_view.dart';
import 'package:jobssy/presentation/home/job_application_view.dart';
import 'package:jobssy/presentation/home/search_jobs_view.dart';
import 'package:jobssy/presentation/home_screen.dart';
import 'package:jobssy/presentation/jobs/my_jobs_view.dart';
import 'package:jobssy/presentation/jobs/pending_jobs_view.dart';
import 'package:jobssy/presentation/jobs/warehouse_associate_view.dart';
import 'package:jobssy/presentation/jobs_in_progress/employee_feedback_view.dart';
import 'package:jobssy/presentation/jobs_in_progress/job_not_completed_view.dart';
import 'package:jobssy/presentation/jobs_in_progress/jobs_in_progress_view.dart';
import 'package:jobssy/presentation/jobs_in_progress/proposal_detail_view.dart';
import 'package:jobssy/presentation/kyc/kyc_info_view.dart';
import 'package:jobssy/presentation/notifications/notifications_view.dart';
import 'package:jobssy/presentation/onboarding/onboarding_view.dart';
import 'package:jobssy/presentation/profile/edit_profile_view.dart';
import 'package:jobssy/presentation/profile/kyc_unverified_view.dart';
import 'package:jobssy/presentation/profile/kyc_verified_view.dart';
import 'package:jobssy/presentation/profile/password_reset_success_view.dart';
import 'package:jobssy/presentation/profile/password_verification_view.dart';
import 'package:jobssy/presentation/profile/profile_view.dart';
import 'package:jobssy/presentation/profile/verification_code_view.dart';
import 'package:jobssy/presentation/profile/verification_email_view.dart';
import 'package:jobssy/presentation/qr_scan/qr_scan_view.dart';
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
      statusBarColor: AppColor.black,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: AppColor.primary,
      systemNavigationBarIconBrightness: Brightness.dark,
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
          title: 'WinkUp App',
          theme: ThemeData(
            primaryColor: AppColor.black,
            scaffoldBackgroundColor: AppColor.black,
            fontFamily: 'Helvetica Now Display',
            iconTheme: const IconThemeData(color: AppColor.black),
            appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarIconBrightness: Brightness.dark,
                statusBarColor: AppColor.black,
                systemNavigationBarColor: AppColor.black,
                systemNavigationBarIconBrightness: Brightness.dark,
              ),
            ),
          ),
          // getPages: AppRoutes.appRoute(),
          // initialRoute: RouteName.bottomNavigationScreen,
          home: const SplashView(),
        );
      },
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

  final List<String> inactiveIcons = [
    Assets.iconsHome,
    Assets.iconsJobs,
    Assets.iconsWallet,
    Assets.iconsUser,
  ];

  // Active Icons (Selected/Filled)
  final List<String> activeIcons = [
    Assets.iconsHomeS,
    Assets.iconsJobsS,
    Assets.iconsWalletS,
    Assets.iconsUserS,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: Container(
        height: 85.h,
        decoration: const BoxDecoration(
          color: AppColor.primary,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(4, (index) {
            bool isActive = selectedIndex == index;

            return GestureDetector(
              onTap: () => setState(() => selectedIndex = index),
              behavior: HitTestBehavior.opaque,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: isActive ? 70.w : 0,
                    height: 2.h,
                    color: Colors.white,
                  ),
                  15.heightSpace,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        isActive ? activeIcons[index] : inactiveIcons[index],
                        height: 22.h,
                        width: 22.w,
                        color: Colors.white,
                      ),
                      if (isActive) ...[
                        8.widthSpace,
                        Text(
                          labels[index],
                          style: FontHelper.f14w400Regular.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ],
                  ),

                  15.heightSpace,
                  // Bottom White Line (Sirf active item ke liye)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: isActive ? 70.w : 0,
                    height: 2.h,
                    color: Colors.white,
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
