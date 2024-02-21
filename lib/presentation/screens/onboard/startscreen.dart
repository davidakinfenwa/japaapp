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
  final _controller = PageController();
  int _currentPage = 0;
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
        // _buildPageBody(),

          PageView.builder(
            controller: _controller,
            itemCount: 4,
            onPageChanged: (value) => setState(() {
              _currentPage = value;
            }),
            itemBuilder: (context, index) {
              // ignore: avoid_unnecessary_containers
              return  _buildPageBody(index);
            },
          ),
          Align(alignment: Alignment.bottomCenter,child: _buildDotNavSection(),)
        ],
      ),
    );
  }

  Widget _buildPageBody(int index){
    return index==0? Stack(
            children: [
             Positioned.fill(
                child: Container(
                  color:Color(0xff18465a),
                )
              ),
              // Align(
              //   alignment:Alignment.bottomCenter,
              //   child:AnimatedBuilder(animation:_animationController ,builder: (context, child) {
              //     return  ClipPath(
              //     clipper: DrawClip(_animationController.value),
              //     child: Container(
              //       width: MediaQuery.sizeOf(context).width.w,
              //     height: Sizing.kHSpacing50*3,
              //     decoration:const BoxDecoration(
              //       color: CustomTypography.kWhiteColor
              //     ),
              //       //child:const Text("Data start here"),
              //     ),
              //   );
              //   },)
              // ),
            ],
          ):index==1?Stack(
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
          ):index==2? Stack(
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
          ): Stack(
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
          );
  }



  AnimatedContainer _buildDots({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color:  Color(0xFFAECCDE),
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  Widget _buildDotNavSection(){
    return   Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            4, //Change to Item length
            (int index) => _buildDots(index: index),
          ),
        ),
        _currentPage + 1 == 4  //Change to Item length
            ? Padding(
                padding: const EdgeInsets.all(30),
                child: ElevatedButton(
                  onPressed: () {
                    print("Move to next page");
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const LoginPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: (MediaQuery.sizeOf(context).width <= 550)
                        ? const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 20)
                        : EdgeInsets.symmetric(
                            horizontal: MediaQuery.sizeOf(context).width * 0.2, vertical: 25),
                    textStyle:
                        TextStyle(fontSize: (MediaQuery.sizeOf(context).width <= 550) ? 13 : 17),
                  ),
                  child: const Text("START"),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // TextButton(
                    //   onPressed: () {
                    //     _controller.jumpToPage(2);
                    //   },
                    //   style: TextButton.styleFrom(
                    //     elevation: 0,
                    //     textStyle: TextStyle(
                    //       fontWeight: FontWeight.w600,
                    //       fontSize: (MediaQuery.sizeOf(context).width <= 550) ? 13 : 17
                    //     ),
                    //   ),
                    //   child:  const Text(
                    //     "SKIP",
                    //     style: TextStyle(color: Colors.black),
                    //   ),
                    // ),
                     Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            4, //Change to Item length
            (int index) => _buildDots(index: index),
          ),
        ),
                    ElevatedButton(
                      onPressed: () {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff18465A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        elevation: 0,
                        padding: (MediaQuery.sizeOf(context).width <= 550)
                            ? const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20)
                            : const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 25),
                        textStyle:
                            TextStyle(fontSize: (MediaQuery.sizeOf(context).width <= 550) ? 13 : 17),
                      ),
                      child: const Text("Next",style:TextStyle(color: Colors.white),),
                    ),
                  ],
                ),
              )
      ],
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
   ..moveTo(0, size.height*0.3)
  ..quadraticBezierTo(size.width*.5, size.height*.5, size.width, size.height*.2)
   ..lineTo(size.width, size.height)
   ..lineTo(0, size.height)

    //Second Shape
  //  ..moveTo(0, size.height*0.3)
  // ..quadraticBezierTo(size.width*.5, size.height*0, size.width, size.height*.35)
  // //  ..quadraticBezierTo(size.width*1, size.height/2, size.width*1.5, size.height*0.4)
  //  ..lineTo(size.width, size.height)
  //  ..lineTo(0, size.height)

  // //Last Shape
  // //  ..quadraticBezierTo(size.width*0.7 +(size.width*0.6) * math.sin(move*slice), size.height*.5 +(size.height*0.3) * math.sin(move*slice), size.width, size.height*0.3) animations
  //  ..quadraticBezierTo(size.width*0.7 , size.height*.5 , size.width, size.height*0.3)
  //  ..lineTo(size.width, size.height)
  //  ..lineTo(0, size.height)

   ..close();
   return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
   
    return true;
  }
  
}



class DrawClip1 extends CustomClipper<Path>{
  double move=0;
  double slice=math.pi;
  DrawClip1(this.move);
  @override
  Path getClip(Size size) {
   Path path=Path()


    //First Shape
  //  ..moveTo(0, size.height*0.3)
  // ..quadraticBezierTo(size.width*.5, size.height*.5, size.width, size.height*.2)
  //  ..lineTo(size.width, size.height)
  //  ..lineTo(0, size.height)

    //Second Shape
   ..moveTo(0, size.height*0.3)
  ..quadraticBezierTo(size.width*.5, size.height*0, size.width, size.height*.35)
  //  ..quadraticBezierTo(size.width*1, size.height/2, size.width*1.5, size.height*0.4)
   ..lineTo(size.width, size.height)
   ..lineTo(0, size.height)

  // //Last Shape
  // //  ..quadraticBezierTo(size.width*0.7 +(size.width*0.6) * math.sin(move*slice), size.height*.5 +(size.height*0.3) * math.sin(move*slice), size.width, size.height*0.3) animations
  //  ..quadraticBezierTo(size.width*0.7 , size.height*.5 , size.width, size.height*0.3)
  //  ..lineTo(size.width, size.height)
  //  ..lineTo(0, size.height)

   ..close();
   return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
   
    return true;
  }
  
}






class DrawClip2 extends CustomClipper<Path>{
  double move=0;
  double slice=math.pi;
  DrawClip2(this.move);
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