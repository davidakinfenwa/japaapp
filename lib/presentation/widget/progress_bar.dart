import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerWithProgressBar extends StatelessWidget {
  const ContainerWithProgressBar({  this.value, super.key});
 final double? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 311.w,
      height: 6.0.h,
      //padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: const Color(0XFFD9D9D9),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        children: [
          LinearProgressIndicator(
            minHeight: 50.h,
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xff172E40)),
            value:
                value ?? 0.9, // Replace with your progress value (0.0 to 1.0).
          ),
          // const Center(
          //   child: Text(
          //     '60%', // Replace with your progress label.
          //     style: TextStyle(fontWeight: FontWeight.bold),
          //   ),
          // ),
        ],
      ),
    );
  }
}






class ContainerWithProgressBarUpload extends StatefulWidget {
 const ContainerWithProgressBarUpload({required this.value, super.key});
  final double value;

  @override
  State<ContainerWithProgressBarUpload> createState() => _ContainerWithProgressBarUploadState();
}

class _ContainerWithProgressBarUploadState extends State<ContainerWithProgressBarUpload> {
  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: 150.w,
      height: 10.0.h,
      padding: const EdgeInsets.fromLTRB(100, 20, 100, 20),
      decoration: BoxDecoration(
        color:  Colors.green,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        children: [
          LinearProgressIndicator(
            minHeight: 70.h,
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            backgroundColor: Colors.green,
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xff172E40)),
            value:widget.value
                , // Replace with your progress value (0.0 to 1.0).
          ),
        
        ],
      ),
    );
  }
}
