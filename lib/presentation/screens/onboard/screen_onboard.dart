import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
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
                  color:CustomTypography.kPrimaryColorJapa500,
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
    return Scaffold(
      backgroundColor: CustomTypography.kSecondaryColorJapa200,

      body: Stack(
            children: [
             Positioned.fill(
                child: SvgPicture.asset(
                  'assets/svg/splash.svg',
                ),
              ),
              Align(
                alignment:Alignment.bottomCenter,
                child:AnimatedBuilder(animation:_animationController ,builder: (context, child) {
                  return  ClipPath(
                  clipper: DrawClip(_animationController.value),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width.w,
                  height: Sizing.kHSpacing50*3,
                  decoration:const BoxDecoration(
                    color: CustomTypography.kWhiteColor
                  ),
                    //child:const Text("Data start here"),
                  ),
                );
                },)
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
    return Scaffold(
      backgroundColor: CustomTypography.kSecondaryColorJapa200,

      body: Stack(
            children: [
             Positioned.fill(
                child: SvgPicture.asset(
                  'assets/svg/splash.svg',
                ),
              ),
              Align(
                alignment:Alignment.bottomCenter,
                child:AnimatedBuilder(animation:_animationController ,builder: (context, child) {
                  return  ClipPath(
                  clipper: DrawClip1(_animationController.value),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width.w,
                  height: Sizing.kHSpacing50*3,
                  decoration:const BoxDecoration(
                    color: CustomTypography.kWhiteColor
                  ),
                    //child:const Text("Data start here"),
                  ),
                );
                },)
              ),
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
    return Scaffold(
      backgroundColor: CustomTypography.kSecondaryColorJapa200,

      body:Stack(
            children: [
             Positioned.fill(
                child: SvgPicture.asset(
                  'assets/svg/splash.svg',
                ),
              ),
              Align(
                alignment:Alignment.bottomCenter,
                child:AnimatedBuilder(animation:_animationController ,builder: (context, child) {
                  return  ClipPath(
                  clipper: DrawClip2(_animationController.value),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width.w,
                  height: Sizing.kHSpacing50*3,
                  decoration:const BoxDecoration(
                    color: CustomTypography.kWhiteColor
                  ),
                    //child:const Text("Data start here"),
                  ),
                );
                },)
              ),
            ],
          ) ,
    );
  }
}