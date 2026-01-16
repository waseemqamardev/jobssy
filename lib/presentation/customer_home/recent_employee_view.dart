import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';

class RecentEmployeeView extends StatelessWidget {
  const RecentEmployeeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 100.h,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Recent Employee",
          style: FontHelper.f24w500MediumStyle.copyWith(
            color: AppColor.black,
            fontWeight: FontWeight.w700,
            fontSize: 26.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            const Divider(
              color: AppColor.border,
              thickness: 1,
            ),
            15.heightSpace,
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 70.r,
                    backgroundImage: const AssetImage(Assets.imagesPerson),
                  ),
                  10.heightSpace,
                  Text(
                    "Jessica Malan",
                    style: FontHelper.f18BoldStyle.copyWith(
                      color: AppColor.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            30.heightSpace,

            _buildInfoRow("Availability", "Full Time"),
            20.heightSpace,

            // Ratings Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Ratings",
                    style: FontHelper.f16w500MediumStyle.copyWith(
                        fontWeight: FontWeight.w700, color: AppColor.black)),
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      index < 2 ? Icons.star : Icons.star_border,
                      color: index < 2 ? Colors.amber : Colors.grey,
                      size: 22.sp,
                    );
                  }),
                ),
              ],
            ),
            30.heightSpace,
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Recent Jobs",
                style: FontHelper.f13w400Regular.copyWith(
                    fontWeight: FontWeight.w700, color: AppColor.black),
              ),
            ),
            15.heightSpace,
            _buildRecentJobCard(
              title: "U-Haul Movers",
              rating: "4.95",
              description:
                  "Excellent support for my interview prep. The mock technical interviews and feedback really boosted my confidence and helped me land a software engineering role.",
              avatar: Assets.imagesPerson,
            ),
            _buildRecentJobCard(
              title: "Barrista Cafe",
              rating: "4.95",
              description:
                  "Great experience! The tutor explained complex concepts in a simple way and was always responsive to questions.",
              avatar: Assets.imagesPerson,
            ),
            _buildRecentJobCard(
              title: "Jobsy Inc.",
              rating: "4.95 (22)",
              description:
                  "Great experience! The tutor explained complex concepts in a simple way and was always responsive to questions.",
              avatar: Assets.imagesPerson,
            ),
            20.heightSpace,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: FontHelper.f16w500MediumStyle
                .copyWith(fontWeight: FontWeight.w700, color: AppColor.black)),
        Text(value,
            style: FontHelper.f14w400Regular.copyWith(color: AppColor.black)),
      ],
    );
  }

  Widget _buildRecentJobCard({
    required String title,
    required String rating,
    required String description,
    required String avatar,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.h),
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: AppColor.lightGrey.withOpacity(0.6),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 12.r,
                backgroundImage: AssetImage(avatar),
              ),
              10.widthSpace,
              Text(title,
                  style: FontHelper.f14w400Regular.copyWith(
                      fontWeight: FontWeight.w700, color: AppColor.black)),
              const Spacer(),
              const Icon(Icons.star, color: Colors.amber, size: 14),
              5.widthSpace,
              Text(rating,
                  style: FontHelper.f14w400Regular
                      .copyWith(color: AppColor.black, fontSize: 10.sp)),
            ],
          ),
          10.heightSpace,
          Text(
            description,
            style: FontHelper.f14w400Regular
                .copyWith(color: AppColor.black, fontSize: 11.sp)
          ),
        ],
      ),
    );
  }
}
