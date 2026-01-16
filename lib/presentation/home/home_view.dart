import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/home/job_application_view.dart';
import 'package:jobssy/presentation/home/search_jobs_view.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/customfield_component.dart';
import '../../core/global_components/primary_button.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';
import 'widgets/location_permission_dialog.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isLocationEnabled = false;
  int selectedViewIndex = 0; // 0 for Map, 1 for List
  bool showJobPreview = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  30.heightSpace,
                  _buildHeader(),
                  25.heightSpace,
                  _buildSearchBar(),
                  15.heightSpace,
                  if (!isLocationEnabled) _buildSettingsNotice(context),
                  Expanded(
                    child: !isLocationEnabled
                        ? _buildLocationOffIllustration()
                        : (selectedViewIndex == 0
                            ? _buildMapView()
                            : _buildJobsListView()),
                  ),
                ],
              ),
            ),
            if (isLocationEnabled) _buildToggleButtons(),
            if (selectedViewIndex == 0 && showJobPreview)
              _buildJobPreviewCard(),

          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Good Morning",
                style: FontHelper.f16w500MediumStyle.copyWith(
                    color: AppColor.primary, fontWeight: FontWeight.w400)),
            Row(
              children: [
                Text("Ulrich Neilson",
                    style: FontHelper.f24w500MediumStyle.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 28.sp,
                        color: AppColor.primary)),
                5.widthSpace,
                Image.asset(Assets.iconsVerificationBadget,
                    width: 16.w, height: 16.h),
              ],
            ),
            5.heightSpace,
            Row(
              children: [
                Image.asset(Assets.iconsJobsLocation,
                    width: 18.w, height: 18.h),
                5.widthSpace,
                Text("Central park, DHA 2, Islamabad",
                    style: FontHelper.f14w400Regular
                        .copyWith(color: AppColor.primary)),
              ],
            ),
          ],
        ),
        Image.asset(Assets.iconsPnotifications, width: 24.w, height: 24.h),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => Get.to(() => const SearchJobsView()),
            child: AbsorbPointer(
              child: CustomFieldComponents(
                suffixIconWidget:
                    const Icon(Icons.search, color: AppColor.primary),
                controller: TextEditingController(),
                hintText: "Search here",
                hintStyle: FontHelper.f12w500MediumStyle.copyWith(
                    color: AppColor.tertiary, fontWeight: FontWeight.w200),
                height: 45.h,
              ),
            ),
          ),
        ),
        15.widthSpace,
        GestureDetector(
          onTap: () => _showFilterBottomSheet(context),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            width: 45.w,
            height: 45.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: AppColor.border),
            ),
            child: Image.asset(Assets.iconsFilter, fit: BoxFit.contain),
          ),
        )
      ],
    );
  }

  Widget _buildSettingsNotice(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
      decoration: BoxDecoration(
          color: AppColor.primary, borderRadius: BorderRadius.circular(10.r)),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Lookout requires location access to enable map. Please enable location services in your system settings to continue",
              style: FontHelper.f12w500MediumStyle.copyWith(
                  color: AppColor.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 9.sp),
            ),
          ),
          15.widthSpace,
          GestureDetector(
            onTap: () async {
              final result = await showDialog(
                context: context,
                builder: (_) => const LocationPermissionDialog(),
              );

              setState(() {
                isLocationEnabled = true;
              });
            },
            child: Text("Settings",
                style: FontHelper.f12w500MediumStyle.copyWith(
                    color: AppColor.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 10.sp)),
          )
        ],
      ),
    );
  }

  Widget _buildLocationOffIllustration() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Assets.iconsLocMap, width: 120.w, height: 120.h),
          20.heightSpace,
          Text("Your Location is off",
              style: FontHelper.f16w500MediumStyle
                  .copyWith(color: AppColor.black)),
          8.heightSpace,
          Text("Enable location services to get started",
              style: FontHelper.f12w500MediumStyle.copyWith(
                  color: AppColor.black, fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }

  Widget _buildMapView() {
    return GestureDetector(
      onTap: () {
        setState(() {
          showJobPreview = true;
        });
      },
      child: Container(
        height: 552.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          image: const DecorationImage(
            image: AssetImage(Assets.imagesLocOnMap),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildJobsListView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Nearby Jobs (3)",
            style: FontHelper.f16w500MediumStyle
                .copyWith(color: AppColor.black, fontWeight: FontWeight.w700)),
        7.heightSpace,
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) => _buildJobItem(),
          ),
        ),
      ],
    );
  }

  Widget _buildJobItem() {
    return Container(
      // height: 110.h,
      margin: EdgeInsets.only(bottom: 15.h),
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.border),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Barista",
                  style: FontHelper.f18BoldStyle.copyWith(
                      fontWeight: FontWeight.w600, color: AppColor.black)),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(7.5.r),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                  child: Text("Today",
                      style: FontHelper.f12w500MediumStyle.copyWith(
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff34A853)))),
            ],
          ),
          4.heightSpace,
          Row(
            children: [
              Text("Blue Bottle Coffee",
                  style: FontHelper.f14w400Regular
                      .copyWith(color: AppColor.tertiary)),
              const Spacer(),
              Image.asset(
                Assets.iconsJobsLocation,
                width: 15.w,
                height: 15.h,
              ),
              Text(" 0.8 mi",
                  style: FontHelper.f14w400Regular
                      .copyWith(color: AppColor.tertiary))
            ],
          ),
          10.heightSpace,
          Row(
            children: [
              Image.asset(
                Assets.iconsDollar,
                width: 15.w,
                height: 15.h,
              ),
              5.widthSpace,
              Text("\$18/hour",
                  style: FontHelper.f14w400Regular
                      .copyWith(color: AppColor.tertiary)),
              const Spacer(),
              Image.asset(
                Assets.iconsJobsTime,
                width: 15.w,
                height: 15.h,
              ),
              Text(" 7:00 AM - 3:00 PM",
                  style: FontHelper.f14w400Regular
                      .copyWith(color: AppColor.tertiary))
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButtons() {
    return Positioned(
      bottom: 30.h,
      right: 20.w,
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.primary,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                setState(() => selectedViewIndex = 1);
              },
              child: Container(
                width: 46.w,
                height: 46.h,
                decoration: BoxDecoration(
                  color: selectedViewIndex == 1
                      ? AppColor.primary
                      : AppColor.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.r),
                    bottomLeft: Radius.circular(5.r),
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    Assets.iconsJobsList,
                    width: 24.w,
                    height: 24.h,
                    color: selectedViewIndex == 1
                        ? AppColor.white
                        : AppColor.primary,
                  ),
                ),
              ),
            ),

            // 🔹 Map Button (Right)
            GestureDetector(
              onTap: () {
                setState(() => selectedViewIndex = 0);
              },
              child: Container(
                width: 46.w,
                height: 46.h,
                decoration: BoxDecoration(
                  color: selectedViewIndex == 0
                      ? AppColor.primary
                      : AppColor.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5.r),
                    bottomRight: Radius.circular(5.r),
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    Assets.iconsMapIcon,
                    width: 24.w,
                    height: 24.h,
                    color: selectedViewIndex == 0
                        ? AppColor.white
                        : AppColor.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJobPreviewCard() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 30.h),
        decoration: const BoxDecoration(
          color: AppColor.primary,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                 Icon(Icons.location_on, color: AppColor.white, size: 22.sp),
                7.widthSpace,
                Text(
                  "Vital Health Company Limited",
                  style: FontHelper.f16BoldStyle.copyWith(color: AppColor.white,fontWeight: FontWeight.w700),
                ),
              ],
            ),
            26.heightSpace,
            GestureDetector(
              onTap: () => _showJobDetailPopup(context),
              child: Text(
                "View Details",
                style: FontHelper.f14w400Regular.copyWith(
                  color: AppColor.secondary,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
            20.heightSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Generate Custom Alerts For This Area",
                  style: FontHelper.f14w400Regular.copyWith(
                      color: AppColor.secondary,
                      fontWeight: FontWeight.w700
                  ),                ),
                Switch(
                  value: true,
                  onChanged: (v) {},
                  activeColor: AppColor.white,
                  activeTrackColor: AppColor.primary,
                  inactiveTrackColor: AppColor.secondary,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}

void _showFilterBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.r)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30.w,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.heightSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 24),
                Text("Filter",
                    style: FontHelper.f24w500MediumStyle.copyWith(
                        color: AppColor.black, fontWeight: FontWeight.w700)),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.close,
                    color: AppColor.primary,
                  ),
                ),
              ],
            ),
            30.heightSpace,

            Text("Job Type",
                style: FontHelper.f20w500MediumStyle.copyWith(
                    color: AppColor.black, fontWeight: FontWeight.w700)),
            15.heightSpace,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: AppColor.border),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: "All",
                  items: ["All", "Barista", "Cleaner", "Cashier"]
                      .map((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                  onChanged: (_) {},
                ),
              ),
            ),
            20.heightSpace,

            Text("Distance",
                style: FontHelper.f20w500MediumStyle.copyWith(
                    color: AppColor.black, fontWeight: FontWeight.w700)),
            Slider(
                value: 0.4, onChanged: (v) {}, activeColor: AppColor.primary),

            Text("Pay Range",
                style: FontHelper.f20w500MediumStyle.copyWith(
                    color: AppColor.black, fontWeight: FontWeight.w700)),
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
                    style: FontHelper.f14w400Regular.copyWith(
                      color: AppColor.black,
                    )),
                Text("\$100/hr",
                    style: FontHelper.f14w400Regular.copyWith(
                      color: AppColor.black,
                    ))
              ],
            ),
            15.heightSpace,
            Text("Timing",
                style: FontHelper.f20w500MediumStyle.copyWith(
                    color: AppColor.black, fontWeight: FontWeight.w700)),
            15.heightSpace,
            _buildFilterCheckbox("Full Time", true),
            _buildFilterCheckbox("Part Time", false),
            _buildFilterCheckbox("Project based", false),

            30.heightSpace,
            PrimaryButton(
              height: 48.h,
              onTap: () {
                Navigator.pop(context);
                _showJobDetailPopup(context);
              },
              childWidget: Text(
                "Apply",
                style: FontHelper.f15w500MediumStyle.copyWith(
                    fontWeight: FontWeight.w600, color: AppColor.white),
              ),
              bgColor: AppColor.primary,
              borderRadius: 11.85.r,
              width: double.infinity,
            ),
            20.heightSpace,
          ],
        ),
      );
    },
  );
}

Widget _buildFilterCheckbox(String title, bool val) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title,
          style: FontHelper.f14w400Regular.copyWith(color: AppColor.tertiary)),
      Checkbox(value: val, onChanged: (v) {}, activeColor: AppColor.primary),
    ],
  );
}


void _showJobDetailPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: AppColor.white,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("U-Haul movers",
                        style: FontHelper.f24w500MediumStyle.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColor.primary)),
                    5.widthSpace,
                    Image.asset(Assets.iconsVerificationBadget,
                        width: 16.w, height: 16.h),
                  ],
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close,color: AppColor.primary,),
                ),
              ],
            ),
          ),

          Image.asset(Assets.imagesTruck, fit: BoxFit.cover, height: 250.h, width: double.infinity),
          10.heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              width: index == 0 ? 10 : 6,
              height: 6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: index == 0 ? AppColor.primary : Colors.blue.withOpacity(0.3),
              ),
            )),
          ),

          // Job Info Table
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              children: [
                _buildPopupRow("Role", "Designer"),
                _buildPopupRow("pay", "\$60"),
                _buildPopupRow("Time", "Full Time"),
                _buildPopupRow("Business", "Mevrick's Residence"),
                _buildPopupRow("Distance", "440 KM"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Ratings", style: FontHelper.f16w500MediumStyle.copyWith(color: AppColor.black,fontWeight: FontWeight.w400)),
                    const Row(
                      children: [
                        Icon(Icons.star, color: Colors.black, size: 14),
                        Icon(Icons.star, color: Colors.black, size: 14),
                        Icon(Icons.star_border, size: 14),
                        Icon(Icons.star_border, size: 14),
                        Icon(Icons.star_border, size: 14),
                      ],
                    )
                  ],
                ),
                25.heightSpace,
                // Apply Button
                PrimaryButton(
                  height: 48.h,
                  onTap: () {
                    Get.offAll(() => const JobApplicationView());
                  },
                  childWidget: Text(
                    "Apply Now",
                    style: FontHelper.f15w500MediumStyle.copyWith(
                        fontWeight: FontWeight.w600, color: AppColor.white),
                  ),
                  bgColor: AppColor.primary,
                  borderRadius: 11.85.r,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildPopupRow(String label, String value) {
  return Padding(
    padding: EdgeInsets.only(bottom: 7.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: FontHelper.f16w500MediumStyle.copyWith(color: AppColor.black,fontWeight: FontWeight.w400)),
        Text(value, style: FontHelper.f14w400Regular.copyWith(color: AppColor.black)),
      ],
    ),
  );
}