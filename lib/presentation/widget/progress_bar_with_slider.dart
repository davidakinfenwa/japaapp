// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:japaapp/core/theme/custom_typography.dart';

class LinearSlider extends StatefulWidget {
  const LinearSlider({super.key});

  @override
  _LinearSliderState createState() => _LinearSliderState();
  
}

class _LinearSliderState extends State<LinearSlider> {
  double sliderValue = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Slider.adaptive(
            label: "label",

            min: 10, // Minimum value
            max: 500, // Maximum value
            value: sliderValue,
            onChanged: (v) {
              setState(() {
                sliderValue = v;
              });
            },
          ),
          Text(
            'Value: ${sliderValue.round()}',
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),

          // LinearProgressIndicator(
          //   backgroundColor: Colors.red,
          //    value: (sliderValue - 10) / (500 - 10)
          // ),
        ],
      ),
    );
  }
}

class RangeSlide extends StatefulWidget {
  const RangeSlide({super.key});

  @override
  State<RangeSlide> createState() => _RangeSlideState();
}

class _RangeSlideState extends State<RangeSlide> {
  double _startValue = 10;
  double _endValue = 90;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //  const Padding(
        //       padding: EdgeInsets.symmetric(horizontal: 10),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Text('10'), // Start value label
        //           Text('500'), // End value label
        //         ],
        //       ),
        //     ),
        Expanded(
          child: RangeSlider(
            activeColor: CustomTypography.kPrimaryColor200,
            inactiveColor: const Color(0xFFD5D5D5),
            divisions: 9,
            min: 10,
            max: 500,
            values: RangeValues(_startValue, _endValue),
            onChanged: (RangeValues values) {
              setState(() {
                _startValue = values.start.roundToDouble();
                _endValue = values.end.roundToDouble();
              });
            },

            labels: RangeLabels(
              "\$${_startValue.toString()}",
              "\$${_endValue.toString()}",
            ),
            // labelPadding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0), // Adjust label padding
            // labels: RangeLabels(
            //   "\$${_startValue.toString()}",
            //   "\$${_endValue.toString()}",
            // ),
            // Wrap labels in a BoxDecoration with white background color
            // labelBoxDecoration: BoxDecoration(
            //   color: Colors.white, // Set background color to white
            //   borderRadius: BorderRadius.circular(4.0), // Optional: add border radius
            //   boxShadow: [
            //     BoxShadow(
            //       color: Colors.grey.withOpacity(0.5), // Add shadow for contrast
            //       spreadRadius: 1,
            //       blurRadius: 3,
            //       offset: Offset(0, 2), // changes position of shadow
            //     ),
            //   ],
            // ),
          ),
        ),
        // Padding(
        //   padding:const EdgeInsets.symmetric(horizontal: 16),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Text('$_startValue',style: TextStyle(color: Colors.black),), // Start value label
        //       Text('$_endValue'), // End value label
        //     ],
        //   ),
        // ),
      ],
    );
  }
}

// class _RangeSliderWithLabelsState extends State<RangeSliderWithLabels> {
//   double _startValue = 10;
//   double _endValue = 90;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Range Slider with Labels'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('10'), // Start value label
//                 Text('500'), // End value label
//               ],
//             ),
//           ),
//           RangeSlider(
//             min: 10,
//             max: 500,
//             values: RangeValues(_startValue, _endValue),
//             onChanged: (RangeValues values) {
//               setState(() {
//                 _startValue = values.start.roundToDouble();
//                 _endValue = values.end.roundToDouble();
//               });
//             },
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text('$_startValue'), // Start value label
//                 Text('$_endValue'), // End value label
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
