import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/route/app_router.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/core/util/width_constraints.dart';
import 'package:japaapp/presentation/shared/custom_button.dart';
import 'package:japaapp/presentation/widget/back_button.dart';
import 'package:japaapp/presentation/widget/bottom_sheet_item.dart';
import 'package:japaapp/presentation/widget/item_with_dropdown.dart';


@RoutePage()
class JourneySelectionPage extends StatefulWidget {
  const JourneySelectionPage({super.key});

  @override
  State<JourneySelectionPage> createState() => _JourneySelectionPageState();
}

class _JourneySelectionPageState extends State<JourneySelectionPage> {
  TextEditingController _countryTextController = TextEditingController();
  int selectedMeansOfPayment = -2;
   String countrySvg="";

  @override
  void initState() {
    super.initState();
    _countryTextController = TextEditingController();
  }

  void _handlePress() {
    HapticFeedback.vibrate();
    //context.router.replace(const SignUpRoute());
  }

  @override
  void dispose() {
    _countryTextController.dispose();

    super.dispose();
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
                          SizedBox(height: (Sizing.kSizingMultiple * 4).h),
                          _buildSupriseMeSection(),
                          SizedBox(height: (Sizing.kSizingMultiple).h),
                          _buildNotice(),
                          SizedBox(height: (Sizing.kSizingMultiple*3).h),
                          _buildManuelSelectCountrySection(),
                          SizedBox(
                              height:
                                  (MediaQuery.sizeOf(context).height * 0.1).h),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: Sizing.kHSpacing50.h),
                    child: WidthConstraint(context)
                        .withHorizontalSymmetricalPadding(
                            child: Column(
                      children: [
                        _buildActionButton(),
                      ],
                    )),
                  )
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
            "Where to?",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 25.sp,
                fontWeight: FontWeight.w700,
                height: 0.75.h,
                color: const Color(0xFF0D0D0D)),
          ),
        ),
      ],
    );
  }

  Widget _buildSupriseMeSection() {
    return CustomButton(
      type: ButtonType.withBorderIconFontButton(
          onTap: () {
            //context.router.push(const SignInRoute());
          },
          //itemSpacingWidth: 10,
          label: 'Surprise Me',
          isLoadingMode: false,
          svgImageChecker: false,
          lotties: "magicwand.json",
          itemSpacingWidth: Sizing.kWSpacing10.w,
          textColor: CustomTypography.kPrimaryColor300,
          borderColor: CustomTypography.kPrimaryColor300,
          borderRadius:
              BorderRadius.all(Radius.circular(Sizing.kBorderRadius * 7.r))),
    );
  }

  Widget _buildNotice() {
    return Container(
      width: MediaQuery.sizeOf(context).width.w,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 5.0.w),
            child: SvgPicture.asset(
              'assets/svg/notices.svg',
            ),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.8,
            child: RichText(
                text: TextSpan(
              text: 'Note:',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: const Color(0xFF344054),
                  fontWeight: FontWeight.w700,
                  fontSize: 13.sp),
              children: <TextSpan>[
                TextSpan(
                  text:
                      ' Surprise me makes recommendation base on your profile',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: const Color(0xFF344054),
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp),
                ),
                // TextSpan(text: '!'),
              ],
            )),
          ),
        ],
      ),
    );
  }

  Widget _buildManuelSelectCountrySection() {
    return ItemWithPreffixDropDown(
      title:"Choose Destination Manually",
      preffix: SvgPicture.asset(countrySvg.isEmpty?"assets/svg/nija.svg":countrySvg),
      hintText: "Select destination country",
      bottomSheet: MyBottomCountrySheet(onItemSelected: (String icon, String value) {
        // Assign the value to the desired controller
        setState(() {
          _countryTextController.text = value;
          print(value);
          countrySvg=icon;

        });
      }),
      controller: _countryTextController,
    );
  }

  Widget _buildActionButton() {
    return Column(
      children: [
        CustomButton(
          type: ButtonType.regularButton(
              onTap: () {
                context.router.push(const JourneyCountryPredictedRoute());
              },
              label: 'Continue',
              isLoadingMode: false,
              backgroundColor: CustomTypography.kGreyColorButton,
              textColor: CustomTypography.kGreyColor80,
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
