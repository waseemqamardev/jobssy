import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/authentication/login_view.dart';
import '../../../core/global_components/primary_button.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';
import '../home_screen.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": Assets.imagesOnboard1,
      "title": "Book a Shift in One Tap",
      "desc":
          "No long processes. Just tap “Book Now” and secure the job instantly",
    },
    {
      "image": Assets.imagesOnboard2,
      "title": "Get Paid Instantly",
      "desc":
          "Your earnings go straight into your in-app wallet — withdraw anytime.",
    },
    {
      "image": Assets.imagesOnboard2,
      "title": "Verified Workers",
      "desc":
          "Built-in KYC & ratings ensure that both sides stay protected and trusted.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () => Get.offAll(() => const HomeScreen()),
            child: Row(
              children: [
                Text("Skip",
                    style: FontHelper.f12w500MediumStyle
                        .copyWith(color: AppColor.black)),
                5.widthSpace,
                Icon(Icons.arrow_forward, color: AppColor.black, size: 24.sp),
              ],
            ),
          ),
          16.widthSpace,
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        onboardingData[index]["image"]!,
                        height: 244.h,
                        width: 244.w,
                        fit: BoxFit.contain,
                      ),
                      60.heightSpace,
                      Text(
                        onboardingData[index]["title"]!,
                        textAlign: TextAlign.center,
                        style: FontHelper.f20w500MediumStyle.copyWith(
                          color: AppColor.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      56.heightSpace,
                      Text(
                        onboardingData[index]["desc"]!,
                        textAlign: TextAlign.center,
                        style: FontHelper.f14w500MediumStyle.copyWith(
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff0E0E0F),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Custom Indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onboardingData.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                height: 4.h,
                width: _currentPage == index ? 24.w : 12.w,
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? AppColor.secondary
                      : AppColor.secondary.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
            ),
          ),

          42.heightSpace,

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: PrimaryButton(
              height: 48.h,
              onTap: () {
                if (_currentPage < onboardingData.length - 1) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                } else {
                  Get.offAll(() => const LoginView());
                }
              },
              childWidget: Text(
                _currentPage == onboardingData.length - 1
                    ? "Get Started"
                    : "Next",
                style: FontHelper.f16w500MediumStyle.copyWith(
                    fontWeight: FontWeight.w600, color: AppColor.white),
              ),
              bgColor: AppColor.primary,
              borderRadius: 11.85.r,
              width: double.infinity,
            ),
          ),

          50.heightSpace,
        ],
      ),
    );
  }
}
