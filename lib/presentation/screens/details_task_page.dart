import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/core/util/width_constraints.dart';
import 'package:japaapp/presentation/widget/detail_task_tab_controller.dart';


@RoutePage()
class TaskDetailPage extends StatefulWidget {
  const TaskDetailPage({super.key});

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  List<bool> selectedStates = [true, false, false];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        for (int i = 0; i < selectedStates.length; i++) {
          selectedStates[i] = (i == _tabController.index);
        }
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildTabSection() {
    return Column(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width.w,
          padding: EdgeInsets.fromLTRB(0, 0.h, 0, 0),
          child: TabBar(
              labelPadding: const EdgeInsets.only(
                left: 12.0,
              ),
              indicatorPadding: EdgeInsets.only(left: 10.0.w, right: 10.w),
              padding: EdgeInsets.zero,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: selectedStates[0]
                  ? CustomTypography.kGreyColor100
                  : Colors.grey,
              controller: _tabController,
              isScrollable: true,
              labelColor: CustomTypography.kGreyColor100,
              labelStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: selectedStates[0]
                      ? CustomTypography.kGreyColor100
                      : Colors.grey,
                  fontFamily: "inter",
                  fontSize: 16.0.sp),
              unselectedLabelColor: CustomTypography.kGreyColor,
              tabs: [
                Tab(
                  child: Row(
                    children: [
                      Text(
                        "Detail",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: selectedStates[0]
                                    ? CustomTypography.kGreyColor100
                                    : Colors.grey,
                                fontFamily: "inter",
                                fontSize: 16.0.sp),
                      ),
                      SizedBox(width: Sizing.kWSpacing4.w),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      Text(
                        "Comment",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: selectedStates[1]
                                    ? CustomTypography.kGreyColor100
                                    : Colors.grey,
                                fontFamily: "inter",
                                fontSize: 16.0.sp),
                      ),
                      SizedBox(width: Sizing.kWSpacing4.w),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      Text(
                        "Payment",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: selectedStates[2]
                                    ? CustomTypography.kGreyColor100
                                    : Colors.grey,
                                fontFamily: "inter",
                                fontSize: 16.0.sp),
                      ),
                      SizedBox(width: Sizing.kWSpacing4.w),
                    ],
                  ),
                ),
              ]),
        ),
        //_buildTransactionList()
      ],
    );
  }

  Widget _buildTopSection() {
    return SliverToBoxAdapter(
      child: WidthConstraint(context).withHorizontalSymmetricalPadding(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: CustomTypography.kGreyColor100,
                  fontFamily: "inter",
                  fontSize: 12.0.sp),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: (Sizing.kHSpacing12).h),
          Text(
            'UX - Competitive Analysis ',
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: CustomTypography.kGreyColor100,
                fontFamily: "inter",
                fontSize: 20.0.sp),
          ),
          SizedBox(height: (Sizing.kHSpacing12).h),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.w400,
                color: CustomTypography.kGreyColor70,
                fontFamily: "inter",
                fontSize: 14.0.sp),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: (Sizing.kHSpacing12).h),
          _buildTabSection()
        ],
      )),
    );
  }

Widget _buildTabViewSections() {
  return SliverToBoxAdapter(
    child:  WidthConstraint(context).withHorizontalSymmetricalPadding(
        child: Container(
         height: MediaQuery.sizeOf(context).height*0.6.h,
          // padding: const EdgeInsets.only(left: 10),
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            
            controller: _tabController,
            children: [
               DetailTaskTabPages(tabIndex: 0),
               DetailTaskTabPages(tabIndex: 1),
               DetailTaskTabPages(tabIndex: 2),
            ],
          ),
        ),
      ),
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: true,
            iconTheme: Theme.of(context).iconTheme,
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(Icons.bookmarks_sharp),
                  SizedBox(width: (Sizing.kSizingMultiple * 2.5).w),
                  SvgPicture.asset(
                    "assets/svg/edit.svg",
                  ),
                  SizedBox(width: (Sizing.kSizingMultiple * 2.5).w),
                ],
              )
            ],
            actionsIconTheme: Theme.of(context).iconTheme,
          ),
          _buildTopSection(),
          _buildTabViewSections(),
        ],
      ),
    );
  }
}
