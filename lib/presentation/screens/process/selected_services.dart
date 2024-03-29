import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:japaapp/core/constants.dart';

import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/core/util/width_constraints.dart';
import 'package:japaapp/presentation/shared/custom_button.dart';
import 'package:japaapp/presentation/widget/custom_accordion.dart';
import 'package:japaapp/presentation/widget/custom_app_bar.dart';

@RoutePage()
class SelectedServicesScreen extends StatefulWidget {
  const SelectedServicesScreen({super.key, required this.selectedServices});
 final List<dynamic> selectedServices;


  @override
  State<SelectedServicesScreen> createState() => _SelectedServicesScreenState();
}

class _SelectedServicesScreenState extends State<SelectedServicesScreen> {
  int selectedIteminList = -1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          WidthConstraint(context).withHorizontalSymmetricalPadding(
            child: Column(
              children: [
                SizedBox(height: (Sizing.kSizingMultiple * 4).h),
                _buildSalutationSection(),
                Expanded(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //SizedBox(height: (Sizing.kSizingMultiple).h),
                            _buildNewImmigrantSection(),
                            SizedBox(height: (Sizing.kSizingMultiple).h),
                            // _buildWhatEverToggle(),
                            // SizedBox(height: (Sizing.kSizingMultiple * 4).h),
                            // _buildActionButton(),
                            // SizedBox(height: (Sizing.kSizingMultiple).h),
                            // _buildNotice()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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

  Widget _buildSalutationSection() {
    return const CustomApbar(
      title: 'My Process',
    );
  }

  Widget _buildNewImmigrantSection() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.selectedServices.length,
      itemBuilder: (context,index) {
        final data=widget.selectedServices[index];
        return Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: CustomAccordion(
            title:data ,
            child: Column(
                children: List.generate(6, (index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedIteminList = index;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: EdgeInsets.all(2.h),
                              child: Center(
                                  child: SvgPicture.asset(
                                selectedIteminList == index
                                    ? "assets/svg/mcheck.svg"
                                    : "assets/svg/muncheck.svg",
                                // height: 30.h,
                                // width: 30,
                              ))),
                          SizedBox(
                            width: Sizing.kSizingMultiple.h,
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.65.w,
                            child: Text(
                              "Task 1 and a description of the task that should be carried out.",
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  // color: Colors.black,
                                  color: const Color(0xFF344054),
                                  //fontSize: 16.sp,
                                  //fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Sizing.kWSpacing10.h,
                    ),
                    SvgPicture.asset("assets/svg/threedot.svg"),
          
                    // InkWell(
                    //     onTap: () {
                    //       showPopover(
                    //         constraints:BoxConstraints.expand() ,
                    //         context: context,
                    //         backgroundColor: Colors.white,
                    //         bodyBuilder: (context) => Container(
                    //             color: Colors.red, child: _buildlistPopItem()),
                    //         onPop: () => print('Popover was popped!'),
                    //         //onPop: () => print('Popover was popped!'),  // Print a message when the popover is dismissed
                    //         direction: PopoverDirection.top, // Set the direction of the popover
                    //         width: 200, // Set the width of the popover
                    //         height: 450, // Set the height of the popover
                    //         arrowHeight: 15, // Set the height of the arrow
                    //         arrowWidth: 30,
                    //       );
                    //     },
                    //     child: SvgPicture.asset("assets/svg/threedot.svg")),
                    SizedBox(
                      width: 3.w,
                    ),
                  ],
                ),
              );
            })),
          ),
        );
      }
    );
  }

  Widget _buildlistPopItem() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          children: [
            InkWell(
              onTap: () {
                // Navigator.of(context)
                //   ..pop()
                //   ..push(
                //     MaterialPageRoute<SecondRoute>(
                //       builder: (context) => SecondRoute(),
                //     ),
                //   );
              },
              child: Container(
                height: 50,
                color: Colors.amber[100],
                child: const Center(child: Text('Entry A')),
              ),
            ),
            const Divider(),
            Container(
              height: 50,
              color: Colors.amber[200],
              child: const Center(child: Text('Entry B')),
            ),
            const Divider(),
            Container(
              height: 50,
              color: Colors.amber[300],
              child: const Center(child: Text('Entry C')),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWhatEverToggle() {
    return const SizedBox();
  }

  Widget _buildActionButton() {
    return Column(
      children: [
        CustomButton(
          type: ButtonType.withBorderLongButton(
              onTap: () {
                //context.router.push(const TabRoute());
              },
              label: 'Speak with a consultant',
              isLoadingMode: false,
              //: CustomTypography.kPrimaryColor200,
              borderColor: CustomTypography.kPrimaryColor200,
              textColor: CustomTypography.kPrimaryColor200,
              borderRadius: BorderRadius.all(
                  Radius.circular(Sizing.kBorderRadius * 7.r))),
        ),
      ],
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
                      ' you can choose the list of services you need help with',
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
}

class CustomPopover extends StatelessWidget {
  final Widget child;
  final Widget popoverContent;

  const CustomPopover({
    Key? key,
    required this.child,
    required this.popoverContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showPopover(context);
      },
      child: child,
    );
  }

  void _showPopover(BuildContext context) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    final double width = size.width;
    final double height = size.height;

    final double screenWidth = MediaQuery.of(context).size.width;

    final popoverWidth = screenWidth * 0.5; // Adjust popover width as needed

    final overlay = OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx + width / 2 - popoverWidth / 2,
        top: offset.dy + height + 10,
        child: Material(
          child: Container(
            width: popoverWidth,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: popoverContent,
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlay);

    // Close the popover when tapping outside
    Future.delayed(Duration.zero, () {
      GestureDetector(
        onTap: () => overlay.remove(),
        child: Container(
          color: Colors.transparent,
          width: screenWidth,
          height: MediaQuery.of(context).size.height,
        ),
      );
    });
  }
}
