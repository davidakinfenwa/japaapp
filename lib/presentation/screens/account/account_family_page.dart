import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/route/app_router.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/core/util/width_constraints.dart';
import 'package:japaapp/presentation/shared/custom_button.dart';
import 'package:japaapp/presentation/widget/bottom_sheet_item.dart';
import 'package:japaapp/presentation/widget/custom_app_bar.dart';
import 'package:japaapp/presentation/widget/form_field.dart';
import 'package:japaapp/presentation/widget/input_field_with_label.dart';
import 'package:japaapp/presentation/widget/item_with_dropdown.dart';


@RoutePage()
class AccountFamilyPage extends StatefulWidget {
  const AccountFamilyPage({super.key});

  @override
  State<AccountFamilyPage> createState() => _AccountFamilyPageState();
}

class _AccountFamilyPageState extends State<AccountFamilyPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _institutionTextFieldController =
      TextEditingController();

  TextEditingController _maritalTextController = TextEditingController();
  TextEditingController _majorTextFieldController = TextEditingController();
  TextEditingController _gradeTextFieldController = TextEditingController();
  TextEditingController _scalePointTextController = TextEditingController();
  TextEditingController _levelofEuducationSelTextController =TextEditingController();
  TextEditingController _spouseFirstNameTextFieldController =TextEditingController();
  TextEditingController _spouseLastNameTextFieldController =TextEditingController();
  TextEditingController _spouseNumberOfChildrenTextFieldController =TextEditingController();
  TextEditingController _spouseOtherNameTextFieldController =TextEditingController();
    TextEditingController _companynameTextFieldController = TextEditingController();
  TextEditingController _positionTextFieldController = TextEditingController();
  // TextEditingController _gradeTextFieldController = TextEditingController();

  DateTime userDOB = DateTime.now();
  String fromDate = '';
  String toDate = '';

  @override
  void initState() {
    super.initState();
    _institutionTextFieldController = TextEditingController();
    _majorTextFieldController = TextEditingController();
    _gradeTextFieldController = TextEditingController();
    _maritalTextController = TextEditingController();
    _scalePointTextController = TextEditingController();
    _levelofEuducationSelTextController = TextEditingController();
    _spouseFirstNameTextFieldController=TextEditingController();
    _spouseLastNameTextFieldController=TextEditingController();
    _spouseNumberOfChildrenTextFieldController=TextEditingController();
    _spouseOtherNameTextFieldController=TextEditingController();
    _companynameTextFieldController=TextEditingController();
    _positionTextFieldController=TextEditingController();
    
  }

  @override
  void dispose() {
    _institutionTextFieldController.dispose();
    _majorTextFieldController.dispose();
    _gradeTextFieldController.dispose();
    _maritalTextController.dispose();
    _scalePointTextController.dispose();
    _levelofEuducationSelTextController.dispose();
    _spouseFirstNameTextFieldController.dispose();
    _spouseLastNameTextFieldController.dispose();
    _spouseNumberOfChildrenTextFieldController.dispose();
    _spouseOtherNameTextFieldController.dispose();
    _companynameTextFieldController.dispose(); 
    _positionTextFieldController.dispose(); 
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

  List<Widget> addMilestoneList = [];

  void addNewEducationSection(int index) {
    //  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   setState(() {});
    // });

    TextEditingController _levelofEuducationSelTextController =
        TextEditingController();
    TextEditingController _scalePointTextController = TextEditingController();
    // TextEditingController dateCController = TextEditingController();

    // milestonData[index].amount = amountController.text.replaceAll(",", "");
    // Milestone newMilestone = Milestone(
    //   title: titleController.text,
    //   amount: amountController.text.replaceAll(",", ""),
    //   dueDate: dateCController.text,
    // );

    addMilestoneList.add(Column(
      children: [
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            setState(() {
              addMilestoneList.removeAt(index);
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
        ItemWithDropDown(
          title: "Level of education",
          suffixIcon: 'assets/images/dropdown.png',
          hintText: "Select Educational Level",
          controller: _levelofEuducationSelTextController,
          bottomSheet: MyBottomSheet(onItemSelected: (String value) {
            // Assign the value to the desired controller
            _levelofEuducationSelTextController.text = value;
          }),
        ),
        SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
        _buildInstitutionTextField(),
        SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
        _buildMajorTextField(),
        SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ItemWithDropDown(
                  title: "Scale point",
                  suffixIcon: 'assets/images/dropdown.png',
                  hintText: "Select scale point",
                  bottomSheet:
                      MyBottomSheetScalePoint(onItemSelected: (String value) {
                    // Assign the value to the desired controller
                    _scalePointTextController.text = value;
                  }),
                  controller: _scalePointTextController),
            ),
            const SizedBox(
              width: Sizing.kSizingMultiple,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Grade",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: CustomTypography.kGreyColorlabel,
                      ),
                ),
                SizedBox(
                  height: Sizing.kHSpacing8 / 2,
                ),
                FormFieldInputHalf(
                  controller: _gradeTextFieldController,
                  textInputType: TextInputType.number,
                  hint: 'Grade point',
                  validate: (value) {
                    return _gradeTextFieldController.text.isEmpty
                        ? 'Grade is required!'
                        : null;
                  },
                )
              ],
            ),
          ],
        ),
        SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
        _buildEducationDurationTextField(),
        SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
      ],
    ));
    // milestonData.add(newMilestone);
  }



//-------------THIS IS TO ADD NEW WORK LIST -------------------------//
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
                        physics: const BouncingScrollPhysics(),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: (Sizing.kSizingMultiple).h),
                            _buildMarriedStatusTextField(),
                            SizedBox(height: (Sizing.kSizingMultiple).h),
                           _maritalTextController.text!="Single"? _buildFormSection():SizedBox(),
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
      title: 'Family',
    );
  }

  Widget _buildFormSection() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
             //SizedBox(height: (Sizing.kSizingMultiple).h),
            _buildSpouseBasicInfoSection(),
            SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
            _buildSpouseEducationSection(),
            SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
            _buildWorkFormSection()

          ],
        ),
      ),
    );
  }


    Widget _buildSpouseBasicInfoSection() {
    return Column(
      children: [
        _buildSpouseFirstNameTextField(),
        SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
        _buildSpouseLastNameTextField(),
        SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
        _buildSpouseOtherNameTextField(),
        SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
        _buildNoOfChildrenTextField(),
       
      ],
    );
  }

  Widget _buildSpouseEducationSection(){
     return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
       children: [
            Text(
         "Spouse: Educational History ",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: Color(0xFF191D23),
              ),
        ),
         SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
         _buildLevelofEducationTextField(),
         SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
         _buildInstitutionTextField(),
         SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
         _buildMajorTextField(),
         SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
         _buildEducationGradeTextField(),
         SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
         _buildEducationDurationTextField(),
         SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
         _buildMoreEduDetails()
       ],
     );
  }

  Widget _buildMarriedStatusTextField() {
    return ItemWithDropDown(
        title: "Relationship Type",
        suffixIcon: 'assets/images/dropdown.png',
        hintText: "Select family",
       
        bottomSheet: MyBottomMaritalSheet( 
                onItemSelected: (String value) {
                  // Assign the value to the desired controller
                  setState(() {
                    
                  _maritalTextController.text = value;
                  });
                }),
        controller: _maritalTextController);
  }

 Widget _buildSpouseFirstNameTextField() {
    return InputFieldWithLabel(
        hintText: "Enter spouse first name",
        title: "Spouse first name",
        validateText: "first name is required",
        controller: _spouseFirstNameTextFieldController,
        textType: TextInputType.text);

  }
  
   Widget _buildSpouseLastNameTextField() {
    return InputFieldWithLabel(
        hintText: "Enter last name",
        title: "Spouse last name",
        validateText: "last name is required",
        controller: _spouseLastNameTextFieldController,
        textType: TextInputType.text);

  }

   Widget _buildSpouseOtherNameTextField() {
    return InputFieldWithLabel(
        hintText: "Enter other names",
        title: "Spouse other names",
        validateText: "other is required",
        controller: _spouseOtherNameTextFieldController,
        textType: TextInputType.text);

  }

   Widget _buildNoOfChildrenTextField() {
    return InputFieldWithLabel(
        hintText: "Enter no of children",
        title: "Number of children",
        validateText: "children is required",
        controller: _spouseNumberOfChildrenTextFieldController,
        textType: TextInputType.text);

  }
  Widget _buildLevelofEducationTextField() {
    return ItemWithDropDown(
      title: "Level of education",
      suffixIcon: 'assets/images/dropdown.png',
      hintText: "Select Educational Level",
      controller: _levelofEuducationSelTextController,
      bottomSheet: MyBottomSheet(onItemSelected: (String value) {
        // Assign the value to the desired controller
        _levelofEuducationSelTextController.text = value;
      }),
    );
  }

  Widget _buildInstitutionTextField() {
    return InputFieldWithLabel(
        hintText: "Name of institution",
        title: "Institution",
        validateText: "institution is required",
        controller: _institutionTextFieldController,
        textType: TextInputType.text);

  }

  Widget _buildMajorTextField() {
    return   InputFieldWithLabel(
        hintText: "Whats your major",
        title: "Major",
        validateText: "Major is required",
        controller: _majorTextFieldController,
        textType: TextInputType.text);

  }

  Widget _buildEducationGradeTextField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ItemWithDropDown(
              title: "Scale point",
              suffixIcon: 'assets/images/dropdown.png',
              hintText: "Select scale point",
              bottomSheet:
                  MyBottomSheetScalePoint(onItemSelected: (String value) {
                // Assign the value to the desired controller
                _scalePointTextController.text = value;
              }),
              controller: _scalePointTextController),
        ),
        const SizedBox(
          width: Sizing.kSizingMultiple,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Grade",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: CustomTypography.kGreyColorlabel,
                  ),
            ),
            SizedBox(
              height: Sizing.kHSpacing8 / 2,
            ),
            FormFieldInputHalf(
              controller: _gradeTextFieldController,
              textInputType: TextInputType.number,
              hint: 'Grade point',
              validate: (value) {
                return _gradeTextFieldController.text.isEmpty
                    ? 'Grade is required!'
                    : null;
              },
            )
          ],
        ),
      ],
    );
  }

  Widget _buildEducationDurationTextField() {
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
          children: addMilestoneList,
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            setState(() {
              addNewEducationSection(addMilestoneList.length);
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



  Widget _buildWorkFormSection() {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children: [
          Text(
         "Spouse: Work History ",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: Color(0xFF191D23),
              ),
        ),
        // SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
        _buildCompanyNameTextField(),
        SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
        _buildPositionTextField(),
        SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
        _buildWorkDurationTextField(),
        SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
        _buildMoreWorkDetails()
      ],
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

  Widget _buildMoreWorkDetails() {
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
                context.router.push(const AccountAwardRoutes());
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
