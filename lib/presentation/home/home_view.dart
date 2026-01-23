
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/home/widgets/location_permission_dialog.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/customfield_component.dart';
import '../../core/global_components/primary_button.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';
import '../notifications/notifications_view.dart';
import 'search_jobs_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isLocationEnabled = false;
  bool isMapView = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.heightSpace,
                  _buildHeader(),
                  20.heightSpace,
                  _buildSearchBar(),
                  24.heightSpace,

                  if (isMapView && isLocationEnabled) ...[
                    _buildMapView(),
                  ] else ...[
                    Text("Quick Access",
                        style: FontHelper.f14w500MediumStyle.copyWith(
                            color: AppColor.black,
                            fontWeight: FontWeight.bold)),
                    10.heightSpace,
                    _buildQuickAccess(),
                    24.heightSpace,
                    Text("My Actions",
                        style: FontHelper.f14w500MediumStyle.copyWith(
                            color: AppColor.black,
                            fontWeight: FontWeight.bold)),
                    15.heightSpace,
                    _buildMyActions(),
                    24.heightSpace,

                    if (!isLocationEnabled)
                      _buildEnableLocationPrompt()
                    else
                      _buildListViewContent(),
                  ],
                  80.heightSpace,
                ],
              ),
            ),
            // Floating Toggle Button
            if (isLocationEnabled) _buildViewToggleButton(),
          ],
        ),
      ),
    );
  }

  // --- Header ---
  Widget _buildHeader() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Image.asset(
            Assets.imagesHomeprofile,
            height: 45.h,
            width: 45.w,
            fit: BoxFit.cover,
          ),
        ),
        12.widthSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi, Martin.",
                style: FontHelper.f16BoldStyle.copyWith(color: AppColor.black)),
            2.heightSpace,
            Row(
              children: [
                Image.asset(Assets.iconsHomelocation,
                    height: 18.h, width: 14.w),
                4.widthSpace,
                Text("Downtown Dubai, UAE ",
                    style: TextStyle(fontSize: 11.sp, color: Colors.grey)),
                GestureDetector(
                  onTap: () {},
                  child: Text("Change",
                      style: TextStyle(
                          fontSize: 11.sp,
                          color: AppColor.primary,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => Get.to(() => const NotificationsView()),
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
        ),
      ],
    );
  }

  // --- Search Bar ---
  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: CustomFieldComponents(
            borderColor: AppColor.border,
            controller: TextEditingController(),
            hintText: "Search for a job",
            height: 48.h,
            prefixIconWidget:
                Image.asset(Assets.iconsHomesearch, height: 20.h, width: 20.w),
            onTap: () => Get.to(() => const SearchJobsView()),
          ),
        ),
        12.widthSpace,
        GestureDetector(
          onTap: () {
            _showFilterBottomSheet(context);
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
                child:
                    Image.asset(Assets.iconsFilter, height: 22.h, width: 22.w)),
          ),
        ),
      ],
    );
  }

  // --- Map View (Directly after Search) ---
  Widget _buildMapView() {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => const LocationPermissionDialog(),
        );
      },
      child: Container(
        height: 550.h, // Adjusted height for map-only view
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          image: const DecorationImage(
            image: AssetImage(Assets.imagesLocOnMap),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child:
                  Icon(Icons.location_on, color: AppColor.primary, size: 40.sp),
            ),
          ],
        ),
      ),
    );
  }

  // --- Toggle Button ---
  Widget _buildViewToggleButton() {
    return Positioned(
      bottom: 20.h,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          padding: EdgeInsets.all(4.r),
          decoration: BoxDecoration(
            color: AppColor.darkBlueText, // 🔹 Background Dark kar diya
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _toggleItem(
                  "List",
                  !isMapView
                      ? Assets.iconsListselected
                      : Assets.iconsListunselected,
                  !isMapView),
              _toggleItem(
                  "Map",
                  isMapView
                      ? Assets.iconsMapselected
                      : Assets.iconsMapunselected,
                  isMapView),
            ],
          ),
        ),
      ),
    );
  }

  Widget _toggleItem(String label, String icon, bool active) {
    return GestureDetector(
      onTap: () => setState(() => isMapView = label == "Map"),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: active ? AppColor.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Row(
          children: [
            Text(label,
                style: TextStyle(
                    color: AppColor.white,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600)),
            8.widthSpace,
            Image.asset(icon, width: 20.w, height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildEnableLocationPrompt() {
    return Center(
      child: Column(
        children: [
          40.heightSpace,
          Text("Enable location services to view nearby jobs",
              style: TextStyle(color: Colors.grey, fontSize: 13.sp)),
          20.heightSpace,
          PrimaryButton(
            height: 35.h,
            width: 131.w,
            onTap: () => setState(() => isLocationEnabled = true),
            childWidget: Text(
              "Enable location",
              style: FontHelper.f14w500MediumStyle
                  .copyWith(fontWeight: FontWeight.w700, color: AppColor.white),
            ),
            bgColor: AppColor.primary,
            borderRadius: 11.85.r,
          ),
        ],
      ),
    );
  }

  Widget _buildListViewContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Suggested Nearby Jobs",
                style: FontHelper.f14w500MediumStyle
                    .copyWith(fontWeight: FontWeight.bold)),
            Text("View All >",
                style: TextStyle(color: AppColor.primary, fontSize: 12.sp)),
          ],
        ),
        15.heightSpace,
        _buildJobItem(),
        _buildJobItem(),
      ],
    );
  }

  Widget _buildQuickAccess() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _quickAccessItem("Find Jobs", Assets.iconsFindjobs),
        _quickAccessItem("Categories", Assets.iconsCategories),
        _quickAccessItem("Earnings", Assets.iconsEarnings),
        _quickAccessItem("Saved Jobs", Assets.iconsSavedjobs),
      ],
    );
  }

  Widget _quickAccessItem(String title, String icon) {
    return Column(
      children: [
        Container(
          height: 60.h,
          width: 60.w,
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.border),
              color: AppColor.white,
              borderRadius: BorderRadius.circular(15.r)),
          child: Center(child: Image.asset(icon, width: 32.w, height: 32.h)),
        ),
        8.heightSpace,
        Text(title,
            style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildMyActions() {
    return Row(
      children: [
        _actionCard("2", "Active Jobs", Assets.iconsActivejobs),
        15.widthSpace,
        _actionCard("18", "Applied Jobs", Assets.iconsAppliedjobs),
      ],
    );
  }

  Widget _actionCard(String count, String title, String icon) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(15.w),
        decoration: BoxDecoration(
            color: AppColor.white,
            border: Border.all(color: AppColor.border),
            borderRadius: BorderRadius.circular(15.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(count,
                    style: TextStyle(
                        fontSize: 24.sp, fontWeight: FontWeight.bold)),
                Image.asset(icon, width: 22.w),
              ],
            ),
            5.heightSpace,
            Text(title, style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
          ],
        ),
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // 🔴 IMPORTANT
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
      ),
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFDAF0FF),
                Color(0xFFEEF9FF),
                Color(0xFFDFE0E2),
              ],
            ),
          ),
          child: SafeArea(
            top: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  30.heightSpace,

                  /// Title
                  Text(
                    "Select Filters",
                    style: FontHelper.f16BoldStyle.copyWith(
                      color: AppColor.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Text(
                    "Please select the filters as per your preferences.",
                    style: FontHelper.f13w400Regular
                        .copyWith(color: AppColor.tertiary),
                  ),

                  12.heightSpace,
                  Divider(color: AppColor.tertiary.withOpacity(0.5)),
                  12.heightSpace,

                  /// Job Type
                  Text(
                    "Job Type",
                    style: FontHelper.f14w400Regular
                        .copyWith(color: AppColor.black),
                  ),
                  7.heightSpace,

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: AppColor.border),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: "All",
                        dropdownColor: AppColor.white,
                        items: ["All", "Barista", "Cleaner", "Cashier"]
                            .map(
                              (value) => DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          ),
                        )
                            .toList(),
                        onChanged: (_) {},
                      ),
                    ),
                  ),

                  12.heightSpace,

                  /// Distance
                  Text(
                    "Distance",
                    style: FontHelper.f14w400Regular
                        .copyWith(color: AppColor.black),
                  ),

                  Slider(
                    value: 0.4,
                    onChanged: (v) {},
                    activeColor: AppColor.primary,
                  ),

                  /// Pay Range
                  Text(
                    "Pay Range",
                    style: FontHelper.f14w400Regular
                        .copyWith(color: AppColor.black),
                  ),

                  RangeSlider(
                    values: const RangeValues(20, 80),
                    min: 0,
                    max: 100,
                    onChanged: (v) {},
                    activeColor: AppColor.primary,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$5/hr",
                          style: FontHelper.f14w400Regular
                              .copyWith(color: AppColor.black)),
                      Text("\$100/hr",
                          style: FontHelper.f14w400Regular
                              .copyWith(color: AppColor.black)),
                    ],
                  ),

                  30.heightSpace,

                  /// Buttons
                  Row(
                    children: [
                      Expanded(
                        child: PrimaryButton(
                          onTap: () {},
                          height: 44.h,
                          bgColor: Colors.white,
                          borderRadius: 10.r,
                          childWidget: Text(
                            "Reset",
                            style: FontHelper.f15w600SemiBold
                                .copyWith(color: AppColor.tertiary),
                          ),
                        ),
                      ),
                      12.widthSpace,
                      Expanded(
                        child: PrimaryButton(
                          onTap: () {},
                          height: 44.h,
                          bgColor: AppColor.primary,
                          borderRadius: 10.r,
                          childWidget: Text(
                            "Apply Filters",
                            style: FontHelper.f15w600SemiBold
                                .copyWith(color: AppColor.white),
                          ),
                        ),
                      ),
                    ],
                  ),

                  20.heightSpace,
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildJobItem() {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: AppColor.border)),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.asset(Assets.imagesOnboard2,
                    height: 45.h, width: 45.w, fit: BoxFit.cover),
              ),
              12.widthSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Electrical Engineer", style: FontHelper.f16BoldStyle),
                  Row(
                    children: [
                      Text("Coffee, Dubai  .",
                          style: FontHelper.f12w500MediumStyle
                              .copyWith(color: AppColor.tertiary)),
                      10.widthSpace,
                      Image.asset(Assets.iconsJobcardmap,
                          height: 16.h, width: 16.w, fit: BoxFit.cover),
                      3.widthSpace,
                      Text(" 0.8 mi",
                          style: FontHelper.f12w500MediumStyle
                              .copyWith(color: AppColor.tertiary)),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              const Icon(Icons.favorite, color: Colors.red, size: 20),
            ],
          ),
          15.heightSpace,
          Row(
            children: [
              Image.asset(Assets.iconsDollar,
                  width: 15.w, height: 15.h, color: AppColor.primary),
              4.widthSpace,
              Text("25/hour",
                  style: FontHelper.f12w500MediumStyle
                      .copyWith(color: AppColor.tertiary)),
              10.widthSpace,
              Image.asset(Assets.iconsBlueCalender, width: 15.w, height: 15.h),
              Text(" 18 Dec",
                  style: FontHelper.f12w500MediumStyle
                      .copyWith(color: AppColor.tertiary)),
              10.widthSpace,
              Image.asset(Assets.iconsJobsTime,
                  width: 15.w, height: 15.h, color: AppColor.primary),
              Text(" 7:00 AM - 3:00 PM",
                  style: FontHelper.f12w500MediumStyle
                      .copyWith(color: AppColor.tertiary))
            ],
          ),
        ],
      ),
    );
  }
}
