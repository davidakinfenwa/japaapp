import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/route/app_router.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/core/util/width_constraints.dart';

import 'package:japaapp/presentation/screens/profile/provider/account_provider.dart';
import 'package:japaapp/presentation/shared/custom_button.dart';
import 'package:provider/provider.dart';

class MyBottomSheet extends StatefulWidget {
  const MyBottomSheet({
    super.key,
    required this.onItemSelected,
  });

  final Function(String) onItemSelected;
  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  // final String data="";
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {"title": 'Primary Education'},
      {"title": 'High School '},
      {"title": 'Vocational or Technical education'},
      {"title": 'Associate degree (Diploma)'},
      {"title": 'Bachelor’s degree'},
      {"title": 'Master’s degree'},
      {"title": 'Doctoral degree'},
    ];
    return Container(
      height: 393.h,
      decoration: BoxDecoration(
        border: Border(
            // top: BorderSide(
            //   width: 1.w, // Width of the border
            //   color: const Color(0xFFB7C6CC),
            // ),
            // left: BorderSide(
            //   width: 1.w, // Width of the border
            //   color: const Color(0xFFB7C6CC),
            // ),
            // right: BorderSide(
            //   width: 1.w, // Width of the border
            //   color: const Color(0xFFB7C6CC),
            // ),
            bottom: BorderSide(
          width: 1.16.w, // Width of the border
          color: const Color(0xFFB7C6CC),
        )),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10, left: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Select highest level of education  ',
                  //style: AppTheme.inputText
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(color: Colors.grey.shade600, fontSize: 18.sp),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 0, top: 10),
                  child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final content = items[index];
                return InkWell(
                  onTap: () {
                    widget.onItemSelected(content['title']);
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15.w, 16.h, 24.w, 0.h),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                          width: 1.w, // Width of the border
                          color: const Color(0xFFB7C6CC),
                        )),
                      ),
                      height: 48.h,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0.w, top: 15.h),
                        child: Text(
                          content['title'],
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: const Color(0xFF344053),
                                    fontSize: 16,
                                  ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MyBottomSheetScalePoint extends StatefulWidget {
  const MyBottomSheetScalePoint({
    super.key,
    required this.onItemSelected,
  });

  final Function(String) onItemSelected;
  @override
  @override
  State<MyBottomSheetScalePoint> createState() =>
      _MyBottomSheetScalePointState();
}

class _MyBottomSheetScalePointState extends State<MyBottomSheetScalePoint> {
  @override
  Widget build(BuildContext context) {
    //final loanProvider = Provider.of<LoanProvider>(context);
    final scale = Provider.of<AccountPageProvider>(context, listen: false);
    final List<Map<String, dynamic>> items = [
      {"title": '4-Point Scale'},
      {"title": '5-Point Scale'},
      {"title": '7-Point Scale'},
      {"title": '10-Point Scale'},
      {"title": '20-Point Scale'},
      {"title": 'Letter Grade'},
      {"title": 'Percentage Scale'},
    ];
    return Container(
      height: 393.h,
      decoration: BoxDecoration(
        border: Border(
            // top: BorderSide(
            //   width: 1.w, // Width of the border
            //   color: const Color(0xFFB7C6CC),
            // ),
            // left: BorderSide(
            //   width: 1.w, // Width of the border
            //   color: const Color(0xFFB7C6CC),
            // ),
            // right: BorderSide(
            //   width: 1.w, // Width of the border
            //   color: const Color(0xFFB7C6CC),
            // ),
            bottom: BorderSide(
          width: 1.16.w, // Width of the border
          color: const Color(0xFFB7C6CC),
        )),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10, left: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Select scale point',
                  //style: AppTheme.inputText
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(color: Colors.grey.shade600, fontSize: 18.sp),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 0, top: 10),
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final content = items[index];
                return InkWell(
                  onTap: () {
                    //this line is to fetch the Period[Monthly,weekly,daily]
                    // scale.scaleType = content['title'].toString().toLowerCase();
                    widget.onItemSelected(content['title']);

                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15.w, 16.h, 24.w, 0.h),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                          width: 1.w, // Width of the border
                          color: const Color(0xFFB7C6CC),
                        )),
                      ),
                      height: 48.h,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0.w, top: 15.h),
                        child: Text(
                          content['title'],
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: const Color(0xFF344053),
                                    fontSize: 16,
                                  ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MyBottomMaritalSheet extends StatefulWidget {
  const MyBottomMaritalSheet({
    super.key,
    required this.onItemSelected,
  });

  final Function(String) onItemSelected;
  @override
  State<MyBottomMaritalSheet> createState() => _MyBottomMaritalSheetState();
}

class _MyBottomMaritalSheetState extends State<MyBottomMaritalSheet> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {"title": 'Single'},
      {"title": 'Married '},
      {"title": 'Divorced/Separated'},
      {"title": 'Widowed'},
    ];
    return Container(
      height: 393.h,
      decoration: BoxDecoration(
        border: Border(
            // top: BorderSide(
            //   width: 1.w, // Width of the border
            //   color: const Color(0xFFB7C6CC),
            // ),
            // left: BorderSide(
            //   width: 1.w, // Width of the border
            //   color: const Color(0xFFB7C6CC),
            // ),
            // right: BorderSide(
            //   width: 1.w, // Width of the border
            //   color: const Color(0xFFB7C6CC),
            // ),
            bottom: BorderSide(
          width: 1.16.w, // Width of the border
          color: const Color(0xFFB7C6CC),
        )),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10, left: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Please select your marital status',
                  //style: AppTheme.inputText
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(color: Colors.grey.shade600, fontSize: 18.sp),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 0, top: 10),
                  child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final content = items[index];
                return InkWell(
                  onTap: () {
                    //this line is to fetch the Period[Monthly,weekly,daily]
                    widget.onItemSelected(content['title']);

                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15.w, 16.h, 24.w, 0.h),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                          width: 1.w, // Width of the border
                          color: const Color(0xFFB7C6CC),
                        )),
                      ),
                      height: 48.h,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0.w, top: 15.h),
                        child: Text(
                          content['title'],
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: const Color(0xFF344053),
                                    fontSize: 16,
                                  ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MyBottomAwardSheet extends StatefulWidget {
  const MyBottomAwardSheet({super.key, required this.onItemSelected, this.nav});

  final Function(String) onItemSelected;
  final String? nav;
  @override
  State<MyBottomAwardSheet> createState() => _MyBottomAwardSheetState();
}

class _MyBottomAwardSheetState extends State<MyBottomAwardSheet> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {"title": 'Award'},
      {"title": 'Book '},
      {"title": 'Patent'},
      {"title": 'Publications'},
    ];

    final List<Map<String, dynamic>> visaType = [
      {"title": 'Student visa'},
      {"title": 'Work visa '},
      {"title": 'Business immigrant visa'},
      {"title": 'Permament residence visa'},
      {"title": 'Diplomatic visa'},
      {"title": 'Provincial Nomination visa'},
      {"title": 'Family-Sponsorship Program'},
    ];
    return Container(
      height: 393.h,
      decoration: BoxDecoration(
        border: Border(
            // top: BorderSide(
            //   width: 1.w, // Width of the border
            //   color: const Color(0xFFB7C6CC),
            // ),
            // left: BorderSide(
            //   width: 1.w, // Width of the border
            //   color: const Color(0xFFB7C6CC),
            // ),
            // right: BorderSide(
            //   width: 1.w, // Width of the border
            //   color: const Color(0xFFB7C6CC),
            // ),
            bottom: BorderSide(
          width: 1.16.w, // Width of the border
          color: const Color(0xFFB7C6CC),
        )),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10, left: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                 widget.nav=="visa"?'Please select visa type': 'Please select your marital status',
                  //style: AppTheme.inputText
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: CustomTypography.kBlackColor, fontSize: 18.sp),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 0, top: 10),
                  child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.nav == "visa" ? visaType.length : items.length,
              itemBuilder: (BuildContext context, int index) {
                final content =
                    widget.nav == "visa" ? visaType[index] : items[index];
                return InkWell(
                  onTap: () {
                    //this line is to fetch the Period[Monthly,weekly,daily]
                    widget.onItemSelected(content['title']);

                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15.w, 16.h, 24.w, 0.h),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                          width: 1.w, // Width of the border
                          color: const Color(0xFFB7C6CC),
                        )),
                      ),
                      height: 48.h,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0.w, top: 15.h),
                        child: Text(
                          content['title'],
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: const Color(0xFF344053),
                                    fontSize: 16,
                                  ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MyBottomCountrySheet extends StatefulWidget {
  const MyBottomCountrySheet({
    super.key,
    required this.onItemSelected,
  });

  final Function(String, String) onItemSelected;
  @override
  State<MyBottomCountrySheet> createState() => _MyBottomCountrySheetState();
}

class _MyBottomCountrySheetState extends State<MyBottomCountrySheet> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {"title": 'Canada', 'svg': 'assets/svg/nija.svg'},
      {"title": 'United States', 'svg': 'assets/svg/nija.svg'},
      {"title": 'United Kingdom', 'svg': 'assets/svg/nija.svg'},
    ];
    return Container(
      height: 273.h,
      decoration: BoxDecoration(
        color: CustomTypography.kWhiteColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(Sizing.kBorderRadius*3.r),topRight: Radius.circular(Sizing.kBorderRadius*3.r)),
        border: Border(
            bottom: BorderSide(
          width: 1.16.w, // Width of the border
          color: CustomTypography.kWhiteColor,
        )),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: Sizing.kSizingMultiple*2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Select Country',
                  //style: AppTheme.inputText
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: CustomTypography.kBlackColor, fontSize: 20.sp, fontWeight: FontWeight.w700),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 0, top: 10),
                //   child: IconButton(
                //     icon: Icon(Icons.close),
                //     onPressed: () {
                //       Navigator.of(context).pop();
                //     },
                //   ),
                // ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              padding: EdgeInsets.zero,
              itemBuilder: (BuildContext context, int index) {
                final content = items[index];
                return InkWell(
                  onTap: () {
                    //this line is to fetch the Period[Monthly,weekly,daily]
                    widget.onItemSelected(content['svg'], content['title']);

                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15.w, 5.h, 24.w, 10.h),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                          width: 1.w, // Width of the border
                          color: const Color(0xFFB7C6CC),
                        )),
                      ),
                      height: 48.h,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0.w, top: 15.h),
                        child: Row(
                          children: [
                            SvgPicture.asset(content['svg']),
                            const SizedBox(
                              width: Sizing.kSizingMultiple,
                            ),
                            Text(
                              content['title'],
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    color: const Color(0xFF344053),
                                    fontSize: 16,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MyBottomCountryCompareSheet extends StatefulWidget {
  const MyBottomCountryCompareSheet({
    super.key,
  });

  @override
  State<MyBottomCountryCompareSheet> createState() =>
      _MyBottomCountryCompareSheetState();
}

class _MyBottomCountryCompareSheetState
    extends State<MyBottomCountryCompareSheet> {
  List<int> selectedItems = [];

  Widget _buildActionButton() {
    return Column(
      children: [
        CustomButton(
          type: ButtonType.regularButton(
              onTap: () {
                context.router.push(const JoureyCompareDestinationRoute());
              },
              label: 'Continue',
              isLoadingMode: false,
              backgroundColor: CustomTypography.kPrimaryColor200,
              textColor: CustomTypography.kWhiteColor,
              borderRadius: BorderRadius.all(
                  Radius.circular(Sizing.kBorderRadius * 7.r))),
        ),
        SizedBox(
          height: Sizing.kHSpacing10,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {"title": 'Canada', 'svg': 'assets/svg/nija.svg'},
      {"title": 'United States', 'svg': 'assets/svg/nija.svg'},
      {"title": 'United Kingdom', 'svg': 'assets/svg/nija.svg'},
    ];
    return Container(
      height: 393.h,
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
          width: 1.16.w, // Width of the border
          color: const Color(0xFFB7C6CC),
        )),
      ),
      child: WidthConstraint(context).withHorizontalSymmetricalPadding(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10, left: 5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Compare destination',
                    //style: AppTheme.inputText
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: CustomTypography.kBlackColor, fontSize: 18.sp),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 0, top: 10),
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  final content = items[index];
                  final isSelected = selectedItems.contains(index);
                  return InkWell(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedItems.remove(
                              index); // Deselect the item if already selected
                        } else {
                          selectedItems.add(
                              index); // Select the item if not already selected
                        }
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0.w, 16.h, 10.w, 0.h),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                            width: 1.w, // Width of the border
                            color: const Color(0xFFB7C6CC),
                          )),
                        ),
                        height: 48.h,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.0.w, top: 15.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(content['svg']),
                                  const SizedBox(
                                    width: Sizing.kSizingMultiple,
                                  ),
                                  Text(
                                    content['title'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          color: const Color(0xFF344053),
                                          fontSize: 16,
                                        ),
                                  ),
                                ],
                              ),
                              SvgPicture.asset(
                                isSelected
                                    ? "assets/svg/mcheck.svg"
                                    : "assets/svg/muncheck.svg",
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            _buildActionButton()
          ],
        ),
      ),
    );
  }
}
