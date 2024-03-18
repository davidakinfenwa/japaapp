import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/route/app_router.dart';
import 'package:japaapp/core/theme/custom_typography.dart';

import 'package:japaapp/presentation/screens/onboard/screen_onboard.dart';

@RoutePage()
class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final _controller = PageController();
  int _currentPage = 0;

  List<Widget> pageList = [
    const FirstScreenOndoard(),
    const SecondScreenOnboard(),
    const ThirdScreenOnboard(),
    const FourthScreenOncoard(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTypography.kSecondaryColorJapa200,
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: pageList.length,
            onPageChanged: (value) => setState(() {
              _currentPage = value;
            }),
            itemBuilder: (context, index) {
              // ignore: avoid_unnecessary_containers
              return pageList[index];
            },
          ),
          Positioned(
              bottom: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: _buildDotNavSection(),
              ))
        ],
      ),
    );
  }

  AnimatedContainer _buildDots({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(Sizing.kBorderRadius),
        ),
        color: CustomTypography.kSecondaryColorJapa200,
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  Widget _buildDotNavSection() {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 20.h),
      //color: Colors.red,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: List.generate(
              pageList.length, //Change to Item length
              (int index) => _buildDots(index: index),
            ),
          ),
          Row(
            children: [
              _currentPage > 0
                  ? ElevatedButton(
                      onPressed: () {
                        _controller.previousPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomTypography.kPrimaryColorJapa200,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        elevation: 0,
                        padding: (MediaQuery.sizeOf(context).width <= 550)
                            ? const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20)
                            : const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 25),
                        textStyle: TextStyle(
                            fontSize: (MediaQuery.sizeOf(context).width <= 550)
                                ? 13
                                : 17),
                      ),
                      child: const Text(
                        "Previous",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : const SizedBox(),
              SizedBox(
                width: Sizing.kWSpacing10,
              ),
              _currentPage < 3
                  ? ElevatedButton(
                      onPressed: () {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomTypography.kPrimaryColorJapa200,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        elevation: 0,
                        padding: (MediaQuery.sizeOf(context).width <= 550)
                            ? const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20)
                            : const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 25),
                        textStyle: TextStyle(
                            fontSize: (MediaQuery.sizeOf(context).width <= 550)
                                ? 13
                                : 17),
                      ),
                      child: const Text(
                        "Next",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        HapticFeedback.vibrate();
                        context.router.replace(const LandingRoute());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomTypography.kPrimaryColorJapa200,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        elevation: 0,
                        padding: (MediaQuery.sizeOf(context).width <= 550)
                            ? const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20)
                            : const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 25),
                        textStyle: TextStyle(
                            fontSize: (MediaQuery.sizeOf(context).width <= 550)
                                ? 13
                                : 17),
                      ),
                      child: const Text(
                        "Done",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
            ],
          )
        ],
      ),
    );
  }
}
