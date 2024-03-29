import 'package:flutter/material.dart';
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
      _tabController = TabController(length: 3, vsync: this);
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
      length: 3,
      child: Scaffold(
          body: SafeArea(
              child: WidthConstraint(context).withHorizontalSymmetricalPadding(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: (Sizing.kSizingMultiple * 2).h),
          _buildTabHeaderSection(),
          SizedBox(height: (Sizing.kSizingMultiple * 2).h),
          _tabController.index==2? _buildExploreSection():const SizedBox.shrink(),
          SizedBox(height: _tabController.index==2? (Sizing.kSizingMultiple).h :0),

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
//margin: EdgeInsets.all(10.h),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: CustomTypography.kGreyColor20,
          borderRadius: BorderRadius.circular(Sizing.kBorderRadius.r)),
      child: SizedBox(
        height: Sizing.kHSpacing35.h,
        width: MediaQuery.sizeOf(context).width,
        child: TabBar(
            controller: _tabController,
            tabAlignment: TabAlignment.fill,
            dividerHeight: 0,
            labelColor: Colors.white,
            indicatorColor: CustomTypography.kPrimaryColor300,
            indicatorSize: TabBarIndicatorSize.tab,
            labelPadding: EdgeInsets.zero,
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
            labelStyle: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontSize: 13.sp, fontWeight: FontWeight.w400),
            unselectedLabelColor: CustomTypography.kTitleMedium,
            unselectedLabelStyle: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontSize: 13.sp, fontWeight: FontWeight.w400),
            indicatorPadding: EdgeInsets.zero,
            indicator: BoxDecoration(
                color: CustomTypography.kPrimaryColor300,
                borderRadius: BorderRadius.circular(Sizing.kBorderRadius.r)),
            tabs: ['Communities', 'Job feed', 'House']
                .map((e) => Container(
                      //color: Colors.red,
                      width: MediaQuery.sizeOf(context).width,
                      child: Tab(
                        //height: 30.h,
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          //color: Colors.red,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 5),

                          child: Center(
                              child: Text(
                            e,
                            // style: TextStyle(fontSize: 12.sp),
                          )),
                        ),
                      ),
                    ))
                .toList()),
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
                childAspectRatio: 1,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final data = items[index];
                return _buildCommunityList(
                    data['title'], data['image'], data['count']);
              }),
          _buildJobListSection(),
        _buildHouseSection()
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
      padding: EdgeInsets.only(left: 0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            //width: 90,
            height: 100,
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
            width: 100,
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: const Color(0xFF344054),
                    fontWeight: FontWeight.w500,
                    height: 1.2.h,
                  ),
              overflow: TextOverflow.ellipsis,
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
                  width:50,
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


  Widget _buildExploreSection(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Explore",style: Theme.of(context).textTheme.titleMedium!.copyWith(),),
      ],
    );
  }

  Widget _buildHouseSection(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      _buildPopularPlaceSection()
    ],);
  }

    Widget _buildPopularPlaceSection(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Popular Places",style: Theme.of(context).textTheme.titleMedium!.copyWith(),),
      ],
    );
  }

  



}
