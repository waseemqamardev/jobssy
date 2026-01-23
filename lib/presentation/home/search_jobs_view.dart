import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/home/search_result_list_view.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/customfield_component.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';

class SearchJobsView extends StatelessWidget {
  const SearchJobsView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> recentSearches = [
      {
        "title": "Vital Health Company Limited",
        "address": "Health Company Ave, E-8, United State of America,"
      },
      {
        "title": "Vital Health Company Limited",
        "address": "Health Company Ave, E-8, United State of America,"
      },
      {"title": "Final Tour Spot", "address": ""},
      {"title": "Vital Health Company Limited", "address": ""},
      {"title": "Vital Health Company Limited", "address": ""},
      {"title": "Vital Health Company Limited", "address": ""},
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              60.heightSpace,
              _buildSearchBar(),
              14.heightSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent",
                    style: FontHelper.f14w400Regular.copyWith(
                      color: AppColor.tertiary,
                    ),
                  ),
                  Text(
                    "Clear All",
                    style: FontHelper.f12w500MediumStyle.copyWith(
                      color: AppColor.primary,
                    ),
                  ),
                ],
              ),
              15.heightSpace,
              Expanded(
                child: ListView.separated(
                  itemCount: recentSearches.length,
                  separatorBuilder: (context, index) =>
                      const Divider(color: AppColor.border, thickness: 0.5),
                  itemBuilder: (context, index) {
                    return _buildRecentItem(
                      recentSearches[index]['title']!,
                      recentSearches[index]['address']!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Get.back();
          },
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
              borderColor: AppColor.border,
              controller: TextEditingController(),
              hintText: "Search",
              height: 44.h,
              prefixIconWidget: Image.asset(Assets.iconsHomesearch,
                  height: 20.h, width: 20.w),
              onTap: () {}),
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

  Widget _buildRecentItem(String title, String address) {
    return GestureDetector(
      onTap: (){
        Get.to(SearchResultListView());

      },
      child: ListTile(
        leading: Container(
          child: Image.asset(
            Assets.iconsSearchHistory,
            width: 23.w,
            height: 20.h,
          ),
        ),
        title: Text(
          title,
          style: FontHelper.f14w400Regular.copyWith(
            color: AppColor.black,
          ),
        ),
        subtitle: address.isNotEmpty
            ? Text(
                address,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: FontHelper.f14w400Regular
                    .copyWith(color: AppColor.tertiary, fontSize: 11.sp),
              )
            : null,
        trailing: Icon(Icons.close, color: AppColor.tertiary, size: 18.sp),
      ),
    );
  }
}
