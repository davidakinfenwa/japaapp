import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/core/util/width_constraints.dart';
import 'package:japaapp/presentation/widget/form_field.dart';

class ThriveScreen extends StatefulWidget {
  const ThriveScreen({super.key});

  @override
  State<ThriveScreen> createState() => _ThriveScreenState();
}

class _ThriveScreenState extends State<ThriveScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController _searchTextFieldController = TextEditingController();
  late TabController _tabController;

  @override
  void initState() {
    setState(() {
      _tabController = TabController(length: 4, vsync: this);
      _tabController.addListener(_handleTabChange);
      _searchTextFieldController = TextEditingController();
    });

    super.initState();
  }

  void _handleTabChange() {
    setState(() {
      // This will rebuild the UI when the tab index changes
    });
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    _searchTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          body: SafeArea(
              child: WidthConstraint(context).withHorizontalSymmetricalPadding(
                  child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: (Sizing.kSizingMultiple * 2).h),
          _buildTabHeaderSection(),
          SizedBox(height: (Sizing.kSizingMultiple * 2).h),
          _tabController.index == 2
              ? _buildExploreSection()
              : const SizedBox.shrink(),
          SizedBox(
              height:
                  _tabController.index == 2 ? (Sizing.kSizingMultiple).h : 0),

          _buildSearchField(),
          // SizedBox(height: _tabController.index==2? (Sizing.kSizingMultiple).h :0),

          // _tabController.index==2? _buildPopularPlaceSection():const SizedBox.shrink(),
          SizedBox(height: (Sizing.kSizingMultiple * 2).h),
          Expanded(child: _buildTabView())
        ],
      )))),
    );
  }

  Widget _buildSearchField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: Sizing.kSizingMultiple,
        ),
        FormFieldSearch(
          prefixIcon: SvgPicture.asset(
            'assets/svg/searchicon.svg',
            color: Color(0xff808080),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 1.0),
          controller: _searchTextFieldController,
          hint: 'Search',
          textInputType: TextInputType.visiblePassword,
          validate: (value) {
            return _searchTextFieldController.text.isEmpty
                ? 'password is required!'
                : null;
          },
        )
      ],
    );
  }

  Widget _buildTabHeaderSection() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      decoration: BoxDecoration(
        color: CustomTypography.kGreyColor20,
        borderRadius: BorderRadius.circular(Sizing.kBorderRadius.r),
      ),
      child: SizedBox(
        height: Sizing.kHSpacing35.h,
        width: MediaQuery.sizeOf(context).width,
        child: TabBar(
          isScrollable: true,
          controller: _tabController,
          tabAlignment: TabAlignment.start,
          dividerHeight: 0,
          labelColor: Colors.white,
          indicatorColor: CustomTypography.kPrimaryColor300,
          indicatorSize: TabBarIndicatorSize.tab,
          labelPadding: EdgeInsets.zero,
          padding: const EdgeInsets.symmetric(
              vertical: 3, horizontal: 4), // Adjust horizontal padding
          labelStyle: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
          unselectedLabelColor: CustomTypography.kTitleMedium,
          unselectedLabelStyle: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400),
          indicatorPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          indicator: BoxDecoration(
            color: CustomTypography.kPrimaryColor300,
            borderRadius: BorderRadius.circular(Sizing.kBorderRadius.r),
          ),
          tabs: ['Communities', 'Job feed', 'Housing', 'Mentorship']
              .map((e) => Container(
                    width: MediaQuery.sizeOf(context).width / 3 -
                        6, // Adjust width of the tab
                    child: Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(e),
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildTabView() {
    final List<Map<String, dynamic>> items = [
      {
        "image": "assets/images/com12.png",
        "count": "45 members",
        "title": 'Nigerians Living in the UK'
      },
      {
        "image": "assets/images/com13.png",
        "count": "20 members",
        "title": 'Global Africa Community'
      },
      {
        "image": "assets/images/com14.png",
        "count": "10 members",
        "title": 'Personal Savings'
      },
      {
        "image": "assets/images/com12.png",
        "count": "45 members",
        "title": 'Nigerians Living in the UK'
      },
      {
        "image": "assets/images/com14.png",
        "count": "20 members",
        "title": 'Global Africa Community'
      },
      {
        "image": "assets/images/com13.png",
        "count": "10 members",
        "title": 'Personal Savings'
      },
    ];
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.7.h,
        child: TabBarView(controller: _tabController, children: [
          GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.6,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final data = items[index];
                return _buildCommunityList(
                    data['title'], data['image'], data['count']);
              }),
          _buildJobListSection(),
          _buildHouseSection(),
          _buildMentorshipBox(),
          // GridView.builder(
          //     shrinkWrap: true,
          //     physics: const BouncingScrollPhysics(),
          //     padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2,
          //       crossAxisSpacing: 10,
          //       mainAxisSpacing: 10,
          //       childAspectRatio: 1,
          //     ),
          //     itemCount: items.length,
          //     itemBuilder: (context, index) {
          //       final data = items[index];
          //       return _buildCommunityList(
          //           data['title'], data['image'], data['count']);
          //     }),
        ]),
      ),
    );
  }

  Widget _buildCommunityList(String title, String img, String count) {
    return Container(
      width: MediaQuery.sizeOf(context).width.w,
      padding: EdgeInsets.only(left: 0.w, bottom: 10),
      decoration: BoxDecoration(
          border: Border.all(color: CustomTypography.kGreyColor40),
          borderRadius: BorderRadius.circular(Sizing.kSizingMultiple)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Sizing.kSizingMultiple.r),
                      topRight: Radius.circular(Sizing.kSizingMultiple.r)),
                  child: Image.asset(
                    img,
                    height: MediaQuery.sizeOf(context).height,
                    width: MediaQuery.sizeOf(context).width,
                    fit: BoxFit.cover,
                  ))),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Expanded(
                //   child: Container(
                //     width: 150,
                //     height: 250,
                //     decoration: ShapeDecoration(
                //       image: DecorationImage(
                //         image: AssetImage(img),
                //         fit: BoxFit.cover,
                //       ),
                //       shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(8)),
                //     ),
                //   ),
                // ),

                // SizedBox(
                //   //width: 100,
                //   child: Text(
                //     title,
                //     style: Theme.of(context).textTheme.titleMedium?.copyWith(
                //           color: const Color(0xFF344054),
                //           fontWeight: FontWeight.w500,
                //          // height: 1.2.h,
                //         ),
                //     overflow: TextOverflow.ellipsis,
                //   ),
                // ),

                LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: 50,
                      child: Text(
                        constraints.maxHeight > 50 ? "$title..." : title,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: const Color(0xFF344054),
                                  fontWeight: FontWeight.w700,
                                  //fontSize: 13
                                ),
                        maxLines: constraints.maxHeight > 50 ? null : 1,
                        //overflow: TextOverflow.ellipsis,
                      ),
                    );
                  },
                ),
                // SizedBox(
                //   height: Sizing.kSizingMultiple.h,
                // ),
                Text(
                  count,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: const Color(0xFF344054),
                        fontWeight: FontWeight.w400,
                        //height: 0.9,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJobListSection() {
    final List<Map<String, dynamic>> items = [
      {
        "image": "assets/images/dell.png",
        "job_title": "Senior IT Support Engineer",
        "company": 'Dell',
        'location': "Portland, Illinois",
        'dateCreated': "1 wek ago"
      },
      {
        "image": "assets/images/microsoft.png",
        "job_title": "Senior IT Support Engineer",
        "company": 'Dell',
        'location': "Portland, Illinois",
        'dateCreated': "1 wek ago"
      },
      {
        "image": "assets/images/dell.png",
        "job_title": "Senior IT Support Engineer",
        "company": 'Dell',
        'location': "Portland, Illinois",
        'dateCreated': "1 wek ago"
      },
      {
        "image": "assets/images/microsoft.png",
        "job_title": "Senior IT Support Engineer",
        "company": 'Dell',
        'location': "Portland, Illinois",
        'dateCreated': "1 wek ago"
      },
      {
        "image": "assets/images/dell.png",
        "job_title": "Senior IT Support Engineer",
        "company": 'Dell',
        'location': "Portland, Illinois",
        'dateCreated': "1 wek ago"
      },
      {
        "image": "assets/images/microsoft.png",
        "job_title": "Senior IT Support Engineer",
        "company": 'Dell',
        'location': "Portland, Illinois",
        'dateCreated': "1 wek ago"
      },
      {
        "image": "assets/images/dell.png",
        "job_title": "Senior IT Support Engineer",
        "company": 'Dell',
        'location': "Portland, Illinois",
        'dateCreated': "1 wek ago"
      },
      {
        "image": "assets/images/microsoft.png",
        "job_title": "Senior IT Support Engineer",
        "company": 'Dell',
        'location': "Portland, Illinois",
        'dateCreated': "1 wek ago"
      },
      {
        "image": "assets/images/dell.png",
        "job_title": "Senior IT Support Engineer",
        "company": 'Dell',
        'location': "Portland, Illinois",
        'dateCreated': "1 wek ago"
      },
      {
        "image": "assets/images/microsoft.png",
        "job_title": "Senior IT Support Engineer",
        "company": 'Dell',
        'location': "Portland, Illinois",
        'dateCreated': "1 wek ago"
      },
      {
        "image": "assets/images/dell.png",
        "job_title": "Senior IT Support Engineer",
        "company": 'Dell',
        'location': "Portland, Illinois",
        'dateCreated': "1 wek ago"
      },
      {
        "image": "assets/images/microsoft.png",
        "job_title": "Senior IT Support Engineer",
        "company": 'Dell',
        'location': "Portland, Illinois",
        'dateCreated': "1 wek ago"
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
                  "Saved",
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
                      //bottomNavCProvider.pageIndex = 2;
                      // context.router.push( MyProcessTabRoute(nav: "newMigrant"));
                      // context.router.push(route)
                    },
                    child: SvgPicture.asset(
                      'assets/svg/menuicon.svg',
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: Sizing.kHSpacing10,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final data = items[index];
                  return Column(
                    children: [
                      _buildJobDetailSection(
                          img: data["image"],
                          title: data["job_title"],
                          company: data['company'],
                          location: data['location'],
                          time: data['dateCreated']),
                      Divider(
                        color: CustomTypography.kGreyColor20,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          SizedBox(height: (Sizing.kSizingMultiple * 2.5).h),
        ],
      ),
    );
  }

  Widget _buildJobDetailSection(
      {required String img,
      required String title,
      required String company,
      required String location,
      required String time}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  img,
                  width: 50,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              width: Sizing.kWSpacing12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: const Color(0xFF0D0D0D),
                        //height: 0.9,
                      ),
                ),
                Text(
                  company,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: CustomTypography.kTitleMedium,
                      fontWeight: FontWeight.w500
                      //height: 0.9,
                      ),
                ),
                Text(
                  location,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: CustomTypography.kTitleMedium,
                      fontWeight: FontWeight.w500
                      //height: 0.9,
                      ),
                ),
                Text(
                  time,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: CustomTypography.kTitleMedium,
                        //height: 0.9,
                      ),
                ),
              ],
            ),
          ],
        ),
        Expanded(
            child: SvgPicture.asset(
          'assets/svg/saved.svg',
        )),
      ],
    );
  }

  Widget _buildExploreSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Explore",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(),
        ),
      ],
    );
  }

  Widget _buildHouseSection() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildPopularPlaceListSection(),
          _buildListingNearYouSection()
        ],
      ),
    );
  }

  Widget _buildPopularPlaceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Popular Places",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(),
        ),
      ],
    );
  }

  Widget _buildPopularPlaceListSection() {
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
                _buildPopularPlaceSection(),
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
              height: MediaQuery.sizeOf(context).height * 0.08.h,
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
                    // width: MediaQuery.sizeOf(context).width * 0.6,
                    margin: EdgeInsets.only(right: Sizing.kSizingMultiple.w),
                    padding: EdgeInsets.fromLTRB(
                        Sizing.kSizingMultiple.w,
                        Sizing.kSizingMultiple.h,
                        Sizing.kWSpacing35.w,
                        Sizing.kSizingMultiple.h),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F8F8),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            width: 60.w,
                            height: 42.h,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/house1.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Sizing.kSizingMultiple.w,
                        ),
// ---
                        Padding(
                          padding: EdgeInsets.only(
                              top: Sizing.kSizingMultiple / 2.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Ikeja, Lagos',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      //color: Color(0xFF607683),
                                      color: CustomTypography.kBlackColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              Text(
                                '43 properties',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      //color: Color(0xFF607683),
                                      //color: CustomTypography.kBlackColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
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

  Widget _buildListingNearYouTitleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Listing near you",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(),
        ),
      ],
    );
  }

  Widget _buildListingNearYouSection() {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildListingNearYouTitleSection(),
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
        ListView.builder(
          // padEnds: false,
          itemCount: items.length,
          padding: EdgeInsets.fromLTRB(0, 0, 0.w, 10.h),
          shrinkWrap: true,
          dragStartBehavior: DragStartBehavior.start,
          physics: const BouncingScrollPhysics(),

          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: Sizing.kSizingMultiple),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width.w,
                      height: MediaQuery.sizeOf(context).height * 0.3.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/housebig.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: Sizing.kSizingMultiple,
                      right: Sizing.kSizingMultiple,
                      left: Sizing.kSizingMultiple,
                      child: Opacity(
                        opacity: 0.80,
                        child: Container(
                          padding: EdgeInsets.all(Sizing.kSizingMultiple.h),
                          decoration: ShapeDecoration(
                            color: CustomTypography.kBottomNavColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Paul Pastur 86.',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.w700,
                                        )
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              "assets/svg/bed.svg"),
                                               SizedBox(
                                        width: Sizing.kSizingMultiple.h,
                                      ),
                                          Text(
                                            '3',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall
                                                ?.copyWith(
                                                  color: CustomTypography
                                                      .kTitleMedium,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: Sizing.kSizingMultiple*2.h,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              "assets/svg/bath.svg"),
                                               SizedBox(
                                        width: Sizing.kSizingMultiple.h,
                                      ),
                                          Text(
                                            '3',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall
                                                ?.copyWith(
                                                  color: CustomTypography
                                                      .kTitleMedium,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: Sizing.kSizingMultiple*2.h,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                              "assets/svg/size.svg"),
                                               SizedBox(
                                        width: Sizing.kSizingMultiple.h,
                                      ),
                                          Text(
                                            '334 sqft',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall
                                                ?.copyWith(
                                                  color: CustomTypography
                                                      .kTitleMedium,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\$342',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w700,
                                          ),
                                    ),
                                     SizedBox(
                                        height: Sizing.kSizingMultiple/2.h,
                                      ),
                                    Text(
                                      'Monthly',
                                      style:  Theme.of(context)
                                                .textTheme
                                                .titleSmall
                                                ?.copyWith(
                                                  color: CustomTypography
                                                      .kTitleMedium,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            );
          },
        ),
      ],
    );
  }

Widget _buildMentorshipBox(){
  return SingleChildScrollView(
    physics:const BouncingScrollPhysics(),
    child: Column(children: [
      _buildMentorshipSection("I have interview coming up"),
     // SizedBox(height: Sizing.kHSpacing10,),
      _buildMentorshipSection("I want to grow my career"),
     // SizedBox(height: Sizing.kHSpacing10,),
      _buildMentorshipSection("I need legal advice"),
    ],),
  );
}

   Widget _buildMentorshipSection(String title) {
    
    final List<Map<String, dynamic>> items = [
      {
        "image": "assets/images/com12.png",
        "count": "Data Engineer - Apple",
        "title": 'Name Surname'
      },
      {
        "image": "assets/images/com13.png",
        "count": "Data Engineer - Apple",
        "title": 'Name Surname'
      },
      {
        "image": "assets/images/com14.png",
        "count": "Data Engineer - Apple",
        "title": 'Name Surname'
      },
      {
        "image": "assets/images/com12.png",
        "count": "Data Engineer - Apple",
        "title": 'Name Surname'
      },
      {
        "image": "assets/images/com14.png",
        "count": "Data Engineer - Apple",
        "title": 'Name Surname'
      },
      {
        "image": "assets/images/com13.png",
        "count": "Data Engineer - Apple",
       "title": 'Name Surname'
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
                  title,
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
                       // bottomNavCProvider.pageIndex = 2;
                        // context.router.push( MyProcessTabRoute(nav: "newMigrant"));
                        // context.router.push(route)
                      },
                      child: Text(
                        "See More",
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
            height: 120.h,
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
                return _buildMentorshipList(
                    data['title'], data['image'], data['count']);
              },
            ),
          ),
          SizedBox(height: (Sizing.kSizingMultiple * 2.5).h),
        ],
      ),
    );
  }

  Widget _buildMentorshipList(String title, String img, String count) {
    return Container(
      //width: 120,
      padding: EdgeInsets.only(left: 0.w),
      //color: Colors.red,
      margin: EdgeInsets.only(right: Sizing.kSizingMultiple.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 100,
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
                //height: 50,
                child: Text(
                   title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: const Color(0xFF344054),
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp
                      ),
                  maxLines: constraints.maxHeight > 50 ? null : 1,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            },
          ),
          // SizedBox(
          //   height: Sizing.kSizingMultiple.h,
          // ),
          Text(
            count,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontSize: 9.sp,
              fontWeight: FontWeight.w400
                 // color: const Color(0xFF344054),
                  //height: 0.9,
                ),
          ),
        ],
      ),
    );
  }

}
