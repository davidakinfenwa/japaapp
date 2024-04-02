import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:japaapp/business/snapshot/tabscreen_provider.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/route/app_router.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/core/util/width_constraints.dart';
import 'package:japaapp/presentation/shared/custom_button.dart';
import 'package:provider/provider.dart';

class DashboardTab extends StatefulWidget {
  const DashboardTab({super.key});

  @override
  State<DashboardTab> createState() => _DashboardTabState();
}

class _DashboardTabState extends State<DashboardTab> {
  @override
  void dispose() {
    super.dispose();
  }

  ScrollPhysics _physics = const BouncingScrollPhysics();

  Widget _buildSalutationSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello Debbie',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(),
            ),
            SizedBox(width: (Sizing.kWSpacing4).h),
            SizedBox(height: (Sizing.kHSpacing10).h),
            Image.asset(
              'assets/images/hello.png',
              width: (Sizing.kSizingMultiple * 4).w,
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
    return Row(
      children: [
        // Hero(
        //   tag: 'profile_avatar',
        //   child: ProfileAvatar(
        //     onTap: () {
        //       HapticFeedback.vibrate();

        //       //context.router.push(const UserAccountScreenRoute());
        //     },
        //     imageUrl: 'assets/images/whiteman.jpg',
        //   ),
        // ),

        Expanded(child: _buildSalutationSection()),
      ],
    );
  }

  Widget _buildIntroSection() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.6.w,
              child: Text(
                "Every step is a story, and each new place is a chapter of growth.",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      //color: CustomTypography.kGreyColor100,
                    ),
              ),
            ),
            SizedBox(
              height: Sizing.kSizingMultiple * 2.h,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.5.w,
              child: Text(
                'Your dreams begins here!',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: const Color(0xFF0D0D0D),
                      height: 0.9,
                    ),
              ),
            )
          ],
        ),
        Expanded(
          child: Image.asset(
            'assets/images/newmaap.png',
            width: (Sizing.kWSpacing56 * 1.8).w,
            height: (Sizing.kHSpacing56 * 1.5).h,
          ),
        ),
        // Container(
        //   padding: EdgeInsets.all(10),
        //  // color: Colors.red,
        //   height: 100,
        //   width: 100,
        //   child: SvgPicture.asset("assets/svg/map.svg")),
      ],
    );
  }

  Widget _buildActionButton() {
    return Column(
      children: [
        CustomButton(
          type: ButtonType.regularButton(
              onTap: () {
                context.router.replace(const JourneyLandingRoute());
              },
              label: 'Get Started',
              isLoadingMode: false,
              backgroundColor: CustomTypography.kPrimaryColor200,
              textColor: CustomTypography.kWhiteColor,
              borderRadius: BorderRadius.all(
                  Radius.circular(Sizing.kBorderRadius * 7.r))),
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

  Widget _buildCommunitySection() {
    var bottomNavCProvider = Provider.of<TabScreenNotifier>(context);
    final List<Map<String, dynamic>> items = [
      {
        "image": "assets/images/com12.png",
        "count": "45 People",
        "title": 'Nigerians Living in the UK'
      },
      {
        "image": "assets/images/com13.png",
        "count": "20 People",
        "title": 'Global Africa Community'
      },
      {
        "image": "assets/images/com14.png",
        "count": "10 People",
        "title": 'Personal Savings'
      },
      {
        "image": "assets/images/com12.png",
        "count": "45 People",
        "title": 'Nigerians Living in the UK'
      },
      {
        "image": "assets/images/com14.png",
        "count": "20 People",
        "title": 'Global Africa Community'
      },
      {
        "image": "assets/images/com13.png",
        "count": "10 People",
        "title": 'Personal Savings'
      },
    ];
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {},
                child: Text(
                  "Communities",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: const Color(0xFF0D0D0D),
                        height: 0.9,
                      ),
                ),
              ),
              Row(
                children: [
                  InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                           bottomNavCProvider.pageIndex = 2;
                         // context.router.push( MyProcessTabRoute(nav: "newMigrant"));
                        // context.router.push(route)
                      },
                      child: Text(
                        "Find More",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: const Color(0xFF595959),
                              height: 0.9,
                            ),
                      )),
                  Image.asset(
                    'assets/images/forward_arrow.png',
                    width: (Sizing.kSizingMultiple * 2).w,
                    height: (Sizing.kSizingMultiple * 2).h,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: Sizing.kHSpacing10,
          ),
          Container(
            // color: Colors.red,
            height: 155.h,
            width: MediaQuery.sizeOf(context).width,
            child: ListView.builder(
              // padEnds: false,
              padding: EdgeInsets.fromLTRB(0, 0, 0.w, 0),
              shrinkWrap: true,
              dragStartBehavior: DragStartBehavior.start,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final data = items[index];
                return _buildCommunityList(
                    data['title'], data['image'], data['count']);
              },
            ),
          ),
          SizedBox(height: (Sizing.kSizingMultiple * 2.5).h),
        ],
      ),
    );
  }

  Widget _buildCommunityList(String title, String img, String count) {
    return Container(
      //width: 120,
      padding: EdgeInsets.only(left: 0.w),
      //color: Colors.red,
      margin: EdgeInsets.only(right: Sizing.kSizingMultiple.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage(img),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
        LayoutBuilder(
  builder: (BuildContext context, BoxConstraints constraints) {
    return SizedBox(
      width: 100,
      height: 50,
      child: Text(
       constraints.maxHeight > 50? "$title...":title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: const Color(0xFF344054),
          fontWeight: FontWeight.w500,
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
                  color: const Color(0xFF344054),
                  height: 0.9,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildConsultantSection() {
    final List<Map<String, dynamic>> items = [
      {
        "image": "assets/images/cons/cons1.png",
        "count": "45 People",
        "title": 'Samantha Payne'
      },
      {
        "image": "assets/images/com13.png",
        "count": "20 People",
        "title": 'Samantha Payne'
      },
      {
        "image": "assets/images/com13.png",
        "count": "10 People",
        "title": 'Samantha Payne'
      },
      {
        "image": "assets/images/com13.png",
        "count": "45 People",
        "title": 'Samantha Payne'
      },
      {
        "image": "assets/images/com14.png",
        "count": "20 People",
        "title": 'Samantha Payne'
      },
      {
        "image": "assets/images/com13.png",
        "count": "10 People",
        "title": 'Samantha Payne'
      },
    ];
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Request Consultation",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: const Color(0xFF0D0D0D),
                      height: 0.9,
                    ),
              ),
              Row(
                children: [
                  InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {},
                      child: Text(
                        "Find More",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: const Color(0xFF595959),
                              height: 0.9,
                            ),
                      )),
                  Image.asset(
                    'assets/images/forward_arrow.png',
                    width: (Sizing.kSizingMultiple * 2).w,
                    height: (Sizing.kSizingMultiple * 2).h,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: Sizing.kHSpacing10,
          ),
          Container(
            // color: Colors.red,
            height: 180.h,
            width: MediaQuery.sizeOf(context).width,
            child: ListView.builder(
              // padEnds: false,
              padding: EdgeInsets.fromLTRB(0, 0, 30.w, 0),
              shrinkWrap: true,
              dragStartBehavior: DragStartBehavior.start,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final data = items[index];
                return _buildConsultantList(
                    data['title'], data['image'], data['count']);
              },
            ),
          ),
          SizedBox(height: (Sizing.kSizingMultiple * 2.5).h),
        ],
      ),
    );
  }

  Widget _buildConsultantList(String title, String img, String count) {
    return Container(
      padding: EdgeInsets.only(left: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage(img),
                fit: BoxFit.cover,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
          SizedBox(
            width: 120,
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: const Color(0xFF344054),
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                    height: 1.2.h,
                  ),
            ),
          ),
          SizedBox(
            height: Sizing.kSizingMultiple.h,
          ),
          Row(
            children: List.generate(
              4,
              (index) => SvgPicture.asset("assets/svg/star.svg"),
            ),
          ),
          SizedBox(
            height: Sizing.kSizingMultiple.h,
          ),
          Text.rich(
            TextSpan(
              text: 'Hourly Price:',
              children: [
                TextSpan(
                  text: ' \$100',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: CustomTypography.kBlackColor,
                      fontSize: 12.0.sp),
                  //recognizer: _tapRecognizer,
                ),
              ],
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: CustomTypography.kGreyColorlabel,
                  height: 0.15.h,
                  fontSize: 10.0.sp),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildNewsSection() {
    final List<Map<String, dynamic>> items = [
      {
        "image": "assets/images/com12.png",
        "count": "45 People",
        "title": 'UK net migration in 2022 revised upwards to 745,000'
      },
      // {"image": "assets/svgs/squarepassword.svg", "title": 'Locked Savings'},
      {
        "image": "assets/images/com13.png",
        "count": "20 People",
        "title": 'Immigration is rocketing. Thats brilliant news for Britain.'
      },
      {
        "image": "assets/images/com14.png",
        "count": "10 People",
        "title":
            'Immigration Series: All about how to get naturalised in Germany'
      },
      {
        "image": "assets/images/com12.png",
        "count": "45 People",
        "title":
            'Immigration Series: All about how to get naturalised in Germany'
      },
      // {"image": "assets/svgs/squarepassword.svg", "title": 'Locked Savings'},
      // {
      //   "image": "assets/images/com14.png",
      //   "count": "20 People",
      //   "title":
      //       'Immigration Series: All about how to get naturalised in Germany'
      // },
      // {
      //   "image": "assets/images/com13.png",
      //   "count": "10 People",
      //   "title":
      //       'Immigration Series: All about how to get naturalised in Germany'
      // },
    ];
    return SizedBox(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFFF8F8F8),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {},
                  child: Text(
                    "News Updates",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: const Color(0xFF0D0D0D),
                          height: 0.9,
                        ),
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {},
                        child: Text(
                          "Read More",
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: const Color(0xFF595959),
                                    height: 0.9,
                                  ),
                        )),
                    Image.asset(
                      'assets/images/forward_arrow.png',
                      width: (Sizing.kSizingMultiple * 2).w,
                      height: (Sizing.kSizingMultiple * 2).h,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: Sizing.kHSpacing10,
            ),
            SizedBox(
              height: 220.h,
              width: MediaQuery.sizeOf(context).width,
              child: ListView.builder(
                // padEnds: false,
                padding: EdgeInsets.fromLTRB(0, 0, 0.w, 0),
                shrinkWrap: true,
                dragStartBehavior: DragStartBehavior.start,
                scrollDirection: Axis.vertical,
                physics: _physics,
                itemCount: items.length,

                itemBuilder: (context, index) {
                  final data = items[index];
                  return _buildNewsList(
                      data['title'], data['image'], data['count']);
                },
              ),
            ),
            SizedBox(height: (Sizing.kSizingMultiple * 2.5).h),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsList(String title, String img, String count) {
    return Container(
      width: MediaQuery.sizeOf(context).width.w,
      //color: Colors.red,
      padding: EdgeInsets.only(left: 0.w, bottom: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 90,
            height: 90,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.52,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: const Color(0xFF344054),
                        fontWeight: FontWeight.w500,
                        height: 1.2.h,
                      ),
                ),
              ),
              SizedBox(
                height: Sizing.kSizingMultiple.h,
              ),
              Text(
                count,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: const Color(0xFF344054),
                      height: 0.9,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildToolsSection() {
    final List<Map<String, dynamic>> items = [
      {
        "image": "assets/images/com12.png",
        "count": "45 People",
        "title": 'UK net migration in 2022 revised upwards to 745,000'
      },
      // {"image": "assets/svgs/squarepassword.svg", "title": 'Locked Savings'},
      {
        "image": "assets/images/com13.png",
        "count": "20 People",
        "title": 'Immigration is rocketing. Thats brilliant news for Britain.'
      },
      {
        "image": "assets/images/com14.png",
        "count": "10 People",
        "title":
            'Immigration Series: All about how to get naturalised in Germany'
      },
      {
        "image": "assets/images/com12.png",
        "count": "45 People",
        "title":
            'Immigration Series: All about how to get naturalised in Germany'
      },
      // {"image": "assets/svgs/squarepassword.svg", "title": 'Locked Savings'},
      {
        "image": "assets/images/com14.png",
        "count": "20 People",
        "title":
            'Immigration Series: All about how to get naturalised in Germany'
      },
      {
        "image": "assets/images/com13.png",
        "count": "10 People",
        "title":
            'Immigration Series: All about how to get naturalised in Germany'
      },
    ];
    return SizedBox(
      child: Container(
        //height: 200,
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {},
                  child: Text(
                    "Tools",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: const Color(0xFF0D0D0D),
                          height: 0.9,
                        ),
                  ),
                ),
                // Row(
                //   children: [
                //     InkWell(
                //         splashColor: Colors.transparent,
                //         highlightColor: Colors.transparent,
                //         onTap: () {},
                //         child: Text(
                //           "Read More",
                //           style:
                //               Theme.of(context).textTheme.titleSmall?.copyWith(
                //                     color: Color(0xFF595959),
                //                     height: 0.9,
                //                   ),
                //         )),
                //     Image.asset(
                //       'assets/images/forward_arrow.png',
                //       width: (Sizing.kSizingMultiple * 2).w,
                //       height: (Sizing.kSizingMultiple * 2).h,
                //     ),
                //   ],
                // ),
              ],
            ),
            SizedBox(
              height: Sizing.kHSpacing10,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.13.h,
              width: MediaQuery.sizeOf(context).width.w,
              child: ListView.builder(
                // padEnds: false,
                itemCount: items.length,
              padding: EdgeInsets.fromLTRB(0, 0, 30.w, 0),
              shrinkWrap: true,
              dragStartBehavior: DragStartBehavior.start,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),

                itemBuilder: (context, index) {
                  
                  return Container(
                    width: MediaQuery.sizeOf(context).width * 0.6,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F8F8),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'CRS Calculator',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Color(0xFF344054),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
// ---
                        Text(
                          'Calculate your score with our CRS tool',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: Color(0xFF607683),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: (Sizing.kSizingMultiple * 2.5).h),
          ],
        ),
      ),
    );
  }

  // Widget _buildNewsList(String title, String img, String count) {
  //   return Container(
  //     width: MediaQuery.sizeOf(context).width.w,
  //     //color: Colors.red,
  //     padding: EdgeInsets.only(left: 0.w,bottom: 10.h),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Container(
  //           width: 90,
  //           height: 90,
  //           decoration: ShapeDecoration(
  //             image: DecorationImage(
  //               image: AssetImage(img),
  //               fit: BoxFit.fill,
  //             ),
  //             shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(8)),
  //           ),
  //         ),
  //          SizedBox(
  //           width: Sizing.kSizingMultiple*2.h,
  //         ),
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //              SizedBox(
  //           width: MediaQuery.sizeOf(context).width*0.52,
  //           child: Text(
  //             title,
  //             style: Theme.of(context).textTheme.titleMedium?.copyWith(
  //                   color: const Color(0xFF344054),
  //                   fontWeight: FontWeight.w500,
  //                   height: 1.2.h,
  //                 ),
  //           ),
  //         ),
  //         SizedBox(
  //           height: Sizing.kSizingMultiple.h,
  //         ),
  //         Text(
  //           count,
  //           style: Theme.of(context).textTheme.titleSmall?.copyWith(
  //                 color: const Color(0xFF344054),
  //                 height: 0.9,
  //               ),
  //         ),
  //           ],
  //         ),

  //       ],
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Stack(
        children: [
          _buildBackground(),
          SingleChildScrollView(
            physics: _physics,
            child: SafeArea(
              child: WidthConstraint(context).withHorizontalSymmetricalPadding(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: (Sizing.kSizingMultiple * 1).h),
                    _buildSalutationAndProfileAvatarRowSection(),
                    SizedBox(height: (Sizing.kSizingMultiple).h),
                    _buildIntroSection(),
                    SizedBox(height: (Sizing.kSizingMultiple * 2).h),
                    _buildActionButton(),
                    SizedBox(height: (Sizing.kSizingMultiple * 4).h),
                    _buildCommunitySection(),
                    //SizedBox(height: (Sizing.kSizingMultiple).h),
                    _buildNewsSection(),
                    SizedBox(height: (Sizing.kSizingMultiple * 4).h),

                    _buildToolsSection(),
                    SizedBox(height: (Sizing.kSizingMultiple).h),
                    _buildConsultantSection(),
                    // // _buildFeaturesSection(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
