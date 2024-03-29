// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/core/route/app_router.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/core/util/snackbar_util.dart';
import 'package:japaapp/core/util/width_constraints.dart';
import 'package:file_picker/file_picker.dart';
import 'package:japaapp/presentation/shared/custom_button.dart';
import 'package:japaapp/presentation/widget/bottom_sheet_item.dart';
import 'package:japaapp/presentation/widget/custom_app_bar.dart';
import 'package:japaapp/presentation/widget/form_field.dart';
import 'package:japaapp/presentation/widget/input_field_with_label.dart';
import 'package:japaapp/presentation/widget/item_with_dropdown.dart';
import 'package:japaapp/presentation/widget/upload_doc_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:japaapp/presentation/widget/uploaded_document.dart';

@RoutePage()
class AccountEducationPages extends StatefulWidget {
  const AccountEducationPages({super.key});

  @override
  State<AccountEducationPages> createState() => _AccountEducationPagesState();
}

class _AccountEducationPagesState extends State<AccountEducationPages> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _institutionTextFieldController =
      TextEditingController();
  TextEditingController _majorTextFieldController = TextEditingController();
  TextEditingController _gradeTextFieldController = TextEditingController();
  TextEditingController _levelofEuducationTextController =
      TextEditingController();
  TextEditingController _scalePointTextController = TextEditingController();

  DateTime userDOB = DateTime.now();
  String fromDate = '';
  String toDate = '';

  @override
  void initState() {
    super.initState();
    _institutionTextFieldController = TextEditingController();
    _majorTextFieldController = TextEditingController();
    _gradeTextFieldController = TextEditingController();
    _levelofEuducationTextController = TextEditingController();
    _scalePointTextController = TextEditingController();
  }

  @override
  void dispose() {
    _institutionTextFieldController.dispose();
    _majorTextFieldController.dispose();
    _gradeTextFieldController.dispose();
    _levelofEuducationTextController.dispose();
    _scalePointTextController.dispose();
    super.dispose();
  }

   var imagename = "";
  var imageSize = 0;
  var imagePath = "";
   File? imageFile;
 

  Future<File> _getSingleFileFromDevice() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xls',
          'xlsx',
          'csv',
          'pdf',
          'docx',
          'doc',
          'jpg',
          'jpeg',
          'png'
        
      ],
    );

    if (result == null) {
      SnackBarUtil.snackbarError(context,
          code: ExceptionCode.EXISTING, message: "Sorry, No file selected");
      throw Exception();
    }
    setState(() {
      imagename = result.files.single.name;
      imagePath = result.files.single.path!;
      imageSize = result.files.single.size;
    });
    //imageUrl = Document.fromFile(File(result.files.single.name));

    return File(result.files.single.path!);
  }

  Future<void> _getImageFile() async {
    File? pickedFile = await _getSingleFileFromDevice();
    setState(() {
      imageFile = pickedFile;
    });
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
    TextEditingController _institutionTextFieldController =
        TextEditingController();
    TextEditingController _majorTextFieldController = TextEditingController();
    TextEditingController _gradeTextFieldController = TextEditingController();
    TextEditingController _levelofEuducationSelTextController =
        TextEditingController();
    TextEditingController _scalePointTextController = TextEditingController();

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
                SizedBox(height: (Sizing.kSizingMultiple * 3).h),
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
    return CustomApbar(
      onTapExit: (){Navigator.pop(context);},
      title: 'Education',
      otherWidget: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return StatefulBuilder(builder: (context,changer){
                return Dialog(
                
                surfaceTintColor: Colors.transparent,
                elevation: 0,
                backgroundColor: Colors.white,
                insetPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: MediaQuery.of(context).size.height * 0.3),
                shadowColor: null,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: SvgPicture.asset("assets/svg/dash.svg"
                                // width: 340.w,
                                ),
                          ),
                          Text(
                            "upload resume",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.0.sp),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: SvgPicture.asset("assets/svg/dash.svg"
                                // width: 340.w,
                                ),
                          ),
                        ],
                      ),
                      SizedBox(height: Sizing.kSizingMultiple*2.h,),

                      DottedBorder(
                        color: Colors.black,
                        strokeWidth: 1,
                        child: 
                        imagename.isNotEmpty?
                                UploadedDocumentWidget(
                                    imageName: imagename,
                                    imageSize: imageSize,
                                    imagePath: imageFile,
                                    onDelete: () {
                                      // Update state to clear the image path
                                      setState(() {
                                       // widget.data?.projectAttachment.fileName="";
                                        imagename = ""; // clear the image path
                                      });
                                    }):
                         UploadDocUi(getFilePopUp:_getImageFile),
                      ),
                      SizedBox(height: Sizing.kSizingMultiple*2.h,),
                      CustomButton(
                        type: ButtonType.regularButton(
                            onTap: () {
                              context.router.pop();
                            },
                            label: 'Upload',
                            isLoadingMode: false,
                            backgroundColor:
                                CustomTypography.kPrimaryColor200,
                            textColor: CustomTypography.kWhiteColor,
                            borderRadius: BorderRadius.all(
                                Radius.circular(Sizing.kBorderRadius * 7.r))),
                      ),
                    ],
                  ),
                ),
              );
              });
            },
          );
        },
        icon: const Icon(
          Icons.file_upload,
          color: Color(0xFF344054),
        ),
      ),
    );
  }

  Widget _buildFormSection() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
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
        ),
      ),
    );
  }

  Widget _buildLevelofEducationTextField() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    return ItemWithDropDown(
        title: "Level of education",
        suffixIcon: 'assets/images/dropdown.png',
        hintText: "Select Educational Level",
        
        bottomSheet: MyBottomSheet(
            // providerData:
            //     Provider.of<AccountPageProvider>(context, listen: false)
            //         .educationType,
            onItemSelected: (String value) {
          // Assign the value to the desired controller
          _levelofEuducationTextController.text = value;
        }),
        controller: _levelofEuducationTextController);
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
    return InputFieldWithLabel(
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
                context.router.push(const AccountWorkRoutes());
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
