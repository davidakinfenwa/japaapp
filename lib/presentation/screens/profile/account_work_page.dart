import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:japaapp/business/blocs/account_bloc/create_work_info_form_cubit.dart';
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
import 'package:japaapp/domain/model/models.dart';

import 'package:japaapp/presentation/shared/custom_button.dart';

import 'package:japaapp/presentation/widget/custom_app_bar.dart';
import 'package:japaapp/presentation/widget/form_field.dart';

import 'package:japaapp/presentation/widget/input_field_with_label.dart';
import 'package:provider/provider.dart';



@RoutePage()
class AccountWorkPages extends StatefulWidget implements AutoRouteWrapper {
  const AccountWorkPages({super.key});

  @override
  State<AccountWorkPages> createState() => _AccountWorkPagesState();
    @override
  Widget wrappedRoute(BuildContext context) {
   
    return MultiBlocProvider(
      providers: [
        BlocProvider<CreateWorkInformationCubit>(
          create: (context) => getIt<CreateWorkInformationCubit>(),
        ),
        
      ],
      child: this,
    );
  }
}

class _AccountWorkPagesState extends State<AccountWorkPages> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _companynameTextFieldController =  TextEditingController();
  TextEditingController _positionTextFieldController = TextEditingController();
  
  
  DateTime userDOB1 = DateTime.now();
  DateTime userDOB2 = DateTime.now();
  String fromDate = '';
  String toDate = '';

  @override
  void initState() {
    super.initState();
    _companynameTextFieldController = TextEditingController();
    _positionTextFieldController = TextEditingController();
    
    
  }
  
    @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final userInfo = context.read<AccountSnapshotCache>().userInfo.data.work;
        print(userInfo);
     
    if (userInfo.isNotEmpty) {
    for (var i = 1; i < userInfo.length; i++) {
      addNewWorkSection(i+1, userInfo[i]);
    }
      _companynameTextFieldController = TextEditingController(text: userInfo[0].companyName);
    _positionTextFieldController = TextEditingController(text: userInfo[0].position);
   
  } else {
    // Handle the case when userInfo is empty
    print('userInfo is empty');
  }
  }
  
  @override
  void dispose() {
    _companynameTextFieldController.dispose();
    _positionTextFieldController.dispose();
    
    super.dispose();
  }

   List<Widget> addNewWorkList = [];
  List<WorkData> workDataList = [];
  void addFirstDefaultWork() {
    WorkData defaultMilestone = WorkData(companyName: _companynameTextFieldController.text, position: _positionTextFieldController.text, dateFrom: userDOB1, dateTo: userDOB2, isCurrentWork: false);
    if (defaultMilestone.companyName.isNotEmpty) {
      workDataList.insert(0,defaultMilestone);
    } else {
      
    }
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
        String formattedDate = DateFormat('MMM yyyy').format(picked);
        setState(() {
          userDOB1 = picked;
          fromDate = formattedDate;
        });
      }
    } else {
      if (picked != null && picked != DateTime.now()) {
        String formattedDate = DateFormat('MMM yyyy').format(picked);
        setState(() {
          userDOB2 = picked;
          toDate = formattedDate;
        });
      }
    }
  }



  void addNewWorkSection(int index, WorkUser workUser) {
    //  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   setState(() {});
    // });
 TextEditingController _companynameListTextFieldController =  TextEditingController(text: workUser.companyName);
 TextEditingController _positionListTextFieldController = TextEditingController(text:  workUser.position);
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
          fromDateFieldController.text=formattedDate;
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
          toDateFieldController.text=formattedDate;
          workDataList[index].dateTo = userDOB2;
        });
      }
    }
  }
   WorkData workData = WorkData(companyName: _companynameListTextFieldController.text, position: _positionListTextFieldController.text, dateFrom: userDOB1, dateTo: userDOB2, isCurrentWork: false);
  

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
        onChanged: (value){
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
        onChanged: (value){
           setState(() {
              if (index >= 0 && index < workDataList.length) {
                workDataList[index].position = value.toString();
              }
            });
        },),
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
              child:   SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.40.w,
                child: 
                FormFieldInput(
                          suffixIcon:  Image.asset(
                          'assets/images/datee.png',
                          width: 24,
                          height: 24,
                        ),
                          readOnly: true,
                          hint: "MM/YYYY",
                          controller:fromDateFieldController,
                          onChanged: (value){
                            print(DateTime.parse(value.toString()));
                          if (index >= 0 && index < workDataList.length) {
                            workDataList[index].dateFrom = DateTime.parse(value.toString());
                          }
                          },
                          onTap: () {
                            _selectDateListe( "fromD");
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
              child:  SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.40.w,
                child: 
                FormFieldInput(
                          suffixIcon:  Image.asset(
                          'assets/images/datee.png',
                          width: 24,
                          height: 24,
                        ),
                          readOnly: true,
                          hint: "MM/YYYY",
                          controller:toDateFieldController,
                          onChanged: (value){
                            print(DateTime.parse(value.toString()));
                if (index >= 0 && index < workDataList.length) {
                  workDataList[index].dateTo = DateTime.parse(value.toString());
                }
                          },
                          onTap: () {
                            _selectDateListe( "toD");
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
                   color: CustomTypography.kBottomNavColor,
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
                   color: CustomTypography.kBottomNavColor,
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
              addNewWorkSection(addNewWorkList.length,WorkUser.empty());
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

  Widget _buildActionButtonback() {
    return Column(
      children: [
        CustomButton(
          type: ButtonType.regularButton(
              onTap: () {
                 addFirstDefaultWork();
                 List<Map<String, dynamic>> milestoneListAsMap = workDataList.map((milestone) => milestone.toJson()).toList();
                          print(milestoneListAsMap);
                //context.router.push(const AccountFamilyRoute());
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

   void _onUserSignUpCallback() async{
     addFirstDefaultWork();
    List<Map<String, dynamic>> workListMap= workDataList.map((milestone) => milestone.toJson()).toList();
     print(workListMap);
    context.read<CreateWorkInformationCubit>().createWorkInfo(workLevelModel: workListMap);
  }

      Widget _buildActionButton() {
    return BlocConsumer<CreateWorkInformationCubit,
        BlocState<Failure<ExceptionMessage>, CompoundUserInfoModel>>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () => null,
          success: (state) {
            if (state.data.status=="success") {
              // clear form inputs
              _formKey.currentState!.reset();

             context.router.push(const AccountFamilyRoute());
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
