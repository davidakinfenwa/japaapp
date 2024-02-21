import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'dart:math' as math;

@RoutePage()
class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    
    super.initState();
    _animationController=AnimationController(vsync: this,value: 0.0,duration:const Duration(seconds: 10),upperBound: 1,lowerBound: -1 )..repeat();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:const Color(0xff9ec1d7),
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



class DrawClip extends CustomClipper<Path>{
  double move=0;
  double slice=math.pi;
  DrawClip(this.move);
  @override
  Path getClip(Size size) {
   Path path=Path()


    //First Shape
  //  ..moveTo(0, size.height*0.3)
  // ..quadraticBezierTo(size.width*.5, size.height*.5, size.width, size.height*.2)
  //  ..lineTo(size.width, size.height)
  //  ..lineTo(0, size.height)

    //Second Shape
  //  ..moveTo(0, size.height*0.3)
  // ..quadraticBezierTo(size.width*.5, size.height*0, size.width, size.height*.35)
  // //  ..quadraticBezierTo(size.width*1, size.height/2, size.width*1.5, size.height*0.4)
  //  ..lineTo(size.width, size.height)
  //  ..lineTo(0, size.height)

  //Last Shape
  //  ..quadraticBezierTo(size.width*0.7 +(size.width*0.6) * math.sin(move*slice), size.height*.5 +(size.height*0.3) * math.sin(move*slice), size.width, size.height*0.3) animations
   ..quadraticBezierTo(size.width*0.7 , size.height*.5 , size.width, size.height*0.3)
   ..lineTo(size.width, size.height)
   ..lineTo(0, size.height)

   ..close();
   return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
   
    return true;
  }
  
}