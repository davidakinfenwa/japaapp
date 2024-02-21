import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/route/app_router.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/presentation/shared/profile_avatar.dart';
import 'package:japaapp/presentation/shared/progress_bar.dart';


class TaskListItem extends StatefulWidget {
  const TaskListItem({
    super.key,
  });

  @override
  State<TaskListItem> createState() => _TaskListItemState();
}

class _TaskListItemState extends State<TaskListItem> {
  final List<Widget> _imagesh = [
    const ProfileAvatar(
      imageUrl: "assets/images/whiteman.jpg",
      radius: 20,
    ),
    const ProfileAvatar(
      imageUrl: "assets/images/whiteman.jpg",
      radius: 20,
    ),
    const ProfileAvatar(
      imageUrl: "assets/images/whiteman.jpg",
      radius: 20,
    ),
    const ProfileAvatar(
      imageUrl: "assets/images/whiteman.jpg",
      radius: 20,
    ),
  ];
  Widget _buildImageListSection() {
    return FlutterImageStack.widgets(
      showTotalCount: true,
      totalCount: 2,
      itemRadius: 30, // Radius of each images
      itemCount: 2, // Maximum number of images to be shown in stack
      itemBorderWidth: 0,
      backgroundColor: Colors.black,
      extraCountTextStyle: const TextStyle(color: Colors.white),
      children: _imagesh, // Border width around the images
    );
  }

  Widget _buildLeftItemBottomSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset("assets/svg/chat.svg"),
            SizedBox(width: (Sizing.kWSpacing4).w),
            Text(
              "2",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: CustomTypography.kGreyColor100,
                  fontFamily: "inter",
                  fontSize: 14.0.sp),
            )
          ],
        ),
        SizedBox(width: (Sizing.kWSpacing10).w),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset("assets/svg/paperplus.svg"),
            SizedBox(width: (Sizing.kWSpacing4).w),
            Text(
              "5",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: CustomTypography.kGreyColor100,
                  fontFamily: "inter",
                  fontSize: 14.0.sp),
            )
          ],
        ),
        SizedBox(width: (Sizing.kWSpacing10).w),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset("assets/svg/timecircle.svg"),
            SizedBox(width: (Sizing.kWSpacing4).w),
            Text(
              "7 days",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: CustomTypography.kGreyColor100,
                  fontFamily: "inter",
                  fontSize: 14.0.sp),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildBottomSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_buildImageListSection(), _buildLeftItemBottomSection()],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          context.router.push(const TaskDetailRoute());
        });
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
        decoration: BoxDecoration(
            color: CustomTypography.kWhiteColor,
            borderRadius: BorderRadius.all(Radius.circular(16.r)),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF5D6976).withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 10.r,
                offset: const Offset(0, 15),
              )
            ]),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(12.w, 4.h, 12.w, 4.h),
                    width: 60.w,
                    decoration: BoxDecoration(
                      color: const Color(0xff5ccecf),
                      borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    ),
                    child: Text(
                      'High',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: CustomTypography.kGreyColor100,
                              fontFamily: "inter",
                              fontSize: 12.0.sp),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: null,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.60.w,
                    child: Text(
                      "Navigation issue in the Milestone",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: CustomTypography.kGreyColor100,
                              fontFamily: "inter",
                              fontSize: 18.0.sp),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    "Progess",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: CustomTypography.kGreyColor60,
                        fontFamily: "inter",
                        fontSize: 12.0.sp),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const ContainerWithProgressBar(),
                      Text(
                        "60%",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: CustomTypography.kGreyColor100,
                                fontFamily: "inter",
                                fontSize: 13.0.sp),
                      )
                    ],
                  ),
                  SizedBox(height: (Sizing.kSizingMultiple * 2.5).h),
                  _buildBottomSection()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskListItem1 extends StatefulWidget {
  const TaskListItem1({
    super.key,
  });

  @override
  State<TaskListItem1> createState() => _TaskListItem1State();
}

class _TaskListItem1State extends State<TaskListItem1> {
  final List<Widget> _imagesh = [
    const ProfileAvatar(
      imageUrl: "assets/images/whiteman.jpg",
      radius: 20,
    ),
    const ProfileAvatar(
      imageUrl: "assets/images/whiteman.jpg",
      radius: 20,
    ),
    const ProfileAvatar(
      imageUrl: "assets/images/whiteman.jpg",
      radius: 20,
    ),
    const ProfileAvatar(
      imageUrl: "assets/images/whiteman.jpg",
      radius: 20,
    ),
  ];
  Widget _buildImageListSection() {
    return FlutterImageStack.widgets(
      showTotalCount: true,
      totalCount: 2,
      itemRadius: 30, // Radius of each images
      itemCount: 2, // Maximum number of images to be shown in stack
      itemBorderWidth: 0,
      backgroundColor: Colors.black,
      extraCountTextStyle: const TextStyle(color: Colors.white),
      children: _imagesh, // Border width around the images
    );
  }

  Widget _buildLeftItemBottomSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(width: (Sizing.kWSpacing10).w),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset("assets/svg/paperplus.svg"),
            SizedBox(width: (Sizing.kWSpacing4).w),
            Text(
              "5",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: CustomTypography.kGreyColor100,
                  fontFamily: "inter",
                  fontSize: 14.0.sp),
            )
          ],
        ),
        SizedBox(width: (Sizing.kWSpacing10).w),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset("assets/svg/timecircle.svg"),
            SizedBox(width: (Sizing.kWSpacing4).w),
            Text(
              "7 days",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: CustomTypography.kGreyColor100,
                  fontFamily: "inter",
                  fontSize: 14.0.sp),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildBottomSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_buildImageListSection(), _buildLeftItemBottomSection()],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          context.router.push(const TaskDetailRoute());
        });
      },
      child: Container(
        // width: MediaQuery.sizeOf(context).width * 0.80.w,
        // height: MediaQuery.sizeOf(context).height * 0.20.h,
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
        decoration: BoxDecoration(
            color: CustomTypography.kWhiteColor,
            borderRadius: BorderRadius.all(Radius.circular(16.r)),
               boxShadow: [
              BoxShadow(
                color: const Color(0xFF5D6976).withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 10.r,
                offset: const Offset(0, 15),
              )
            ]),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(12.w, 4.h, 12.w, 4.h),
                    width: 60.w,
                    decoration: BoxDecoration(
                      color: const Color(0xff5ccecf),
                      borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    ),
                    child: Text(
                      'High',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: CustomTypography.kGreyColor100,
                              fontFamily: "inter",
                              fontSize: 12.0.sp),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: null,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.60.w,
                    child: Text(
                      "Navigation issue in the Milestone",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: CustomTypography.kGreyColor100,
                              fontFamily: "inter",
                              fontSize: 18.0.sp),
                    ),
                  ),
                  SizedBox(height: (Sizing.kSizingMultiple * 2).h),
                  _buildBottomSection(),
                  SizedBox(height: (Sizing.kSizingMultiple * 1.2).h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
