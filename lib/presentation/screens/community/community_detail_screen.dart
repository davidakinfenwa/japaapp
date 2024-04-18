import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/theme/custom_typography.dart';

import 'package:japaapp/core/util/width_constraints.dart';
import 'package:japaapp/presentation/shared/profile_avatar.dart';
import 'package:japaapp/presentation/widget/custom_app_bar.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';

@RoutePage()
class CommunityDetailScreen extends StatefulWidget {
  const CommunityDetailScreen({super.key, required this.title});
  final String title;

  @override
  State<CommunityDetailScreen> createState() => _CommunityDetailScreenState();
}

class _CommunityDetailScreenState extends State<CommunityDetailScreen> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: WidthConstraint(context).withHorizontalSymmetricalPadding(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSalutationSection(),
          _buildBottomSection(),
          Expanded(
            flex: 10,
            child: Stack(
              children: [
                Column(
                  children: [
                    _buildTransactionSetion(),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            // height: 50,
                            margin: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  width: 1.16.w,
                                  color: const Color(0xFFEAECF0),
                                ),
                                //color: Color(0xFF333D56),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0))),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: textEditingController,
                                    cursorColor: Colors.white,
                                    keyboardType: TextInputType.multiline,
                                    minLines: 1,
                                    maxLines: 6,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            color: const Color(0xff344054)),
                                    decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.only(left: 10),
                                        hintText: 'Type your message...',
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: CustomTypography
                                                    .kGreyColorlabel,
                                                fontSize: 13.0.sp),
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 8.0, right: 8.0, bottom: 11.0),
                                  child: Transform.rotate(
                                    angle: -3.14 / 5,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 5.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          // setState(() {
                                          //   messageList.add(
                                          //       MessageData(textEditingController.text, true));
                                          //   textEditingController.clear();
                                          //   scrollAnimation();
                                          // });
                                        },
                                        // onLongPress: () {
                                        //   setState(() {
                                        //     messageList.add(
                                        //         MessageData(textEditingController.text, false));
                                        //     textEditingController.clear();
                                        //     scrollAnimation();
                                        //   });
                                        // },
                                        child: const Icon(
                                          Icons.send,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          margin: const EdgeInsets.only(bottom: 12.0),
                          decoration: ShapeDecoration(
                            color: Color(0xFF18465A),
                            shape: OvalBorder(),
                          ),
                          child: Transform.rotate(
                              angle: 0,
                              child: const Icon(
                                Icons.add,
                                color: Colors.red,
                                size: 25,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),

                // Positioned(
                //   bottom: 0,
                //   child:
                //   )
              ],
            ),
          ),
        ],
      ))),
    );
  }

  Widget _buildSalutationSection() {
    return CustomApbar(
      title: widget.title,
      otherWidget: InkWell(
        onTap: () {},
        child: Icon(
          Icons.more_horiz,
          color: CustomTypography.kPrimaryColor300,
          size: 24,
        ),
      ),
    );
  }

  Widget _buildTransactionSetion() {
    return Expanded(
      child: SingleChildScrollView(
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 20,
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  children: [
                    Container(
                        //padding: EdgeInsets.all(8.h),
                        width: MediaQuery.sizeOf(context).width,
                        decoration: const BoxDecoration(),
                        child: _buildPostSection()),
                    // const Divider(
                    //   thickness: 1,
                    //   color: Color(0xFFC5CACF),
                    // ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  final List<Widget> _imagesh = [
    const ProfileAvatar(
      imageUrl: "assets/images/com14.png",
      radius: 20,
    ),
    const ProfileAvatar(
      imageUrl: "assets/images/com12.png",
      radius: 20,
    ),
    const ProfileAvatar(
      imageUrl: "assets/images/com13.png",
      radius: 20,
    ),
    const ProfileAvatar(
      imageUrl: "assets/images/com14.png",
      radius: 20,
    ),
  ];
  Widget _buildImageListSection() {
    return FlutterImageStack.widgets(
      showTotalCount: true,
      totalCount: _imagesh.length,
      itemRadius: 30, // Radius of each images
      itemCount:
          _imagesh.length, // Maximum number of images to be shown in stack
      itemBorderWidth: 2,
      backgroundColor: Colors.white,
      extraCountTextStyle: const TextStyle(color: Colors.white),
      children: _imagesh, // Border width around the images
    );
  }

  Widget _buildLeftItemBottomSection() {
    return Text(
      "You, John, Alice & 60 others",
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.w500,
          color: CustomTypography.kGreyColor100,
          fontFamily: "inter",
          fontSize: 14.0.sp),
    );
  }

  Widget _buildBottomSection() {
    return Row(
      children: [
        _buildImageListSection(),
        SizedBox(width: (Sizing.kWSpacing4).w),
        _buildLeftItemBottomSection()
      ],
    );
  }

  Widget _buildPostSection() {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const ProfileAvatar(
                  imageUrl: "assets/images/com13.png",
                  radius: 20,
                ),
                SizedBox(width: (Sizing.kWSpacing10).w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Alex Brook",
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: CustomTypography.kBlackColor,
                                  ),
                        ),
                        SizedBox(width: (Sizing.kWSpacing8).w),
                        Text(
                          '10:33 am',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    // color: Color(0xFF929292),
                                    fontSize: 13.sp,
                                    // fontFamily: 'Satoshi',
                                    fontWeight: FontWeight.w500,
                                    height: 0.09,
                                  ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 1.5,
                      child: Text(
                        "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id es officia",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: CustomTypography.kTitleMedium,
                            ),
                      ),
                    ),
                    SizedBox(height: Sizing.kHSpacing12.h),
                    _buildInteractionSection()
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
                //shape: BoxShape.circle,
                color: CustomTypography.kBottomNavColor,
                borderRadius: BorderRadius.circular(Sizing.kAvatarRadius.r)),
            child: Icon(
              Icons.more_horiz,
              color: CustomTypography.kPrimaryColor300,
              size: 16,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInteractionSection() {
    return Container(
      // width: MediaQuery.sizeOf(context).width,
      //olor: Colors.red,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset("assets/svg/thumbsup.svg"),
              SizedBox(width: (Sizing.kWSpacing4).w),
              Text(
                "20 Upvotes",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: CustomTypography.kTitleMedium,
                    fontSize: 10.sp),
              )
            ],
          ),
          SizedBox(width: (Sizing.kWSpacing10).w),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset("assets/svg/thumbsdown.svg"),
              SizedBox(width: (Sizing.kWSpacing4).w),
              Text(
                "20 Downvotes",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: CustomTypography.kTitleMedium,
                    fontSize: 10.sp),
              )
            ],
          ),
          SizedBox(width: (Sizing.kWSpacing10).w),
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset("assets/svg/share.svg"),
              SizedBox(width: (Sizing.kWSpacing4).w),
              Text(
                "Share",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: CustomTypography.kTitleMedium,
                    fontSize: 10.sp),
              )
            ],
          ),
        ],
      ),
    );
  }
}
