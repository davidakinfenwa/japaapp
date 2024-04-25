import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:japaapp/business/blocs/account_bloc/create_family_info_form_cubit.dart';
import 'package:japaapp/business/blocs/account_bloc/create_education_info_form_cubit.dart';
import 'package:japaapp/business/blocs/account_bloc/create_work_info_form_cubit.dart';
import 'package:japaapp/business/blocs/account_bloc/get_user_drop_down_form_cubit.dart';
import 'package:japaapp/business/blocs/bloc_state.dart';
import 'package:japaapp/business/snapshot_cache/snapshot_cache.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/dependence/dependence.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/core/route/app_router.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/core/util/snackbar_util.dart';
import 'package:japaapp/core/util/width_constraints.dart';
import 'package:japaapp/domain/form_params/form_params.dart';
import 'package:japaapp/domain/model/account/compound_user_info_model.dart';
import 'package:japaapp/domain/model/models.dart';
import 'package:japaapp/presentation/shared/custom_button.dart';
import 'package:japaapp/presentation/widget/bottom_sheet_item.dart';
import 'package:japaapp/presentation/widget/custom_app_bar.dart';
import 'package:japaapp/presentation/widget/form_field.dart';
import 'package:japaapp/presentation/widget/input_field_with_label.dart';
import 'package:japaapp/presentation/widget/item_with_dropdown.dart';

@RoutePage()
class AccountFamilyPage extends StatefulWidget implements AutoRouteWrapper {
  const AccountFamilyPage({super.key});

  @override
  State<AccountFamilyPage> createState() => _AccountFamilyPageState();

  @override
  Widget wrappedRoute(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider<CreateFamilyInformationCubit>(
          create: (context) => getIt<CreateFamilyInformationCubit>(),
        ),
        BlocProvider<CreateEducationInformationCubit>(
          create: (context) => getIt<CreateEducationInformationCubit>(),
        ),
        BlocProvider<GetUserDropdownFormCubit>(
          create: (context) =>
              getIt<GetUserDropdownFormCubit>()..userDropdownData(),
        ),
        BlocProvider<CreateWorkInformationCubit>(
          create: (context) => getIt<CreateWorkInformationCubit>(),
        ),
        // BlocProvider<CreateBasicInformationCubit>(
        //   create: (context) => getIt<CreateBasicInformationCubit>(),
        // ),
      ],
      child: this,
    );
  }
}

class _AccountFamilyPageState extends State<AccountFamilyPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _institutionTextFieldController = TextEditingController();
  TextEditingController _maritalTextController = TextEditingController();
  TextEditingController _majorTextFieldController = TextEditingController();
  TextEditingController _gradeTextFieldController = TextEditingController();
  TextEditingController _scalePointTextController = TextEditingController();
  TextEditingController _levelofEuducationSelTextController =  TextEditingController();
  TextEditingController _spouseFirstNameTextFieldController = TextEditingController();
  TextEditingController _spouseLastNameTextFieldController = TextEditingController();
  TextEditingController _spouseNumberOfChildrenTextFieldController = TextEditingController();
  TextEditingController _spouseOtherNameTextFieldController = TextEditingController();
  TextEditingController _companynameTextFieldController =TextEditingController();
  TextEditingController _positionTextFieldController = TextEditingController();
  // TextEditingController _gradeTextFieldController = TextEditingController();

  DateTime userDOBEdu1 = DateTime.now();
  DateTime userDOBEdu2 = DateTime.now();
  DateTime userDOBWork1 = DateTime.now();
  DateTime userDOBWork2 = DateTime.now();
  String fromDateEdu = '';
  String toDateEdu = '';
  String fromDateWork = '';
  String toDateWork = '';

  @override
  void initState() {
    super.initState();
    _institutionTextFieldController = TextEditingController();
    _majorTextFieldController = TextEditingController();
    _gradeTextFieldController = TextEditingController();
    _maritalTextController = TextEditingController();
    _scalePointTextController = TextEditingController();
    _levelofEuducationSelTextController = TextEditingController();
    _spouseFirstNameTextFieldController = TextEditingController();
    _spouseLastNameTextFieldController = TextEditingController();
    _spouseNumberOfChildrenTextFieldController = TextEditingController();
    _spouseOtherNameTextFieldController = TextEditingController();
    _companynameTextFieldController = TextEditingController();
    _positionTextFieldController = TextEditingController();
  }

   
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final userData=context.read<AccountSnapshotCache>().userInfo.data.familyStructure.family;
    if (userData.isNotEmpty) {
    _maritalTextController = TextEditingController(text: userData[0].maritalStatus);
    _spouseFirstNameTextFieldController = TextEditingController(text: userData[0].firstName);
    _spouseLastNameTextFieldController = TextEditingController(text: userData[0].surname);
    _spouseNumberOfChildrenTextFieldController = TextEditingController(text: userData[0].numberOfChildren);
    _spouseOtherNameTextFieldController = TextEditingController(text: userData[0].otherName);
    } else {
      
    }
    final userInfo = context.read<AccountSnapshotCache>().userInfo.data.familyStructure.familyeducation;
        print(userInfo);
        
        if (userInfo.isNotEmpty) {
      for (var i = 1; i < userInfo.length; i++) {
      addNewEducationSection(i+1, userInfo[i]);
    }
    _institutionTextFieldController = TextEditingController(text: userInfo[0].institution);
    _majorTextFieldController = TextEditingController(text: userInfo[0].major);
    _gradeTextFieldController = TextEditingController(text: userInfo[0].grade);
    _levelofEuducationSelTextController = TextEditingController(text: userInfo[0].levelOfEducation);
    _scalePointTextController = TextEditingController(text: userInfo[0].scale);

   }
        else{
          print('userInfo is empty');
        }

      final userInfoWork = context.read<AccountSnapshotCache>().userInfo.data.familyStructure.familywork;
        print(userInfo);
     
    if (userInfoWork.isNotEmpty) {
    for (var i = 1; i < userInfoWork.length; i++) {
      addNewWorkSection(i+1, userInfoWork[i]);
    }
      _companynameTextFieldController = TextEditingController(text: userInfoWork[0].companyName);
    _positionTextFieldController = TextEditingController(text: userInfoWork[0].position);
   
  } else {
    // Handle the case when userInfo is empty
    print('userInfo is empty');
  }
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

  List<Widget> addEducationList = [];
  List<EducationFamily> educationDataList = [];
  void addFirstDefaultEducation() {
    EducationFamily defaultMilestone = EducationFamily(
        levelEducation: _levelofEuducationSelTextController.text,
        institution: _institutionTextFieldController.text,
        fromDate: userDOBEdu1,
        toDate: userDOBEdu2,
        major: _majorTextFieldController.text,
        scale: _scalePointTextController.text,
        grade: _gradeTextFieldController.text,
        isStillInschool: false);
    ;
    if (defaultMilestone.levelEducation.isNotEmpty) {
      educationDataList.insert(0, defaultMilestone);
    } else {}
  }

  List<Widget> addNewWorkList = [];
  List<WorkFamily> workDataList = [];
  void addFirstDefaultWork() {
    WorkFamily defaultMilestone = WorkFamily(
        companyName: _companynameTextFieldController.text,
        position: _positionTextFieldController.text,
        dateFrom: userDOBWork1,
        dateTo: userDOBWork2,
        isCurrentWork: false);
    if (defaultMilestone.companyName.isNotEmpty) {
      workDataList.insert(0, defaultMilestone);
    } else {}
  }

  Future<void> _selectDate(BuildContext context, String nav) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (nav == "fromDEdu") {
      if (picked != null && picked != DateTime.now()) {
        String formattedDate = DateFormat('MMM yyyy').format(picked);
        setState(() {
          userDOBEdu1 = picked;
          fromDateEdu = formattedDate;
        });
      }
    } else if (nav == "toDEdu") {
      if (picked != null && picked != DateTime.now()) {
        String formattedDate = DateFormat('MMM yyyy').format(picked);
        setState(() {
          userDOBEdu2 = picked;
          toDateEdu = formattedDate;
        });
      }
    } else if (nav == "fromDWork") {
      if (picked != null && picked != DateTime.now()) {
        String formattedDate = DateFormat('MMM yyyy').format(picked);
        setState(() {
          userDOBWork1 = picked;
          fromDateWork = formattedDate;
        });
      }
    } else if (nav == "toDWork") {
      if (picked != null && picked != DateTime.now()) {
        String formattedDate = DateFormat('MMM yyyy').format(picked);
        setState(() {
          userDOBWork2 = picked;
          toDateWork = formattedDate;
        });
      }
    }
  }

  void addNewEducationSection(int index, FamilyEducation edu) {
    TextEditingController gradeTextListFieldController = TextEditingController(text: edu.grade);
    TextEditingController institutionListTextFieldController = TextEditingController(text: edu.institution);
    TextEditingController levelofEuducationSelTextController = TextEditingController(text: edu.levelOfEducation);
    TextEditingController scalePointListTextController =TextEditingController(text: edu.scale);
    TextEditingController majorTextListFieldController = TextEditingController(text: edu.major);
    TextEditingController fromDateFieldController =  TextEditingController(text: edu.fromDate.toString());
    TextEditingController toDateFieldController = TextEditingController(text: edu.toDate.toString());

    DateTime userDOB1 = DateTime.now();
    DateTime userDOB2 = DateTime.now();
    String fromDateList = '';
    String toDateList = '';
    void _selectDateListe(String nav) async {
      DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );

      if (nav == "fromD") {
        if (picked != null && picked != DateTime.now()) {
          String formattedDate = DateFormat('MMM yyyy').format(picked);
          setState(() {
            userDOB1 = picked;
            fromDateList = formattedDate;
            fromDateFieldController.text = formattedDate;
            print(fromDateList);
            educationDataList[index].fromDate = userDOB1;
          });
        }
      } else {
        if (picked != null && picked != DateTime.now()) {
          String formattedDate = DateFormat('MMM yyyy').format(picked);
          setState(() {
            userDOB2 = picked;
            toDateList = formattedDate;
            toDateFieldController.text = formattedDate;
            educationDataList[index].toDate = userDOB2;
          });
        }
      }
    }

    EducationFamily eduFormData = EducationFamily(
        levelEducation: levelofEuducationSelTextController.text,
        institution: institutionListTextFieldController.text,
        fromDate: userDOB1,
        toDate: userDOB2,
        major: majorTextListFieldController.text,
        scale: scalePointListTextController.text,
        grade: gradeTextListFieldController.text,
        isStillInschool: false);
    addEducationList.add(Column(
      children: [
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            setState(() {
              addEducationList.removeAt(index);
              if (index >= 0 && index < educationDataList.length) {
                educationDataList.removeAt(index);
              }
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
        BlocConsumer<GetUserDropdownFormCubit,
            BlocState<Failure<ExceptionMessage>, ProfileDropDownModel>>(
          listener: (context, state) {
            state.maybeMap(
              orElse: () => null,
              success: (state) {
                context.read<AccountSnapshotCache>().notifyAllListeners();
              },
            );
          },
          builder: (context, state) {
            return ItemWithDropDown(
                title: "Level of education",
                suffixIcon: 'assets/images/dropdown.png',
                hintText: "Select Educational Level",
                bottomSheet: MyBottomSheet(
                    onItemSelected: (String value) {
                      // Assign the value to the desired controller
                      levelofEuducationSelTextController.text = value;
                      setState(() {
                        if (index >= 0 && index < educationDataList.length) {
                          educationDataList[index].levelEducation =
                              value.toString();
                        }
                      });
                    },
                    state: state),
                controller: levelofEuducationSelTextController);
          },
        ),
        SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),

        InputFieldWithLabel(
          hintText: "Name of institution",
          title: "Institution",
          validateText: "institution is required",
          controller: institutionListTextFieldController,
          textType: TextInputType.text,
          onChanged: (value) {
            setState(() {
              if (index >= 0 && index < educationDataList.length) {
                educationDataList[index].institution = value.toString();
              }
            });
          },
        ),

        SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),

        InputFieldWithLabel(
          hintText: "Whats your major",
          title: "Major",
          validateText: "Major is required",
          controller: majorTextListFieldController,
          textType: TextInputType.text,
          onChanged: (value) {
            setState(() {
              if (index >= 0 && index < educationDataList.length) {
                educationDataList[index].major = value.toString();
              }
            });
          },
        ),

        //  _buildMajorTextField(),
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
                    scalePointListTextController.text = value;
                    setState(() {
                      if (index >= 0 && index < educationDataList.length) {
                        educationDataList[index].scale = value.toString();
                      }
                    });
                  }),
                  controller: scalePointListTextController),
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
                  controller: gradeTextListFieldController,
                  textInputType: TextInputType.number,
                  hint: 'Grade point',
                  onChanged: (value) {
                    if (index >= 0 && index < educationDataList.length) {
                      educationDataList[index].grade = value.toString();
                    }
                  },
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
        Row(
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
                  },
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.40.w,
                    child: FormFieldInput(
                      suffixIcon: Image.asset(
                        'assets/images/datee.png',
                        width: 24,
                        height: 24,
                      ),
                      readOnly: true,
                      hint: "MM/YYYY",
                      controller: fromDateFieldController,
                      onChanged: (value) {
                        print(DateTime.parse(value.toString()));
                        if (index >= 0 && index < educationDataList.length) {
                          educationDataList[index].fromDate =
                              DateTime.parse(value.toString());
                        }
                      },
                      onTap: () {
                        _selectDateListe("fromD");
                      },
                      // onTapData: ,
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
                  },
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.40.w,
                    child: FormFieldInput(
                      suffixIcon: Image.asset(
                        'assets/images/datee.png',
                        width: 24,
                        height: 24,
                      ),
                      readOnly: true,
                      hint: "MM/YYYY",
                      controller: toDateFieldController,
                      onChanged: (value) {
                        print(DateTime.parse(value.toString()));
                        if (index >= 0 && index < educationDataList.length) {
                          educationDataList[index].toDate =
                              DateTime.parse(value.toString());
                        }
                      },
                      onTap: () {
                        _selectDateListe("toD");
                      },
                      // onTapData: ,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
      ],
    ));
    educationDataList.add(eduFormData);
  }

//-------------THIS IS TO ADD NEW WORK LIST -------------------------//

  void addNewWorkSection(int index, FamilyWork workUser) {
    //  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   setState(() {});
    // });
    TextEditingController _companynameListTextFieldController = TextEditingController(text: workUser.companyName);
    TextEditingController _positionListTextFieldController =TextEditingController(text: workUser.position);
    TextEditingController fromDateFieldController = TextEditingController(text: workUser.dateFrom.toString());
    TextEditingController toDateFieldController = TextEditingController(text: workUser.dateTo.toString());
    DateTime userDOB1 = DateTime.now();
    DateTime userDOB2 = DateTime.now();
    String fromDateList = '';
    String toDateList = '';
    void _selectDateListe(String nav) async {
      DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );

      if (nav == "fromD") {
        if (picked != null && picked != DateTime.now()) {
          String formattedDate = DateFormat('MMM yyyy').format(picked);
          setState(() {
            userDOB1 = picked;
            fromDateList = formattedDate;
            fromDateFieldController.text = formattedDate;
            print(fromDateList);
            workDataList[index].dateFrom = userDOB1;
          });
        }
      } else {
        if (picked != null && picked != DateTime.now()) {
          String formattedDate = DateFormat('MMM yyyy').format(picked);
          setState(() {
            userDOB2 = picked;
            toDateList = formattedDate;
            toDateFieldController.text = formattedDate;
            workDataList[index].dateTo = userDOB2;
          });
        }
      }
    }

    WorkFamily workData = WorkFamily(
        companyName: _companynameListTextFieldController.text,
        position: _positionListTextFieldController.text,
        dateFrom: userDOB1,
        dateTo: userDOB2,
        isCurrentWork: false);

    addNewWorkList.add(Column(
      children: [
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            setState(() {
              addNewWorkList.removeAt(index);
              if (index >= 0 && index < workDataList.length) {
                workDataList.removeAt(index);
              }

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
        InputFieldWithLabel(
            hintText: "Name of Company",
            title: "Company",
            validateText: "company name is required",
            controller: _companynameListTextFieldController,
            textType: TextInputType.text,
            onChanged: (value) {
              setState(() {
                if (index >= 0 && index < workDataList.length) {
                  workDataList[index].companyName = value.toString();
                }
              });
            }),
        SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
        InputFieldWithLabel(
          hintText: "what is your position in the Company",
          title: "Position",
          validateText: "position is required",
          controller: _positionListTextFieldController,
          textType: TextInputType.text,
          onChanged: (value) {
            setState(() {
              if (index >= 0 && index < workDataList.length) {
                workDataList[index].position = value.toString();
              }
            });
          },
        ),
        SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
        Row(
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
                  },
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.40.w,
                    child: FormFieldInput(
                      suffixIcon: Image.asset(
                        'assets/images/datee.png',
                        width: 24,
                        height: 24,
                      ),
                      readOnly: true,
                      hint: "MM/YYYY",
                      controller: fromDateFieldController,
                      onChanged: (value) {
                        print(DateTime.parse(value.toString()));
                        if (index >= 0 && index < workDataList.length) {
                          workDataList[index].dateFrom =
                              DateTime.parse(value.toString());
                        }
                      },
                      onTap: () {
                        _selectDateListe("fromD");
                      },
                      // onTapData: ,
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
                  },
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.40.w,
                    child: FormFieldInput(
                      suffixIcon: Image.asset(
                        'assets/images/datee.png',
                        width: 24,
                        height: 24,
                      ),
                      readOnly: true,
                      hint: "MM/YYYY",
                      controller: toDateFieldController,
                      onChanged: (value) {
                        print(DateTime.parse(value.toString()));
                        if (index >= 0 && index < workDataList.length) {
                          workDataList[index].dateTo =
                              DateTime.parse(value.toString());
                        }
                      },
                      onTap: () {
                        _selectDateListe("toD");
                      },
                      // onTapData: ,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
      ],
    ));
    workDataList.add(workData);
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
                            _maritalTextController.text != "Single"
                                ? _buildFormSection()
                                : SizedBox(),
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

  Widget _buildSpouseEducationSection() {
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
        _levelofEuducationSelTextController.text.isNotEmpty
            ? _buildMoreEduDetails()
            : SizedBox()
      ],
    );
  }

  Widget _buildMarriedStatusTextField() {
    return ItemWithDropDown(
        title: "Relationship Type",
        suffixIcon: 'assets/images/dropdown.png',
        hintText: "Select family",
        bottomSheet: MyBottomMaritalSheet(onItemSelected: (String value) {
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
        textType: TextInputType.number);
  }

  Widget _buildLevelofEducationTextField() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    return BlocConsumer<GetUserDropdownFormCubit,
        BlocState<Failure<ExceptionMessage>, ProfileDropDownModel>>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () => null,
          success: (state) {
            setState(() {
              context.read<AccountSnapshotCache>().notifyAllListeners();
            });
          },
        );
      },
      builder: (context, state) {
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
                  setState(() {
                    _levelofEuducationSelTextController.text = value;
                  });
                },
                state: state),
            controller: _levelofEuducationSelTextController);

        // _buildAccountOverviewSection(state: state);
      },
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
                _selectDate(context, "fromDEdu");
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.40.w,
                padding: EdgeInsets.all(10.dm),
                decoration: BoxDecoration(
                  //color: Colors.red,
                  color: CustomTypography.kBottomNavColor,
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
                        fromDateEdu.isEmpty ? 'MM/YYYY' : fromDateEdu,
                        style: fromDateEdu.isEmpty
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
                _selectDate(context, "toDEdu");
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.45.w,
                padding: EdgeInsets.all(10.dm),
                decoration: BoxDecoration(
                  color: CustomTypography.kBottomNavColor,
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
                        toDateEdu.isEmpty ? 'MM/YYYY' : toDateEdu,
                        style: toDateEdu.isEmpty
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
          children: addEducationList,
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            setState(() {
              addNewEducationSection(
                  addEducationList.length, FamilyEducation.empty());
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
      crossAxisAlignment: CrossAxisAlignment.start,
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
                _selectDate(context, "fromDWork");
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.40.w,
                padding: EdgeInsets.all(10.dm),
                decoration: BoxDecoration(
                  color: CustomTypography.kBottomNavColor,
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
                        fromDateWork.isEmpty ? 'MM/YYYY' : fromDateWork,
                        style: fromDateWork.isEmpty
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
                _selectDate(context, "toDWork");
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.45.w,
                padding: EdgeInsets.all(10.dm),
                decoration: BoxDecoration(
                  color: CustomTypography.kBottomNavColor,
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
                        toDateWork.isEmpty ? 'MM/YYYY' : toDateWork,
                        style: toDateWork.isEmpty
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
              addNewWorkSection(addNewWorkList.length, FamilyWork.empty());
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

  Widget _buildActionButtonBack() {
    return Column(
      children: [
        CustomButton(
          type: ButtonType.regularButton(
              onTap: () {
                addFirstDefaultEducation();
                addFirstDefaultWork();
                List<WorkFamily> milestoneWork = workDataList;
                List<EducationFamily> milestoneEducation = educationDataList;

                FamilyProfileFormModel modleData = FamilyProfileFormModel(
                    maritalStatus: _maritalTextController.text,
                    firstName: _spouseFirstNameTextFieldController.text,
                    surname: _spouseLastNameTextFieldController.text,
                    otherName: _spouseOtherNameTextFieldController.text,
                    numberOfChildren: _spouseOtherNameTextFieldController.text,
                    work: milestoneWork,
                    education: milestoneEducation);
                print(modleData);
                //print(milestoneWork);
                // context.router.push(const AccountAwardRoutes());
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

  void _onUserSignUpCallback() async {
    addFirstDefaultEducation();
    addFirstDefaultWork();
    List<WorkFamily> milestoneWork = workDataList;
    List<EducationFamily> milestoneEducation = educationDataList;

    FamilyProfileFormModel modleData = FamilyProfileFormModel(
        maritalStatus: _maritalTextController.text,
        firstName: _spouseFirstNameTextFieldController.text,
        surname: _spouseLastNameTextFieldController.text,
        otherName: _spouseOtherNameTextFieldController.text,
        numberOfChildren: _spouseNumberOfChildrenTextFieldController.text,
        work: milestoneWork,
        education: milestoneEducation);
    
    context
        .read<CreateFamilyInformationCubit>()
        .createFamilyInfo(familyProfileFormModel: modleData);
  }

  Widget _buildActionButton() {
    return BlocConsumer<CreateFamilyInformationCubit,
        BlocState<Failure<ExceptionMessage>, CompoundUserInfoModel>>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () => null,
          success: (state) {
            if (state.data.status == "success") {
              // clear form inputs
              _formKey.currentState!.reset();

              context.router.push(const AccountAwardRoutes());
            } else {
              SnackBarUtil.snackbarError<String>(
                context,
                code: ExceptionCode.UNDEFINED,
                message: "Something went wrong try again",
              );
            }
          },
          error: (state) {
            SnackBarUtil.snackbarError<String>(
              context,
              code: state.failure.exception.code,
              message: state.failure.exception.message.toString(),
              onRefreshCallback: () => _onUserSignUpCallback(),
            );
          },
        );
      },
      builder: (context, state) {
        final isLoading =
            state is Loading<Failure<ExceptionMessage>, CompoundUserInfoModel>;

        return Column(
          children: [
            CustomButton(
              type: ButtonType.regularButton(
                  onTap: () => _onUserSignUpCallback(),
                  label: 'Next',
                  isLoadingMode: isLoading,
                  backgroundColor: CustomTypography.kPrimaryColor300,
                  textColor: CustomTypography.kWhiteColor,
                  borderRadius: BorderRadius.all(
                      Radius.circular(Sizing.kBorderRadius * 7.r))),
            ),
            SizedBox(
              height: Sizing.kHSpacing10,
            ),
            // _buildAuthModeSwitcherSection()
          ],
        );
      },
    );
  }
}
