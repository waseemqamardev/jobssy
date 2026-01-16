import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobssy/presentation/customer_jobs/project_overview_view.dart';
import '../../core/configs/colors/app_colors.dart';
import '../../core/configs/font_style.dart';
import '../../core/global_components/customfield_component.dart';
import '../../core/global_components/primary_button.dart';
import '../../core/utils/extensions.dart';
import '../../generated/assets.dart';

class ProposalsListView extends StatefulWidget {
  const ProposalsListView({super.key});

  @override
  State<ProposalsListView> createState() => _ProposalsListViewState();
}

class _ProposalsListViewState extends State<ProposalsListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
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
          "Proposals",
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              color: AppColor.border,
              thickness: 1,
            ),
            15.heightSpace,
            Text(
              "Barista Proposals",
              style: FontHelper.f16w500MediumStyle
                  .copyWith(fontWeight: FontWeight.w700, color: AppColor.black),
            ),
            15.heightSpace,
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _showProposalDetailSheet(context),
                  child: _buildProposalTile(
                    name: "Jessica Malan",
                    rating: "4.95 (22)",
                    time: "10m ago",
                    image: Assets.imagesPerson,
                  ),
                );
              },
            ),
            15.heightSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Proposals Rejected(4)",
                  style: FontHelper.f16w500MediumStyle.copyWith(
                      fontWeight: FontWeight.w700, color: AppColor.black),
                ),
                Icon(Icons.keyboard_arrow_down, size: 28.sp),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProposalTile({
    required String name,
    required String rating,
    required String time,
    required String image,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppColor.border),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.r,
            backgroundImage: AssetImage(image),
          ),
          15.widthSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: FontHelper.f14w400Regular.copyWith(
                      fontWeight: FontWeight.w500, color: AppColor.black),
                ),
                5.heightSpace,
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 14),
                    2.widthSpace,
                    Text(
                      rating,
                      style: FontHelper.f14w400Regular.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColor.black,
                          fontSize: 10.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(
                Icons.north_east,
                color: AppColor.secondary,
                size: 20.sp,
              ),
              10.heightSpace,
              Text(
                time,
                style: FontHelper.f12w500MediumStyle.copyWith(
                    fontWeight: FontWeight.w400, color: AppColor.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void _showProposalDetailSheet(BuildContext context) {
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String selectedCountry = "Pakistan";
  String selectedGender = "Female";
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 15.r,
                backgroundImage: const AssetImage(Assets.imagesPerson),
              ),
              10.widthSpace,
              Text("Jessica Malan",
                  style: FontHelper.f16BoldStyle.copyWith(
                      fontWeight: FontWeight.w700, color: AppColor.black)),
              5.widthSpace,
              const Icon(Icons.star, color: Colors.amber, size: 14),
              Text("4.95 (22)",
                  style: FontHelper.f12w500MediumStyle.copyWith(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.black)),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.close, color: AppColor.primary),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
          30.heightSpace,

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                CustomFieldComponents(
                  hint: "Full Name",
                  hintText: "Akbar khan",
                  controller: nameController,
                ),
                12.heightSpace,
                CustomFieldComponents(
                  hint: "Experience",
                  hintText: "1-6 months",
                  controller: nameController,
                ),
                12.heightSpace,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Nationality",
                    style: FontHelper.f14w500MediumStyle.copyWith(
                      color: AppColor.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                4.heightSpace,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  height: 56.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedCountry,
                      isExpanded: true,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.black),
                      items: ["Iran", "Pakistan", "India", "China"]
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                              style: FontHelper.f16w500MediumStyle
                                  .copyWith(color: AppColor.black)),
                        );
                      }).toList(),
                      onChanged: (newValue) {},
                    ),
                  ),
                ),
                12.heightSpace,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Gender",
                    style: FontHelper.f14w500MediumStyle.copyWith(
                      color: AppColor.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                4.heightSpace,
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  height: 56.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedGender,
                      isExpanded: true,
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.black),
                      items: [
                        "Male",
                        "Female",
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                              style: FontHelper.f16w500MediumStyle
                                  .copyWith(color: AppColor.black)),
                        );
                      }).toList(),
                      onChanged: (newValue) {},
                    ),
                  ),
                ),
                12.heightSpace,
                CustomFieldComponents(
                  hint: "Contact",
                  hintText: "+470 5467 0000 123",
                  controller: nameController,
                ),
              ],
            ),
          ),
          const Spacer(),

          // Action Buttons
          Row(
            children: [
              Expanded(
                child: _actionButton(
                    "Accept", AppColor.primary, AppColor.white, () {
                      Get.to(ProjectOverviewView());
                }),
              ),
              12.widthSpace,
              Expanded(
                child: _actionButton(
                  "Reject",
                  AppColor.white,
                  AppColor.primary,
                  () {
                     
                  },
                  isOutlined: true,
                ),
              ),
            ],
          ),
          20.heightSpace,
        ],
      ),
    ),
  );
}

Widget _actionButton(String title, Color bg, Color text, VoidCallback onTap,
    {bool isOutlined = false}) {
  return PrimaryButton(
    onTap: onTap,
    width: double.infinity,
    height: 44.h,
    bgColor: bg,
    borderColor: isOutlined ? AppColor.primary : null,
    borderRadius: 10.r,
    childWidget: Text(
      title,
      style: FontHelper.f15w600SemiBold.copyWith(color: text),
    ),
  );
}
