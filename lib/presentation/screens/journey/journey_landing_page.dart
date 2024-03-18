import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/route/app_router.dart';

import 'package:japaapp/core/util/width_constraints.dart';

import 'package:japaapp/presentation/widget/back_button.dart';

@RoutePage()
class JourneyLandingPage extends StatefulWidget {
  const JourneyLandingPage({super.key});

  @override
  State<JourneyLandingPage> createState() => _JourneyLandingPageState();
}

class _JourneyLandingPageState extends State<JourneyLandingPage> {
 
  int selectedMeansOfPayment = -2;

  @override
  void initState() {
    super.initState();
   
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          Stack(
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: (Sizing.kSizingMultiple * 6).h),
                  WidthConstraint(context).withHorizontalSymmetricalPadding(
                      child: CustomBackButton(
                    onTapExit: () {
                      context.router.push(const TabRoute());
                    },
                  ))
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SingleChildScrollView(
                    child: WidthConstraint(context)
                        .withHorizontalSymmetricalPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: (Sizing.kSizingMultiple * 4).h),
                          _buildTopSection(),
                          SizedBox(height: (Sizing.kSizingMultiple).h),
                          _buildMigrantStatusField(
                              status: "yes",
                              title: "Intending Migrant",
                              label:
                                  "This is for you if you plan to leave your current country of residence.",
                              callback: () {
                                setState(() {
                                  selectedMeansOfPayment = 1;
                                });
                              }),
                          SizedBox(height: (Sizing.kSizingMultiple).h),
                          _buildMigrantStatusField(
                              status: "no",
                              title: "New Migrant",
                              label:
                                  "This is for you if you have just arrived your new country.",
                              callback: () {
                                setState(() {
                                  selectedMeansOfPayment = 2;
                                  Future.delayed(Durations.short3).then(
                                      (value) => context.router
                                          .push(const JourneySelectionRoute()));
                                });
                              }),
                          SizedBox(
                              height:
                                  (MediaQuery.sizeOf(context).height * 0.1).h),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
           
            ],
          ),
        ],
      ),
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

  Widget _buildTopSection() {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.75.w,
          child: Text(
            "I am an/a ",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 25.sp,
                fontWeight: FontWeight.w700,
                height: 0.75.h,
                color: const Color(0xff344054)),
          ),
        ),
      ],
    );
  }

  Widget _buildMigrantStatusField(
      {required String status,
      required String title,
      required String label,
      required VoidCallback callback}) {
    return GestureDetector(
      onTap: () {
        callback();

        print(selectedMeansOfPayment);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.all(2.h),
              child: Center(
                  child: SvgPicture.asset(
                (selectedMeansOfPayment == 1 && status == "yes")
                    ? "assets/svg/mcheck.svg"
                    : (selectedMeansOfPayment == 2 && status == "no")
                        ? "assets/svg/mcheck.svg"
                        : "assets/svg/muncheck.svg",
                // height: 30.h,
                // width: 30,
              ))),
          SizedBox(
            width: Sizing.kSizingMultiple.h,
          ),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 180.w,
                    child: Text(title,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                // color: Colors.black,
                                color: Color(0xFF344054),
                                fontSize: 16.sp,
                                //fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w700),
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(label,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontWeight: FontWeight.w500)),
              SizedBox(
                width: 3.w,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
