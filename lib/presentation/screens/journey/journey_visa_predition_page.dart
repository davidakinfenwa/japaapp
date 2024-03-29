import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/route/app_router.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/core/util/width_constraints.dart';
import 'package:japaapp/presentation/shared/custom_button.dart';
import 'package:japaapp/presentation/widget/back_button.dart';
import 'package:japaapp/presentation/widget/bottom_sheet_item.dart';

@RoutePage()
class JourneyVisaPredictedPage extends StatefulWidget {
  const JourneyVisaPredictedPage({super.key});

  @override
  State<JourneyVisaPredictedPage> createState() =>
      _JourneyVisaPredictedPageState();
}

class _JourneyVisaPredictedPageState extends State<JourneyVisaPredictedPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
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
                child:
                    WidthConstraint(context).withHorizontalSymmetricalPadding(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildTopSection(),
                      SizedBox(height: (Sizing.kSizingMultiple * 4).h),
                      _buildGoodFitText(),
                      SizedBox(
                          height: (MediaQuery.sizeOf(context).height * 0.2).h),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(bottom: Sizing.kHSpacing10.h),
                            child: WidthConstraint(context)
                                .withHorizontalSymmetricalPadding(
                                    child: Column(
                              children: [
                                _buildActionButton(),
                                _buildOtherActionButton("Compare destinations",
                                    () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return const MyBottomCountryCompareSheet();
                                    },
                                  );
                                }),
                                _buildOtherActionButton(
                                    "Rerun assessment", () {}),
                              ],
                            )),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
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
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/countrycan.png',
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
                SizedBox(width: Sizing.kWSpacing50,),
      
                Image.asset(
                  'assets/images/visatype.png',
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGoodFitText() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.8.w,
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Based on your profile,',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  //color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
            children: <TextSpan>[
              TextSpan(
                text: ' \nCanada',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              TextSpan(
                text: ' \n will be a good fit for you',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: const Color(0xFF344054),
                    fontWeight: FontWeight.w500,
                    fontSize: 13.sp),
              ),
              // TextSpan(text: '!'),
            ],
          )),
    );
  }

  Widget _buildActionButton() {
    return Column(
      children: [
        CustomButton(
          type: ButtonType.regularButton(
              onTap: () {
                context.router.push(const JourneyVisaTypeSelectionRoute());
              },
              label: 'Begin my process',
              isLoadingMode: false,
              backgroundColor: CustomTypography.kPrimaryColor300,
              textColor: CustomTypography.kWhiteColor,
              borderRadius: BorderRadius.all(
                  Radius.circular(Sizing.kBorderRadius * 7.r))),
        ),
        SizedBox(
          height: Sizing.kHSpacing10,
        ),
      ],
    );
  }

  Widget _buildOtherActionButton(String label, Function onCallback) {
    return Column(
      children: [
        CustomButton(
          type: ButtonType.withBorderLongButton(
              onTap: () {
                onCallback();
                //context.router.push(const CreateAccountRoute());
              },
              label: label,
              isLoadingMode: false,
              textColor: CustomTypography.kPrimaryColor300,
              borderColor: CustomTypography.kPrimaryColor300,
              borderRadius: BorderRadius.all(
                  Radius.circular(Sizing.kBorderRadius * 7.r))),
        ),
        SizedBox(
          height: Sizing.kHSpacing10,
        ),
      ],
    );
  }
}
