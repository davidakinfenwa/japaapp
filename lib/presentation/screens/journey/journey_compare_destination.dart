import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/route/app_router.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/core/util/width_constraints.dart';
import 'package:japaapp/presentation/shared/custom_button.dart';

import 'package:japaapp/presentation/widget/custom_app_bar.dart';
import 'package:japaapp/presentation/widget/progress_bar_with_slider.dart';

@RoutePage()
class JoureyCompareDestinationPage extends StatefulWidget {
  const JoureyCompareDestinationPage({super.key});

  @override
  State<JoureyCompareDestinationPage> createState() =>
      _JoureyCompareDestinationPageState();
}

class _JoureyCompareDestinationPageState
    extends State<JoureyCompareDestinationPage> {
  int selectedMeansOfPayment = -2;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Stack(
        children: [
          _buildBackground(),
          WidthConstraint(context).withHorizontalSymmetricalPadding(
            child: Column(
              children: [
                SizedBox(height: (Sizing.kSizingMultiple * 4).h),
                Stack(
                  children: [
                    _buildSalutationSection(),
                  ],
                ),
                Expanded(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: (Sizing.kSizingMultiple).h),
                            _buildProgressBarSection(),
                            SizedBox(height: (Sizing.kSizingMultiple).h),
                            _buildWhatEverToggle(),
                            SizedBox(height: (Sizing.kSizingMultiple * 4).h),
                            // _buildActionButton(),
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
      title: 'Compare Destination',
    );
  }

  Widget _buildProgressBarSection() {
    return Container(
      //color: Colors.red,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            children: [
              SizedBox(
                  width: 32,
                  height: 32,
                  child: Image.asset('assets/images/uk.png')),
              SizedBox(
                width: 32,
                height: 32,
                child: Text(
                  "United Kingdom",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF191D23),
                      ),
                ),
              ),
            ],
          ),
          SizedBox(width: (Sizing.kSizingMultiple*4).h),
          Column(
            children: [
              SizedBox(
                  width: 32,
                  height: 32,
                  child: Image.asset('assets/images/us.png')),
              SizedBox(
                width: 32,
                height: 32,
                child: Text(
                  "United State",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF191D23),
                      ),
                ),
              ),
            ],
          ),
         SizedBox(width: (Sizing.kSizingMultiple*4).h),
          Column(
            children: [
              SizedBox(
                  width: 32,
                  height: 32,
                  child: Image.asset('assets/images/canada.png')),
              SizedBox(
                width: 32,
                height: 32,
                child: Text(
                  "Canada",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF191D23),
                      ),
                ),
              ),
            ],
          ),
         SizedBox(width: (Sizing.kSizingMultiple).h),

        ],
      ),
    );
  }

  Widget _buildWhatEverToggle() {
    List<Map<String,dynamic>> items = 
[
    {
      "title": "Housing Costs",
      "item_list": [
        {
          "item_list_name": "apartment rent",
          "uk": {"cost": 200000},
          "canada": {"cost": 200000},
          "us": {"cost": 200000}
        },
        {
          "item_list_name": "Median home price (3BR, 2BA)",
          "uk": {"cost": 200000},
          "canada": {"cost": 200000},
          "us": {"cost": 200000}
        }
      ]
    },
    {
      "title": "Transportation Costs",
      "item_list": [
        {
          "item_list_name": "Limoxing",
          "uk": {"cost": 200000},
          "canada": {"cost": 200000},
          "us": {"cost": 200000}
        },
        {
          "item_list_name": "ferrari",
          "uk": {"cost": 200000},
          "canada": {"cost": 200000},
          "us": {"cost": 200000}
        }
      ]
    }
  ];

    return ListView.builder(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      itemCount: items.length,
      shrinkWrap: true,
      itemBuilder: (context,index){
        final data=items[index];
return  Padding(
  padding: const EdgeInsets.only(bottom: 20),
  child: Column(
    
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            padding: const EdgeInsets.symmetric(horizontal: 18.57, vertical: 8),
decoration: BoxDecoration(
color: Color(0xFFF2F2F2),
borderRadius: BorderRadius.only(
topLeft: Radius.circular(8),
topRight: Radius.circular(8),
),
border: Border(
left: BorderSide(color: Color(0xFFEAECF0)),
top: BorderSide(color: Color(0xFFEAECF0)),
right: BorderSide(color: Color(0xFFEAECF0)),
bottom: BorderSide(width: 1.16, color: Color(0xFFEAECF0)),
),
),
            child: Text(
              data['title'],
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF191D23),
                  ),
            ),
          ),
            SizedBox(height: (Sizing.kSizingMultiple).h),
            
  
     Column(children: List.generate(data['item_list'].length, (index) {
      final result= data['item_list'][index];
      return      Container(
        padding: const EdgeInsets.symmetric(horizontal: 18.57, vertical: 8),
       decoration: BoxDecoration(

border: Border(
// left: BorderSide(color: Color(0xFFEAECF0)),
// top: BorderSide(color: Color(0xFFEAECF0)),
// right: BorderSide(color: Color(0xFFEAECF0)),
bottom: BorderSide(width: 1.16, color: Color(0xFFEAECF0)),
),
),
        child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 SizedBox(
                    width: 120,
                    //height: 120,
                    child: Text(
                      result['item_list_name'],
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF191D23),
                          ),
                    ),
                  ),
          
                    SizedBox(
                    width: 50,
                   // height: 32,
                    child: Text(
                      "\$3,709",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF191D23),
                          ),
                    ),
                  ),
          
                    SizedBox(
                    width: 50,
                    
                    child: Text(
                      "\$3,709",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF191D23),
                          ),
                    ),
                  ),
          
                    SizedBox(
                    width: 50,
                   
                    child: Text(
                      "\$3,709",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF191D23),
                          ),
                    ),
                  ),
                
              ],
            ),
      );
     })
     ,),
       
        ],
      ),
);
    });
    
    
    
  }

  Widget _buildActionButton() {
    return Column(
      children: [
        CustomButton(
          type: ButtonType.regularButton(
              onTap: () {
                context.router.push(const TabRoute());
              },
              label: 'Next',
              isLoadingMode: false,
              backgroundColor: CustomTypography.kPrimaryColorJapa200,
              textColor: CustomTypography.kWhiteColor,
              borderRadius: BorderRadius.all(
                  Radius.circular(Sizing.kBorderRadius * 7.r))),
        ),
      ],
    );
  }
}
