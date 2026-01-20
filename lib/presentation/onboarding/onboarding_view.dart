



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/authentication/login_view.dart';
import 'package:jobssy/presentation/home/home_view.dart';
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
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: onboardingData.length,
            itemBuilder: (context, index) {
              return Image.asset(
                onboardingData[index]["image"]!,
                fit: BoxFit.cover, //
                width: double.infinity,
                height: double.infinity,
              );
            },
          ),

          Positioned(
            top: 60.h,
            left: 20,
            right: 20,
            child: Row(
              children: List.generate(
                onboardingData.length,
                    (index) => Expanded(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? AppColor.reBlueShadeText
                          : AppColor.white.withOpacity(0.40),
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            left: 20,
            right: 20,
            top: 120.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  onboardingData[_currentPage]["title"]!,
                  textAlign: TextAlign.start,
                  style: FontHelper.f20w500MediumStyle.copyWith(
                      color: AppColor.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 32.sp
                  ),
                ),
                20.heightSpace,
                Text(
                  onboardingData[_currentPage]["desc"]!,
                  textAlign: TextAlign.start,
                  style: FontHelper.f14w500MediumStyle.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColor.white,
                  ),
                ),
              ],
            ),
          ),


          Positioned(
            bottom: 60.h,
            right: 20.w,
            left: 20.w,
            child: Padding(
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
                    Get.to(() => const LoginView());
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
          ),

        ],
      ),
    );
  }
}

