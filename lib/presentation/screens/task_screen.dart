import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/core/util/width_constraints.dart';
import 'package:japaapp/presentation/widget/tab_task_page_widget.dart';


@RoutePage()
class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> with TickerProviderStateMixin {
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
          padding: EdgeInsets.fromLTRB(15, 100.h, 0, 0),
          child: TabBar(
              labelPadding: const EdgeInsets.only(
                left: 12.0,
              ),
              indicatorPadding: const EdgeInsets.only(
                left: 12.0,
              ),
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
                        "Pending",
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
                      Container(
                        height: 15.h,
                        width: 15.w,
                        decoration: BoxDecoration(
                            color: selectedStates[0]
                                ? CustomTypography.kGreyColor100
                                : Colors.grey,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16))),
                        child: Center(
                          child: Text(
                            "1",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              color: selectedStates[0]
                                  ? CustomTypography.kWhiteColor
                                  : CustomTypography.kGreyColor20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      Text(
                        "In Progress",
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
                      Container(
                        height: 15.h,
                        width: 15.w,
                        decoration: BoxDecoration(
                            color: selectedStates[1]
                                ? CustomTypography.kGreyColor100
                                : Colors.grey,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16))),
                        child: Center(
                          child: Text(
                            "3",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              color: selectedStates[1]
                                  ? CustomTypography.kWhiteColor
                                  : CustomTypography.kGreyColor20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      Text(
                        "Completed",
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
                      Container(
                        height: 15.h,
                        width: 15.w,
                        decoration: BoxDecoration(
                            color: selectedStates[2]
                                ? CustomTypography.kGreyColor100
                                : Colors.grey,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16))),
                        child: Center(
                          child: Text(
                            "3",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              color: selectedStates[2]
                                  ? CustomTypography.kWhiteColor
                                  : CustomTypography.kGreyColor20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
        ),
        //_buildTransactionList()
      ],
    );
  }

  Widget _buildTaskList() {
    return SliverToBoxAdapter(
      child: WidthConstraint(context).withHorizontalSymmetricalPadding(
        child: Container(
          height: MediaQuery.sizeOf(context).height,
           //padding: const EdgeInsets.only(bottom: 90),
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              TabPages(tabIndex: 0),
              TabPages(tabIndex: 1),
              TabPages(tabIndex: 2),
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
         physics: const NeverScrollableScrollPhysics(),
        // scrollBehavior: const ScrollBehavior(),
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(left: 0),
            sliver: SliverAppBar(
                backgroundColor: CustomTypography.kWhiteColor,
                // stretch: false,
                // floating: true,
                // snap: true,
                elevation: 0,
                // backgroundColor: Colors.red,
                title: Text(
                  "Tasks",
                  style: Theme.of(context)
                      .primaryTextTheme
                      .displayMedium
                      ?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: CustomTypography.kGreyColor100,
                          fontFamily: "inter",
                          fontSize: 18.0.sp),
                ),
                centerTitle: true,
                automaticallyImplyLeading: true,
                iconTheme: Theme.of(context).iconTheme,
                expandedHeight: MediaQuery.sizeOf(context).height * 0.172.h,
                pinned: true,
                floating: true,
                flexibleSpace: _buildTabSection()),
          ),
          _buildTaskList(),
          
        ],
      ),
    );
  }
}
