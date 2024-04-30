import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/core/util/width_constraints.dart';
import 'package:japaapp/presentation/widget/clipper_section.dart';
@RoutePage()

class FirstScreenOndoard extends StatefulWidget {
  const FirstScreenOndoard({super.key});

  @override
  State<FirstScreenOndoard> createState() => _FirstScreenOndoardState();
}

class _FirstScreenOndoardState extends State<FirstScreenOndoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  Stack(
            children: [
             Positioned.fill(
                child: Container(
                  color:CustomTypography.kPrimaryColor500,
                )
              ),
             
            ],
          ),
    );
  }
}




class SecondScreenOnboard extends StatefulWidget {
  const SecondScreenOnboard({super.key});

  @override
  State<SecondScreenOnboard> createState() => _SecondScreenOnboardState();
}

class _SecondScreenOnboardState extends State<SecondScreenOnboard> with SingleTickerProviderStateMixin {
    late AnimationController _animationController;
 
  @override
  void initState() {
    
    _animationController=AnimationController(vsync: this,value: 0.0,duration:const Duration(seconds: 10),upperBound: 1,lowerBound: -1 )..repeat();
    super.initState();
  }
   @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
       // color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                  width: 300,
                  height: Sizing.kLogoDiameter * 1.5.h,
                  child: SvgPicture.asset(
                    'assets/svg/onboard1.svg',
                    fit: BoxFit.cover,
                  )),
            ),
            _buildWelcomText(),
          ],
        ),
      
    );
  }

  Widget _buildWelcomText() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: (Sizing.kSizingMultiple * 4).h),

            SizedBox(
            width: MediaQuery.sizeOf(context).width*0.85.w,
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'CONFUSED ABOUT SETTELING',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: CustomTypography.kPrimaryColor200),
                  // children: <TextSpan>[
                  //   TextSpan(
                  //     text: ' \nCONFUSED ABOUT SETTELING',
                  //     style:
                  //         Theme.of(context).textTheme.headlineSmall?.copyWith(
                  //               color: CustomTypography.kPrimaryColor200,
                  //               fontWeight: FontWeight.w700,
                  //               //fontFamily: "Nunito"
                  //             ),
                  //   ),

                  //   // TextSpan(text: '!'),
                  // ],
                )),
          ),
          
          SizedBox(height: (Sizing.kSizingMultiple * 2).h),
          SizedBox(
            width: 250.w,
            child: Text(
              "Confused about your next career and migration plans?",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: CustomTypography.kGreyColor70,
                  fontSize: 14.0.sp),

                  textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }


    Widget _buildTopSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.75.w,
            child: Text(
              "A simple way to Migrate and Settle",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: CustomTypography.kPrimaryColor200),
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
      ),
    );
  }
}



class ThirdScreenOnboard extends StatefulWidget {
  const ThirdScreenOnboard({super.key});

  @override
  State<ThirdScreenOnboard> createState() => _ThirdScreenOnboardState();
}

class _ThirdScreenOnboardState extends State<ThirdScreenOnboard> with SingleTickerProviderStateMixin {
    late AnimationController _animationController;
 
  @override
  void initState() {
    
    _animationController=AnimationController(vsync: this,value: 0.0,duration:const Duration(seconds: 10),upperBound: 1,lowerBound: -1 )..repeat();
    super.initState();
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  
    @override
  Widget build(BuildContext context) {
    return WidthConstraint(context).withHorizontalSymmetricalPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
                width: 300,
                height: Sizing.kLogoDiameter * 1.5.h,
                child: SvgPicture.asset(
                  'assets/svg/onboard2.svg',
                  fit: BoxFit.cover,
                )),
          ),
          _buildWelcomText(),
        ],
      ),
    );
  }





    Widget _buildWelcomText() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: (Sizing.kSizingMultiple * 4).h),

            SizedBox(
            width: MediaQuery.sizeOf(context).width*0.85.w,
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'A simple way to Migrate',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w600,
                  color: CustomTypography.kPrimaryColor200),
                  // children: <TextSpan>[
                  //   TextSpan(
                  //     text: ' \nCONFUSED ABOUT SETTELING',
                  //     style:
                  //         Theme.of(context).textTheme.headlineSmall?.copyWith(
                  //               color: CustomTypography.kPrimaryColor200,
                  //               fontWeight: FontWeight.w700,
                  //               //fontFamily: "Nunito"
                  //             ),
                  //   ),

                  //   // TextSpan(text: '!'),
                  // ],
                )),
          ),
          
          SizedBox(height: (Sizing.kSizingMultiple * 2).h),
          SizedBox(
            width: 250.w,
            child: Text(
              "Let’s help take the right steps in the step that fits you!",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: CustomTypography.kGreyColor70,
                  fontSize: 14.0.sp),

                  textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}



class FourthScreenOncoard extends StatefulWidget {
  const FourthScreenOncoard({super.key});

  @override
  State<FourthScreenOncoard> createState() => _FourthScreenOncoardState();
}

class _FourthScreenOncoardState extends State<FourthScreenOncoard> with SingleTickerProviderStateMixin{
    late AnimationController _animationController;
 
  @override
  void initState() {
    _animationController=AnimationController(vsync: this,value: 0.0,duration:const Duration(seconds: 10),upperBound: 1,lowerBound: -1 )..repeat();
    super.initState();
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
   @override
  Widget build(BuildContext context) {
    return WidthConstraint(context).withHorizontalSymmetricalPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SizedBox(
                width: 300,
                height: Sizing.kLogoDiameter * 1.5.h,
                child: SvgPicture.asset(
                  'assets/svg/onboard3.svg',
                  fit: BoxFit.cover,
                )),
          ),
          _buildWelcomText(),
        ],
      ),
    );
  }

 


      Widget _buildWelcomText() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: (Sizing.kSizingMultiple * 4).h),

            SizedBox(
            width: MediaQuery.sizeOf(context).width*0.85.w,
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'A simple way to Migrate',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w600,
                  color: CustomTypography.kPrimaryColor200),
                  // children: <TextSpan>[
                  //   TextSpan(
                  //     text: ' \nCONFUSED ABOUT SETTELING',
                  //     style:
                  //         Theme.of(context).textTheme.headlineSmall?.copyWith(
                  //               color: CustomTypography.kPrimaryColor200,
                  //               fontWeight: FontWeight.w700,
                  //               //fontFamily: "Nunito"
                  //             ),
                  //   ),

                  //   // TextSpan(text: '!'),
                  // ],
                )),
          ),
          
          SizedBox(height: (Sizing.kSizingMultiple * 2).h),
          SizedBox(
            width: 250.w,
            child: Text(
             "Seamlessly connect with a community of people just like you!",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: CustomTypography.kGreyColor70,
                  fontSize: 14.0.sp),

                  textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}