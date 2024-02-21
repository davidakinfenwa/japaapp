import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/route/app_router.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/presentation/shared/profile_avatar.dart';


class DatailSection extends StatefulWidget {
  const DatailSection({
    super.key,
  });

  @override
  State<DatailSection> createState() => _DatailSectionState();
}

class _DatailSectionState extends State<DatailSection> {
  Widget _buildTaskTypeSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Task Type:",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: CustomTypography.kGreyColor60,
                fontFamily: "inter",
                fontSize: 14.0.sp),
          ),
          SizedBox(width: (Sizing.kSizingMultiple * 0.6).w),
          Container(
            padding: EdgeInsets.fromLTRB(12.w, 4.h, 12.w, 4.h),
            // width: 60.w,
            decoration: BoxDecoration(
              color: const Color(0xff5ccecf),
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
            ),
            child: Text(
              'Paid',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: CustomTypography.kGreyColor100,
                  fontFamily: "inter",
                  fontSize: 12.0.sp),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(width: (Sizing.kSizingMultiple * 2.5).w),
          Text(
            "Amount:",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: CustomTypography.kGreyColor60,
                fontFamily: "inter",
                fontSize: 14.0.sp),
          ),
          SizedBox(width: (Sizing.kSizingMultiple * 0.6).w),
          Text.rich(
            TextSpan(
              text: '\$',
              children: [
                TextSpan(
                  text: '120.00',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: CustomTypography.kGreyColor100,
                      fontSize: 14.0.sp),
                ),
              ],
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: CustomTypography.kGreyColor100,
                  fontSize: 14.0.sp),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTimlineSection() {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Timeline",
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: CustomTypography.kGreyColor60,
              fontFamily: "inter",
              fontSize: 14.0.sp),
        ),
      ],
    );
  }

  Widget _buildAttachedTextSection() {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Attached File",
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: CustomTypography.kGreyColor60,
              fontFamily: "inter",
              fontSize: 14.0.sp),
        ),
      ],
    );
  }

  Widget _buildAttachedImageSection() {
    return Row(
      children: [
        Container(
            padding: EdgeInsets.fromLTRB(27.w, 27.h, 27.w, 27.h),
            // width: 60.w,
            decoration: BoxDecoration(
              color: CustomTypography.kGreyColor30,
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
            ),
            child:
                //SvgPicture.asset("assets/svg/camerasnap.svg")
                Icon(Icons.photo,
                    size: Sizing.kHSpacing30,
                    color: CustomTypography.kGreyColor100)
            // Image.asset("assets/images/wallet.png")
            ),
        SizedBox(width: (Sizing.kSizingMultiple * 1.3).w),
        Container(
            padding: EdgeInsets.fromLTRB(27.w, 27.h, 27.w, 27.h),
            // width: 60.w,
            decoration: BoxDecoration(
              color: CustomTypography.kGreyColor30,
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
            ),
            child:
                //SvgPicture.asset("assets/svg/camerasnap.svg")
                Icon(Icons.photo,
                    size: Sizing.kHSpacing30,
                    color: CustomTypography.kGreyColor100)
            // Image.asset("assets/images/wallet.png")
            ),
        SizedBox(width: (Sizing.kSizingMultiple * 1.3).w),
        Container(
            padding: EdgeInsets.fromLTRB(27.w, 27.h, 27.w, 27.h),
            // width: 60.w,
            decoration: BoxDecoration(
              color: CustomTypography.kGreyColor30,
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
            ),
            child:
                //SvgPicture.asset("assets/svg/camerasnap.svg")
                Icon(Icons.photo,
                    size: Sizing.kHSpacing30,
                    color: CustomTypography.kGreyColor100)
            // Image.asset("assets/images/wallet.png")
            ),
        SizedBox(width: (Sizing.kSizingMultiple * 1.3).w)
      ],
    );
  }

  Widget _buildTaskMilestionAndSeeAllSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Task Milestone",
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: CustomTypography.kGreyColor60,
              fontFamily: "inter",
              fontSize: 14.0.sp),
        ),
        Text(
          "See All",
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: CustomTypography.kSecondaryColor,
              fontFamily: "inter",
              fontSize: 14.0.sp),
        ),
      ],
    );
  }

  Widget _buildListOfMilestoneSection() {
    return Column(
      children: [
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset("assets/svg/checkmark-on.svg"),
            SizedBox(
              width: 12.w,
            ),
            SizedBox(
              width: 164.w,
              child: Text(
                "Designed 10 flyers",
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: CustomTypography.kSuccessColor,
                    decoration: TextDecoration.lineThrough,
                    fontFamily: "inter",
                    fontSize: 16.0.sp),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        SizedBox(height: (Sizing.kSizingMultiple).h),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset("assets/svg/checkmark-off.svg"),
            SizedBox(
              width: 12.w,
            ),
            SizedBox(
              width: 164.w,
              child: Text(
                "Add Flyers to social media",
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: CustomTypography.kGreyColor100,
                    //decoration: TextDecoration.lineThrough,
                    fontFamily: "inter",
                    fontSize: 16.0.sp),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPaidAndPendingSection() {
    return Container(
      padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
      decoration: BoxDecoration(
          // color: CustomTypography.kBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
          border: Border.all(
            color: const Color(0xFFE3E7EC), // red as border color
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF5D6976).withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 60.r,
              offset: const Offset(0, 12),
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(8.5.w, 8.h, 8.5.w, 8.h),
                  // width: 60.w,
                  decoration: BoxDecoration(
                    color: CustomTypography.kGreyColor30,
                    borderRadius: BorderRadius.all(Radius.circular(12.r)),
                  ),
                  child: Icon(Icons.library_books,
                      color: CustomTypography.kGreyColor100)
                  // Image.asset("assets/images/wallet.png")
                  ),
              SizedBox(width: (Sizing.kSizingMultiple * 1.3).w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Paid",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: CustomTypography.kGreyColor60,
                        fontFamily: "inter",
                        fontSize: 12.0.sp,
                        height: 0.22,
                        letterSpacing: 0.07),
                  ),
                  SizedBox(height: (Sizing.kSizingMultiple * 2.3).h),
                  Text.rich(
                    TextSpan(
                      text: '\$',
                      children: [
                        TextSpan(
                          text: '50.00',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: CustomTypography.kGreyColor100,
                                  fontSize: 14.0.sp),
                        ),
                      ],
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              fontWeight: FontWeight.w600,
                              color: CustomTypography.kGreyColor100,
                              fontSize: 14.0.sp,
                              height: 0.22,
                              letterSpacing: 0.07),
                    ),
                  )
                ],
              )
            ],
          ),

          //OTHER SECTION HERE
          Row(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(8.5.w, 8.h, 8.5.w, 8.h),
                // width: 60.w,
                decoration: BoxDecoration(
                  color: CustomTypography.kGreyColor30,
                  borderRadius: BorderRadius.all(Radius.circular(12.r)),
                ),
                child: Icon(Icons.library_books,
                    color: CustomTypography.kGreyColor100),
                // Image.asset("assets/images/wallet.png")
              ),
              SizedBox(width: (Sizing.kSizingMultiple * 1.3).w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pending",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: CustomTypography.kGreyColor60,
                        fontFamily: "inter",
                        fontSize: 12.0.sp,
                        height: 0.22,
                        letterSpacing: 0.07),
                  ),
                  SizedBox(height: (Sizing.kSizingMultiple * 2.3).h),
                  Text.rich(
                    TextSpan(
                      text: '\$',
                      children: [
                        TextSpan(
                          text: '50.00',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: CustomTypography.kGreyColor100,
                                  fontSize: 14.0.sp),
                        ),
                      ],
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              fontWeight: FontWeight.w600,
                              color: CustomTypography.kGreyColor100,
                              fontSize: 14.0.sp,
                              height: 0.22,
                              letterSpacing: 0.07),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStartAndEndSection() {
    return Container(
      padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
      decoration: BoxDecoration(
          // color: CustomTypography.kBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
          border: Border.all(
            color: const Color(0xFFE3E7EC), // red as border color
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF5D6976).withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 60.r,
              offset: const Offset(0, 12),
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(8.5.w, 8.h, 8.5.w, 8.h),
                  // width: 60.w,
                  decoration: BoxDecoration(
                    color: CustomTypography.kGreyColor30,
                    borderRadius: BorderRadius.all(Radius.circular(12.r)),
                  ),
                  child: SvgPicture.asset("assets/svg/timecircle.svg")
                  // Icon(Icons.library_books, color: CustomTypography.kGreyColor100)
                  // Image.asset("assets/images/wallet.png")
                  ),
              SizedBox(width: (Sizing.kSizingMultiple * 1.3).w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Start Date",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: CustomTypography.kGreyColor60,
                        fontFamily: "inter",
                        fontSize: 12.0.sp,
                        height: 0.22,
                        letterSpacing: 0.07),
                  ),
                  SizedBox(height: (Sizing.kSizingMultiple * 2.3).h),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'May 19, 2022',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: CustomTypography.kGreyColor100,
                                  fontSize: 14.0.sp),
                        ),
                      ],
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              fontWeight: FontWeight.w600,
                              color: CustomTypography.kGreyColor100,
                              fontSize: 14.0.sp,
                              height: 0.22,
                              letterSpacing: 0.07),
                    ),
                  )
                ],
              )
            ],
          ),

          //OTHER SECTION HERE
          Row(
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(8.5.w, 8.h, 8.5.w, 8.h),
                  // width: 60.w,
                  decoration: BoxDecoration(
                    color: CustomTypography.kGreyColor30,
                    borderRadius: BorderRadius.all(Radius.circular(12.r)),
                  ),
                  child: SvgPicture.asset("assets/svg/timecircle.svg")
                  // Icon(Icons.library_books, color: CustomTypography.kGreyColor100,),
                  // Image.asset("assets/images/wallet.png")
                  ),
              SizedBox(width: (Sizing.kSizingMultiple * 1.3).w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "End Date",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: CustomTypography.kGreyColor60,
                        fontFamily: "inter",
                        fontSize: 12.0.sp,
                        height: 0.22,
                        letterSpacing: 0.07),
                  ),
                  SizedBox(height: (Sizing.kSizingMultiple * 2.3).h),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Jul 19, 2022',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: CustomTypography.kGreyColor100,
                                  fontSize: 14.0.sp),
                        ),
                      ],
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              fontWeight: FontWeight.w600,
                              color: CustomTypography.kGreyColor100,
                              fontSize: 14.0.sp,
                              height: 0.22,
                              letterSpacing: 0.07),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAssignToNameSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Assign To:",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: CustomTypography.kGreyColor60,
                fontFamily: "inter",
                fontSize: 14.0.sp),
          ),
          SizedBox(width: (Sizing.kSizingMultiple * 0.6).w),
          SizedBox(
            width: 149.w,
            child: Text(
              "Tomisin Owonikoko nfnfnfnfnfnfnfnfnfnfnf",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: CustomTypography.kGreyColor100,
                  fontFamily: "inter",
                  fontSize: 14.0.sp),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: (Sizing.kSizingMultiple * 2.5).w),
          ProfileAvatar(
            onTap: () {
              HapticFeedback.vibrate();

              //context.router.push(const UserAccountScreenRoute());
            },
            radius: 20,
            imageUrl: 'assets/images/whiteman.jpg',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildAssignToNameSection(context),
          SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
          _buildTaskTypeSection(),
          SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
          _buildPaidAndPendingSection(),
          SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
          _buildTimlineSection(),
          SizedBox(height: (Sizing.kSizingMultiple * 1).h),
          _buildStartAndEndSection(),
          SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
          _buildTaskMilestionAndSeeAllSection(),
          SizedBox(height: (Sizing.kSizingMultiple * 1).h),
          _buildListOfMilestoneSection(),
          SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
          _buildAttachedTextSection(),
          SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
          _buildAttachedImageSection(),
          SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),

          // SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
        ],
      ),
    );
  }
}

class CommentSection extends StatefulWidget {
  const CommentSection({
    super.key,
  });

  @override
  State<CommentSection> createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  Widget _buildMessageTextField() {
    return TextFormField(
      // controller: _messageTextFieldController,
      textAlignVertical: TextAlignVertical.center,
      // focusNode: _messageTextFieldFocusNode,
      decoration: const InputDecoration(
        hintText: 'Enter Message',
        prefixIcon: Icon(Icons.attachment),
        // border: InputBorder.none,
        // enabledBorder: InputBorder.none,
      ),
      // validator: (value) {
      //   return _messageTextFieldController.text.isEmpty
      //       ? 'Enter message to send!'
      //       : null;
      // },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Sizing.kWSpacing12.h,
          ),
          SizedBox(
            height: 400,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.zero,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ProfileAvatar(
                            onTap: () {
                              HapticFeedback.vibrate();
    
                              //context.router.push(const UserAccountScreenRoute());
                            },
                            radius: 25,
                            imageUrl: 'assets/images/whiteman.jpg',
                          ),
                          Positioned(
                            bottom: 5,
                            right: 0,
                            child: SvgPicture.asset("assets/svg/Dot.svg"),
                          )
                        ],
                      ),
                      SizedBox(
                        width: Sizing.kWSpacing12.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Esther Howard",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: CustomTypography.kGreyColor100,
                                    fontSize: 14.0.sp),
                          ),
                          SizedBox(
                            height: Sizing.kWSpacing8.h,
                          ),
                          Text(
                            "Jul 19, 2022",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: CustomTypography.kGreyColor60,
                                    fontSize: 12.0.sp),
                          ),
                          SizedBox(
                            height: Sizing.kWSpacing8.h,
                          ),
                          Container(
                            width: 250.w,
                            height: 70.h,
                            padding: const EdgeInsets.only(left: 12),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(16),
                                  bottomLeft: Radius.circular(16),
                                  bottomRight: Radius.circular(16)),
                            ),
                            child: const TextField(
                              maxLines: null,
                              decoration: InputDecoration(
                                  hintText:
                                      'Lorem ipsum dolor sit et, consectetur adipiscing.',
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none),
                            ),
                          )
                        ],
                      )
                    ],
                  );
                }),
          ),
    
          _buildMessageTextField(),
        ],
      ),
    );
  }
}

class PaymentSection extends StatefulWidget {
  const PaymentSection({
    super.key,
  });

  @override
  State<PaymentSection> createState() => _PaymentSectionState();
}

class _PaymentSectionState extends State<PaymentSection> {
  final List<Widget> _imagesh = [
    const ProfileAvatar(
      imageUrl: "assets/images/whiteman.jpg",
      radius: 20,
    ),
    const ProfileAvatar(
      imageUrl: "assets/images/whiteman.jpg",
      radius: 20,
    ),
    const ProfileAvatar(
      imageUrl: "assets/images/whiteman.jpg",
      radius: 20,
    ),
    const ProfileAvatar(
      imageUrl: "assets/images/whiteman.jpg",
      radius: 20,
    ),
  ];
  Widget _buildImageListSection() {
    return FlutterImageStack.widgets(
      showTotalCount: true,
      totalCount: 2,
      itemRadius: 30, // Radius of each images
      itemCount: 2, // Maximum number of images to be shown in stack
      itemBorderWidth: 0,
      backgroundColor: Colors.black,
      extraCountTextStyle: const TextStyle(color: Colors.white),
      children: _imagesh, // Border width around the images
    );
  }

  Widget _buildLeftItemBottomSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(width: (Sizing.kWSpacing10).w),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset("assets/svg/paperplus.svg"),
            SizedBox(width: (Sizing.kWSpacing4).w),
            Text(
              "5",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: CustomTypography.kGreyColor100,
                  fontFamily: "inter",
                  fontSize: 14.0.sp),
            )
          ],
        ),
        SizedBox(width: (Sizing.kWSpacing10).w),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset("assets/svg/timecircle.svg"),
            SizedBox(width: (Sizing.kWSpacing4).w),
            Text(
              "7 days",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: CustomTypography.kGreyColor100,
                  fontFamily: "inter",
                  fontSize: 14.0.sp),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildBottomSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_buildImageListSection(), _buildLeftItemBottomSection()],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          context.router.push(const TaskDetailRoute());
        });
      },
      child: Container(
        // width: MediaQuery.sizeOf(context).width * 0.80.w,
        // height: MediaQuery.sizeOf(context).height * 0.20.h,
        margin: const EdgeInsets.fromLTRB(0, 10, 10, 5),
        decoration: BoxDecoration(
            color: CustomTypography.kWhiteColor,
            borderRadius: BorderRadius.all(Radius.circular(16.r)),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF5D6976).withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 60.r,
                offset: const Offset(0, 12),
              )
            ]),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(12.w, 4.h, 12.w, 4.h),
                    width: 60.w,
                    decoration: BoxDecoration(
                      color: const Color(0xff5ccecf),
                      borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    ),
                    child: Text(
                      'High',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: CustomTypography.kGreyColor100,
                              fontFamily: "inter",
                              fontSize: 12.0.sp),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: null,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.60.w,
                    child: Text(
                      "Navigation issue in the Milestone",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: CustomTypography.kGreyColor100,
                              fontFamily: "inter",
                              fontSize: 18.0.sp),
                    ),
                  ),
                  SizedBox(height: (Sizing.kSizingMultiple * 2).h),
                  _buildBottomSection(),
                  SizedBox(height: (Sizing.kSizingMultiple * 1.2).h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
