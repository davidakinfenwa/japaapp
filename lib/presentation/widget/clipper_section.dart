
import 'package:flutter/material.dart';
import 'dart:math' as math;

class DrawClip extends CustomClipper<Path>{
  double move=0;
  double slice=math.pi;
  DrawClip(this.move);
  @override
  Path getClip(Size size) {
   Path path=Path()


    //First Shape
   ..moveTo(0, size.height*0.3)
  ..quadraticBezierTo(size.width*.5, size.height*.5, size.width, size.height*.134)
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



class DrawClip1 extends CustomClipper<Path>{
  double move=0;
  double slice=math.pi;
  DrawClip1(this.move);
  @override
  Path getClip(Size size) {
   Path path=Path()



    //Second Shape
   ..moveTo(0, size.height*.131)
  ..quadraticBezierTo(size.width*.5, size.height*0, size.width, size.height*.32)
  //  ..quadraticBezierTo(size.width*1, size.height/2, size.width*1.5, size.height*0.4)
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






class DrawClip2 extends CustomClipper<Path>{
  double move=0;
  double slice=math.pi;
  DrawClip2(this.move);
  @override
  Path getClip(Size size) {
   Path path=Path()

  //Last Shape
  //  ..quadraticBezierTo(size.width*0.7 +(size.width*0.6) * math.sin(move*slice), size.height*.5 +(size.height*0.3) * math.sin(move*slice), size.width, size.height*0.3) animations
  ..moveTo(0, size.height*.32)
   ..quadraticBezierTo(size.width*0.7 , size.height*.5 , size.width, size.height*0.15)
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