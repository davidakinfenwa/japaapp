import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/route/app_router.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/core/util/width_constraints.dart';
import 'package:japaapp/presentation/screens/profile/provider/account_provider.dart';
import 'package:japaapp/presentation/shared/custom_button.dart';

import 'package:japaapp/presentation/widget/custom_app_bar.dart';

import 'package:japaapp/presentation/widget/input_field_with_label.dart';



@RoutePage()
class AccountWorkPages extends StatefulWidget {
  const AccountWorkPages({super.key});

  @override
  State<AccountWorkPages> createState() => _AccountWorkPagesState();
}

class _AccountWorkPagesState extends State<AccountWorkPages> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _companynameTextFieldController =
      TextEditingController();
  TextEditingController _positionTextFieldController = TextEditingController();
  TextEditingController _gradeTextFieldController = TextEditingController();
  
  DateTime userDOB = DateTime.now();
  String fromDate = '';
  String toDate = '';

  @override
  void initState() {
    super.initState();
    _companynameTextFieldController = TextEditingController();
    _positionTextFieldController = TextEditingController();
    _gradeTextFieldController = TextEditingController();
  }

  @override
  void dispose() {
    _companynameTextFieldController.dispose();
    _positionTextFieldController.dispose();
    _gradeTextFieldController.dispose();
    super.dispose();
  }

    Future<void> _selectDate(BuildContext context, String nav) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (nav == "fromD") {
      if (picked != null && picked != DateTime.now()) {
        String formattedDate = DateFormat('dd MMM yyyy').format(picked);
        setState(() {
          userDOB = picked;
          fromDate = formattedDate;
        });
      }
    } else {
      if (picked != null && picked != DateTime.now()) {
        String formattedDate = DateFormat('dd MMM yyyy').format(picked);
        setState(() {
          userDOB = picked;
          toDate = formattedDate;
        });
      }
    }
  }

  List<Widget> addNewWorkList = [];

  void addNewWorkSection(int index) {
    //  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   setState(() {});
    // });

    // TextEditingController titleController = TextEditingController();
    // TextEditingController amountController = TextEditingController();
    // TextEditingController dateCController = TextEditingController();

    // milestonData[index].amount = amountController.text.replaceAll(",", "");
    // Milestone newMilestone = Milestone(
    //   title: titleController.text,
    //   amount: amountController.text.replaceAll(",", ""),
    //   dueDate: dateCController.text,
    // );

    addNewWorkList.add(Column(
      children: [
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            setState(() {
              addNewWorkList.removeAt(index);
              // if (index >= 0 && index < milestonData.length) {
              //   milestonData.removeAt(index);
              // }

              // titleController.clear();
              // amountController.clear();
              // dateCController.clear();
            });
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Remove Section",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 14.sp,
                      color: Colors.red,
                      fontWeight: FontWeight.w400,
                    ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        _buildCompanyNameTextField(),
        SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
        _buildPositionTextField(),
        SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
        _buildWorkDurationTextField(),
        SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
      ],
    ));
    // milestonData.add(newMilestone);
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
                        //clipBehavior: Clip.antiAliasWithSaveLayer,
                        physics: const BouncingScrollPhysics(),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: (Sizing.kSizingMultiple).h),
                            _buildFormSection(),
                            SizedBox(height: (Sizing.kSizingMultiple * 4).h),
                            _buildActionButton(),
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
      title: 'Work History',
    );
  }

  Widget _buildFormSection() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // _buildLevelofEducationTextField(),
            // SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
            _buildCompanyNameTextField(),
            SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
            _buildPositionTextField(),
            SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
            _buildWorkDurationTextField(),
            SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
            _buildMoreEduDetails()
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyNameTextField() {
    return InputFieldWithLabel(
        hintText: "Name of Company",
        title: "Company",
        validateText: "company name is required",
        controller: _companynameTextFieldController,
        textType: TextInputType.text);
  }

  Widget _buildPositionTextField() {
    return InputFieldWithLabel(
        hintText: "what is your position in the Company",
        title: "Position",
        validateText: "position is required",
        controller: _positionTextFieldController,
        textType: TextInputType.text);
  }

  Widget _buildWorkDurationTextField() {
     return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "From",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: CustomTypography.kGreyColorlabel,
                  ),
            ),
            SizedBox(
              height: Sizing.kHSpacing8 / 2,
            ),
            InkWell(
              onTap: () {
                setState(() {});
                _selectDate(context, "fromD");
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.40.w,
                padding: EdgeInsets.all(10.dm),
                decoration: BoxDecoration(
                  //color: Colors.red,
                  //color: const Color(0xFFF4F4F4),
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(
                    width: 1.w, // Width of the border
                    color: const Color(0xFFB7C6CC),
                  ),
                ),
                height: 44.h,
                child: Padding(
                  padding: EdgeInsets.only(left: 0.0.w, right: 0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //THE CHECKING FOR EMPTY STATE IS REVERS HERE
                      Text(
                        fromDate.isEmpty ? 'MM/YYYY' : fromDate,
                        style: fromDate.isEmpty
                            ? Theme.of(context).textTheme.labelSmall?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: CustomTypography.kGreyColorlabel,
                                fontSize: 13.0.sp)
                            : Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: const Color(0xff344054)),
                      ),
                      Image.asset(
                        'assets/images/datee.png',
                        width: 24,
                        height: 24,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "To",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: CustomTypography.kGreyColorlabel,
                  ),
            ),
            SizedBox(
              height: Sizing.kHSpacing8 / 2,
            ),
            InkWell(
              onTap: () {
                setState(() {});
                // showModalBottomSheet(
                //   context: context,
                //   builder: (context) {
                //     return const MyBottomSheet();
                //   },
                // );
                _selectDate(context, "toD");
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.45.w,
                padding: EdgeInsets.all(10.dm),
                decoration: BoxDecoration(
                  //color: const Color(0xFFF4F4F4),
                  borderRadius: BorderRadius.circular(4.r),
                  border: Border.all(
                    width: 1.w, // Width of the border
                    color: const Color(0xFFB7C6CC),
                  ),
                ),
                height: 44.h,
                child: Padding(
                  padding: EdgeInsets.only(left: 0.0.w, right: 0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        toDate.isEmpty ? 'MM/YYYY' : toDate,
                        style: toDate.isEmpty
                            ? Theme.of(context).textTheme.labelSmall?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: CustomTypography.kGreyColorlabel,
                                fontSize: 13.0.sp)
                            : Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: const Color(0xff344054)),
                      ),
                      Image.asset(
                        'assets/images/datee.png',
                        width: 24,
                        height: 24,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMoreEduDetails() {
    return Column(
      children: [
        Column(
          children: addNewWorkList,
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            setState(() {
              addNewWorkSection(addNewWorkList.length);
            });
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            //mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFF18465A)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Add record +",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontSize: 14.sp,
                      color: const Color(0xFF18465A),
                      fontFamily: "montserratAlternates",
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton() {
    return Column(
      children: [
        CustomButton(
          type: ButtonType.regularButton(
              onTap: () {
                context.router.push(const AccountFamilyRoute());
              },
              label: 'Next',
              isLoadingMode: false,
              backgroundColor: CustomTypography.kPrimaryColor200,
              textColor: CustomTypography.kWhiteColor,
              borderRadius: BorderRadius.all(
                  Radius.circular(Sizing.kBorderRadius * 7.r))),
        ),
      ],
    );
  }
}
