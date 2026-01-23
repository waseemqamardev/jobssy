import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/home/job_details_view.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/customfield_component.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';

class SearchResultListView extends StatefulWidget {
  const SearchResultListView({super.key});

  @override
  State<SearchResultListView> createState() => _SearchResultListViewState();
}

class _SearchResultListViewState extends State<SearchResultListView> {
  bool isMapView = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                60.heightSpace,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: _buildSearchBar(),
                ),
                24.heightSpace,

                // 🔹 Conditional Content: Map or List
                Expanded(
                  child: isMapView ? _buildMapContent() : _buildListContent(),
                ),
              ],
            ),
            _buildViewToggleButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildMapContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Text("Search Results (2)",
              style: FontHelper.f14w500MediumStyle.copyWith(
                  color: AppColor.black, fontWeight: FontWeight.w700)),
        ),
        20.heightSpace,
        Expanded(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.imagesLocOnMap),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 100.h,
                right: 18.w,
                child: Container(
                  padding: EdgeInsets.all(10.r),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 5)
                    ],
                  ),
                  child: const Icon(Icons.my_location, color: AppColor.primary),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildListContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Search Results (2)",
              style: FontHelper.f14w500MediumStyle.copyWith(
                  color: AppColor.black, fontWeight: FontWeight.w700)),
          14.heightSpace,
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(bottom: 100.h),
              children: [
                _buildJobItem(),
                8.heightSpace,
                _buildJobItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildViewToggleButton() {
    return Positioned(
      bottom: 30.h,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          padding: EdgeInsets.all(4.r),
          decoration: BoxDecoration(
            color: AppColor.darkBlueText,
            borderRadius: BorderRadius.circular(30.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              )
            ],
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
      onTap: () {
        setState(() {
          isMapView = (label == "Map");
        });
      },
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

  Widget _buildSearchBar() {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            height: 44.h,
            width: 44.w,
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColor.border),
            ),
            child: Center(
                child: Icon(Icons.arrow_back_ios,
                    color: AppColor.tertiary, size: 14.sp)),
          ),
        ),
        10.widthSpace,
        Expanded(
          child: CustomFieldComponents(
            borderColor: AppColor.lightGrey,
            controller: TextEditingController(),
            hintText: "Vital Health",
            height: 44.h,
            suffixIconWidget:
                const Icon(Icons.close, color: Colors.grey, size: 20),
          ),
        ),
        10.widthSpace,
        Container(
          height: 44.h,
          width: 44.w,
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColor.border),
          ),
          child: Center(
              child:
                  Image.asset(Assets.iconsFilter, height: 22.h, width: 22.w)),
        ),
      ],
    );
  }

  Widget _buildJobItem() {
    return
      GestureDetector(onTap: (){
        Get.to(JobDetailsView());
      },
    child:
      Container(
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
              const Icon(Icons.favorite_outline_rounded,
                  color: Colors.grey, size: 20),
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
    ));
  }
}
