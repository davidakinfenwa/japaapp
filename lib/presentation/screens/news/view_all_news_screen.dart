import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:japaapp/business/blocs/bloc_state.dart';
import 'package:japaapp/business/blocs/journey/intending_migrant_form_cubit.dart';
import 'package:japaapp/business/blocs/journey/task_action_form_cubit.dart';
import 'package:japaapp/business/snapshot/tabscreen_provider.dart';
import 'package:japaapp/business/snapshot_cache/journey_snapshot_cache.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/dependence/dependence.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/core/route/app_router.dart';

import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/core/util/width_constraints.dart';

import 'package:japaapp/presentation/widget/custom_app_bar.dart';
import 'package:provider/provider.dart';

@RoutePage()
class NewsUpdateScreen extends StatefulWidget implements AutoRouteWrapper {
  const NewsUpdateScreen({
    super.key,
  });

  @override
  State<NewsUpdateScreen> createState() => _NewsUpdateScreenState();
  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<IntendingMigrantCubit>(
            create: (context) =>
                getIt<IntendingMigrantCubit>()..intendingMigrant()),
       
      ],
      child: this,
    );
  }
}

class _NewsUpdateScreenState extends State<NewsUpdateScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var bottomNavCProvider = Provider.of<TabScreenNotifier>(context);
    return WillPopScope(
      onWillPop: () async {
        BotToast.cleanAll();
        bottomNavCProvider.pageIndex = 0;
        context.router.replaceAll([const TabRoute()]);
        return true;
      },
      child: Scaffold(
          // backgroundColor: Colors.white,
          body: _buildProcessforSectionForIntendingOrNewMigrant()),
    );
  }

  Widget _buildProcessforSectionForIntendingOrNewMigrant() {
    return Stack(
      children: [
       // _buildBackground(),
        WidthConstraint(context).withHorizontalSymmetricalPadding(
          child: Column(
            children: [
              SizedBox(height: (Sizing.kSizingMultiple * 4).h),
              Stack(
                children: [
                  _buildSalutationSection(),
                ],
              ),
              Expanded(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _searchSection(),
                          SizedBox(height: (Sizing.kSizingMultiple*2).h),
                          _buildNewsListSection(),
                          SizedBox(height: (Sizing.kSizingMultiple*2).h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBackground() {
    return Opacity(
      opacity: 0.4, // Set opacity value (0.0 to 1.0)
      child:
          //  SvgPicture.asset("assets/svg/chat.svg"),
          Image.asset(
        'assets/images/neew.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildSalutationSection() {
    var bottomNavCProvider = Provider.of<TabScreenNotifier>(context);
    return CustomApbar(
      title: 'News update',
      onTapExit: () {
        BotToast.cleanAll();
        bottomNavCProvider.pageIndex = 0;
        context.router.replaceAll([const TabRoute()]);
      },
    );
  }

    Widget _searchSection() {
    return SizedBox(
      height: 50.sp,
      child: TextFormField(
        // focusNode: _searchTextFieldFocusNode,
        // controller: _searchTextFieldController,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
            fontWeight: FontWeight.w500,
            color: const Color(0xffE8EDEF),
            fontSize: 13.0.sp),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          hintText: 'Search',
          hintStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: const Color(0xffC0C0C0),
              fontSize: 18.0.sp),
          fillColor: Colors.grey[200],
          filled: true,
          isDense: true,
          prefixIcon: Transform.scale(
              scale: .4, child: SvgPicture.asset("assets/svg/search.svg")),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) {
          // snapshotCache.searchProductFromList(value);
        },
      ),
    );
  }

  Widget _buildNewsListSection(){
      final List<Map<String, dynamic>> items = [
      {
        "image": "assets/images/com12.png",
        "count": "2h ago · by Isabella Kwai",
        "title": 'UK net migration in 2022 revised upwards to 745,000'
      },
      // {"image": "assets/svgs/squarepassword.svg", "title": 'Locked Savings'},
      {
        "image": "assets/images/com13.png",
        "count": "2h ago · by Isabella Kwai",
        "title": 'Immigration is rocketing. Thats brilliant news for Britain.'
      },
      {
        "image": "assets/images/com14.png",
        "count": "2h ago · by Isabella Kwai",
        "title":
            'Immigration Series: All about how to get naturalised in Germany'
      },
      {
        "image": "assets/images/com12.png",
        "count": "2h ago · by Isabella Kwai",
        "title":
            'Immigration Series: All about how to get naturalised in Germany'
      },
    ];
    return   ListView.builder(
      // padEnds: false,
      padding: EdgeInsets.fromLTRB(0, 0, 0.w, 0),
      shrinkWrap: true,
      //dragStartBehavior: DragStartBehavior.start,
      //scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
    
      itemBuilder: (context, index) {
        final data = items[index];
        return InkWell(
          onTap: (){
            context.router.replace(const DetailNewsRoute());
          },
          child: _buildNewsList(
              data['title'], data['image'], data['count']),
        );
      },
    );
  }


   Widget _buildNewsList(String title, String img, String count) {
    return Container(
      width: MediaQuery.sizeOf(context).width.w,
      //color: Colors.red,
      padding: EdgeInsets.only(left: 0.w, bottom: 15.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 90,
            height: 85,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage(img),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
          SizedBox(
            width: Sizing.kSizingMultiple * 2.h,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(
                //   width: MediaQuery.sizeOf(context).width*0.5,
                //   child: Text(
                //     title,
                //     style: Theme.of(context).textTheme.titleMedium?.copyWith(
                //           color: const Color(0xFF344054),
                //           fontWeight: FontWeight.w500,
                //           // height: 1.2.h,
                //         ),
                //   ),
                // ),
                LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return SizedBox(
                     width: MediaQuery.sizeOf(context).width*0.6,
                      height: 50,
                      child: Text(
                        constraints.maxHeight > 50 ? "$title..." : title,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: const Color(0xFF090A0A),
                                 
                                ),
                        maxLines: constraints.maxHeight > 50 ? null : 1,
                        //overflow: TextOverflow.ellipsis,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: Sizing.kSizingMultiple.h,
                ),
                Text(
                  count,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: const Color(0xFF6C7072),
                        fontWeight: FontWeight.w400
                       
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
