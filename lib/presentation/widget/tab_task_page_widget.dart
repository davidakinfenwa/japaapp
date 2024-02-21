import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/presentation/widget/card_widget.dart';


class TabPages extends StatelessWidget {
  TabPages({
    Key? key,
    required this.tabIndex,
  });
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: ListView.builder(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 200),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: tabIndex == 2 ? 1 : 6,
              itemBuilder: (context, index) {
                return tabIndex == 2
                    ? Padding(
                        padding:  EdgeInsets.fromLTRB(0, 100.h, 20.w, 5.h),
                        child: Container(
                          alignment: Alignment.center,
                         
                          child: Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                //crossAxisAlignment: CrossAxisAlignment.sta,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.only(left:20.w),
                                    child: SvgPicture.asset(
                                      "assets/svg/notask.svg",
                                    ),
                                  ),
                        
                                   SizedBox(
                                      height: (Sizing.kSizingMultiple ).h),
                                  Padding(
                                    padding:  EdgeInsets.only(left: 0),
                                    child: Text(
                                      "No Task Yet",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge
                                          ?.copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: CustomTypography.kGreyColor80,
                                              fontFamily: "inter",
                                              fontSize: 16.0.sp),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(
                                      height: (Sizing.kSizingMultiple * 2).h),
                                  Text(
                                    "You dont have any task here",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: CustomTypography.kGreyColor60,
                                            fontFamily: "inter",
                                            fontSize: 12.0.sp),
                                  ),
                                ]),
                          ),
                        ),
                      )
                    : tabIndex == 1 ? GestureDetector(
                        //onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: ((context) => ProductDetail(id: shoe.id, category: shoe.category))),
                        onTap: () {},
                        child: const TaskListItem(),
                      ):GestureDetector(
                        //onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: ((context) => ProductDetail(id: shoe.id, category: shoe.category))),
                        onTap: () {},
                        child: const TaskListItem1(),
                      );
              }))
    ]);
  }
}
