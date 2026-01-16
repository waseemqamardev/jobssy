import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              60.heightSpace,
              CustomFieldComponents(
                prefixIconWidget: Icon(Icons.arrow_back_ios,
                    color: AppColor.primary, size: 16.sp),
                suffixIconWidget: Image.asset(
                  Assets.iconsWalletsearch,
                  width: 16.w,
                  height: 16.h,
                ),
                controller: TextEditingController(),
                hintText: "Search by Area, Company e.t.c.",
                hintStyle: FontHelper.f12w500MediumStyle.copyWith(
                  color: AppColor.tertiary,
                  fontWeight: FontWeight.w400,
                ),
                height: 40.h,
              ),
              14.heightSpace,
              Text(
                "Recent",
                style: FontHelper.f14w400Regular.copyWith(
                  color: AppColor.tertiary,
                ),
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

  Widget _buildRecentItem(String title, String address) {
    return ListTile(
      leading: Container(
        child: Image.asset(
          Assets.iconsSearchHistory,
          width: 23.w,
          height: 20.h,
        ),
      ),
      title: Text(
        title,
        style:  FontHelper.f14w400Regular.copyWith(
      color: AppColor.black,
      ),
      ),
      subtitle: address.isNotEmpty
          ? Text(
              address,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
        style: FontHelper.f14w400Regular.copyWith(
          color: AppColor.tertiary,
          fontSize: 11.sp
        ),
            )
          : null,
    );
  }
}
