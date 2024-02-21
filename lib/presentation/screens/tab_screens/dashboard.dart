import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/route/app_router.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/core/util/width_constraints.dart';
import 'package:japaapp/presentation/shared/profile_avatar.dart';
import 'package:japaapp/presentation/shared/progress_bar.dart';
import 'package:japaapp/presentation/widget/stagger_tile.dart';



class DashboardTab extends StatefulWidget {
  const DashboardTab({super.key});

  @override
  State<DashboardTab> createState() => _DashboardTabState();
}

class _DashboardTabState extends State<DashboardTab> {
  final PageController _pageController =
      PageController(viewportFraction: 0.89, initialPage: 0);
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildSalutationSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Adebowale',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: CustomTypography.kGreyColor100,
                  fontFamily: "inter",
                  fontStyle: FontStyle.normal,
                  fontSize: 20.0.sp),
            ),
            SizedBox(height: (Sizing.kHSpacing4 * 0.1).h),
            Text(
              'Welcome back',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: CustomTypography.kGreyColor60,
                  fontFamily: "inter",
                  fontSize: 14.0.sp),
            ),
          ],
        ),
        _buildNotificationIcon()
      ],
    );
  }

  Widget _buildNotificationIcon() {
    return InkWell(
      onTap: null,
      child: SvgPicture.asset("assets/svg/notification.svg"),
    );
  }

  Widget _buildSalutationAndProfileAvatarRowSection() {
    return WidthConstraint(context).withHorizontalSymmetricalPadding(
      child: Row(
        children: [
          Hero(
            tag: 'profile_avatar',
            child: ProfileAvatar(
              onTap: () {
                HapticFeedback.vibrate();

                //context.router.push(const UserAccountScreenRoute());
              },
              imageUrl: 'assets/images/whiteman.jpg',
            ),
          ),
          SizedBox(width: (Sizing.kWSpacing12).w),
          Expanded(child: _buildSalutationSection()),
        ],
      ),
    );
  }

  Widget _buildTaskTextSection() {
    return WidthConstraint(context).withHorizontalSymmetricalPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Task",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: CustomTypography.kGreyColor100,
                fontFamily: "inter",
                fontSize: 18.0.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskSection() {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Container(
              height: 220.h,
              width: MediaQuery.sizeOf(context).width,
              child: PageView.builder(
                padEnds: false,
                dragStartBehavior: DragStartBehavior.start,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 4,
                controller: _pageController,
                itemBuilder: (context, index) {
                  return const TaskListItem();
                },
                onPageChanged: (int index) {
                  setState(() {
                    _currentPageNotifier.value = index;
                  });
                },
              ),
            ),
          ),
          SizedBox(height: (Sizing.kSizingMultiple * 2.5).h),
          Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 4; i++)
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    width: i == _currentPageNotifier.value
                        ? 20.0
                        : 10.0, // Adjust the width of the selected dot
                    height: 10.0,
                    decoration: BoxDecoration(
                        color: i == _currentPageNotifier.value
                            ? CustomTypography.kSecondaryColor
                            : Colors.grey,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16))),
                  ),
                ),
            ],
          )),
        ],
      ),
    );
  }

  Widget _buildStaggarSection() {
    return WidthConstraint(context).withHorizontalSymmetricalPadding(
      child: MasonryGridView.builder(
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          padding: EdgeInsets.zero,
          crossAxisSpacing: 20,
          mainAxisSpacing: 16,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) {
            return StaggerTile(
                image: index == 1
                    ? "assets/svg/loading.svg"
                    : index == 2
                        ? "assets/svg/ticksquare.svg"
                        : index == 3
                            ? "assets/svg/user.svg"
                            : index == 4
                                ? "assets/svg/xsign.svg"
                                : "assets/svg/xsign.svg",
                name: index == 1
                    ? "In Progress"
                    : index == 2
                        ? "Completed"
                        : index == 3
                            ? "Team"
                            : index == 4
                                ? "Completed"
                                : "Pending",
                height: index == 1
                    ? 140.h
                    : index == 2
                        ? 140.h
                        : index == 3
                            ? 160.h
                            : index == 4
                                ? 160.h
                                : 160.h);
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: (Sizing.kSizingMultiple * 2).h),
              _buildSalutationAndProfileAvatarRowSection(),
              SizedBox(height: (Sizing.kSizingMultiple * 2).h),
              _buildTaskTextSection(),
              SizedBox(height: (Sizing.kSizingMultiple * 2).h),
              _buildTaskSection(),
              SizedBox(height: (Sizing.kSizingMultiple).h),
              _buildStaggarSection()
              // _buildFeaturesSection(),
            ],
          ),
        ),
      ),
    );
  }
}

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
          context.router.push(const TaskRoute());
        });
      },
      child: Container(
  
        margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
        decoration: BoxDecoration(
            color: CustomTypography.kPrimaryColor,
            borderRadius: BorderRadius.all(Radius.circular(16.r)),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF5D6976).withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 60.r,
                offset: const Offset(0, 12),
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
                        color: CustomTypography.kWhiteColor,
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
