import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/route/app_router.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/core/util/width_constraints.dart';
import 'package:japaapp/presentation/shared/custom_button.dart';
import 'package:japaapp/presentation/widget/back_button.dart';

@RoutePage()
class JourneyCountryPredictedPage extends StatefulWidget {
  const JourneyCountryPredictedPage({super.key});

  @override
  State<JourneyCountryPredictedPage> createState() =>
      _JourneyCountryPredictedPageState();
}

class _JourneyCountryPredictedPageState
    extends State<JourneyCountryPredictedPage> {
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
                      SizedBox(height: (Sizing.kSizingMultiple).h),
                      _buildSuggestedCountrySection(),
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
                                _buildOtherActionButton("Rerun Assessment"),
                                _buildOtherActionButton("Pick a country"),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          //width: MediaQuery.sizeOf(context).width * 0.75.w,
          child: Image.asset(
            'assets/images/countrycan.png',
            fit: BoxFit.cover,
            width: 100,
            height: 100,
          ),
        ),
      ],
    );
  }

  Widget _buildGoodFitText() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.8.w,
      child: Text(
        'Based on your profile, you will be a good fit for',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              //color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }

  Widget _buildSuggestedCountrySection() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.8.w,
      child: Text(
        'Canada',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
      ),
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
              label: 'Continue',
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

  Widget _buildOtherActionButton(String label) {
    return Column(
      children: [
        CustomButton(
          type: ButtonType.withBorderLongButton(
              onTap: () {
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
