import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/route/app_router.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/core/util/width_constraints.dart';
import 'package:japaapp/presentation/shared/custom_button.dart';

@RoutePage()
class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Opacity(
          //   opacity: 0.9, // Set opacity value (0.0 to 1.0)
          //   child:
          //       //  SvgPicture.asset("assets/svg/chat.svg"),
          //       Image.asset(
          //     'assets/images/neew.jpg',
          //     fit: BoxFit.cover,
          //   ),
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                child:
                    WidthConstraint(context).withHorizontalSymmetricalPadding(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: (Sizing.kSizingMultiple * 4).h),
                      _buildTopSection(),
                      SizedBox(height: (Sizing.kSizingMultiple).h),
                      _buildSeeHowItWorksButton(),
                    
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
                        child: _buildActionButton()),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTopSection() {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.75.w,
          child: Text(
            "A simple way to Migrate and Settle in a place you can call home",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                color: CustomTypography.kGreyColor100),
          ),
        ),
        SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.75.w,
          child: Text(
            'Japa App offers you a simple and guided way to migrate to your dream country. ',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: CustomTypography.kGreyColor70,
                fontSize: 14.0.sp),
          ),
        ),
      ],
    );
  }

  Widget _buildSeeHowItWorksButton() {
    return CustomButton(
      type: ButtonType.withBorderButton(
          onTap: () {},
          label: 'See how it works',
          isLoadingMode: false,
          svgImageChecker: true,
          svgImage: "Play.svg",
          itemSpacingWidth: Sizing.kWSpacing10.w,
          width: MediaQuery.sizeOf(context).width / 2.w,
          // backgroundColor: CustomTypography.kSecondaryColornew,
          textColor: CustomTypography.kPrimaryColor300,
          borderColor: CustomTypography.kPrimaryColor300,
          borderRadius:
              BorderRadius.all(Radius.circular(Sizing.kBorderRadius * 7.r))),
    );
  }

  Widget _buildActionButton() {
    return Column(
      children: [
        CustomButton(
          type: ButtonType.regularButton(
              onTap: () {context.router.push(const EmailVerificationRoute());},
              label: 'Sign Up',
              isLoadingMode: false,
              backgroundColor: CustomTypography.kPrimaryColor300,
              
              // backgroundColor: CustomTypography.kSecondaryColornew,
              textColor: CustomTypography.kWhiteColor,
              borderRadius: BorderRadius.all(
                  Radius.circular(Sizing.kBorderRadius * 7.r))),
        ),
        SizedBox(
          height: Sizing.kHSpacing10,
        ),
        CustomButton(
          type: ButtonType.withBorderLongButton(
              onTap: () {context.router.push(const SignInRoute());},
              label: 'Login',
              isLoadingMode: false,
              svgImageChecker: false,
              svgImage: "Play.svg",
              // itemSpacingWidth: Sizing.kWSpacing10.w,

              textColor: CustomTypography.kPrimaryColor300,
              borderColor: CustomTypography.kPrimaryColor300,
              borderRadius: BorderRadius.all(
                  Radius.circular(Sizing.kBorderRadius * 7.r))),
        ),
      ],
    );
  }
}
