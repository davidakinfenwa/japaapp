import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:japaapp/business/blocs/account_bloc/create_award_info_form_cubit.dart';
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
import 'package:japaapp/domain/form_params/account/award_profile_form_param.dart';
import 'package:japaapp/domain/model/models.dart';
import 'package:japaapp/presentation/shared/custom_button.dart';
import 'package:japaapp/presentation/widget/bottom_sheet_item.dart';
import 'package:japaapp/presentation/widget/custom_app_bar.dart';
import 'package:japaapp/presentation/widget/form_field.dart';
import 'package:japaapp/presentation/widget/input_field_with_label.dart';
import 'package:japaapp/presentation/widget/item_with_dropdown.dart';

@RoutePage()
class AccountAwardPages extends StatefulWidget implements AutoRouteWrapper {
  const AccountAwardPages({super.key});


  @override
  State<AccountAwardPages> createState() => _AccountAwardPagesState();

       @override
  Widget wrappedRoute(BuildContext context) {
    
    return MultiBlocProvider(
      providers: [
         BlocProvider<GetUserDropdownFormCubit>(
          create: (context) => getIt<GetUserDropdownFormCubit>()..userDropdownData(),
        ),

           BlocProvider<CreateAwardfInformationCubit>(
          create: (context) => getIt<CreateAwardfInformationCubit>(),
        ),

        
     
      ],
      child: this,
    );
  }
}

class _AccountAwardPagesState extends State<AccountAwardPages> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _awwardTitleTextFieldController =TextEditingController();
  TextEditingController _awardTypeTextFieldController = TextEditingController();

  DateTime userDOB1 = DateTime.now();
  String toDate = '';

  @override
  void initState() {
    super.initState();
    _awwardTitleTextFieldController = TextEditingController();
    _awardTypeTextFieldController = TextEditingController();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final userInfo = context.read<AccountSnapshotCache>().userInfo.data.record;
        print(userInfo);
        if (userInfo.isNotEmpty) {
            for (var i = 1; i < userInfo.length; i++) {
      addNewAwardkSection(i+1, userInfo[i]);
      _awwardTitleTextFieldController = TextEditingController(text: userInfo[0].title);
    _awardTypeTextFieldController = TextEditingController(text: userInfo[0].type);
    }
        } else {
          
        }
    
  }
  @override
  void dispose() {
    _awwardTitleTextFieldController.dispose();
    _awardTypeTextFieldController.dispose();
    super.dispose();
  }

  List<Widget> addNewAwardList = [];
  List<AwardRecord> awardDataList = [];
  void addFirstDefaultMilestone() {
    AwardRecord defaultMilestone = AwardRecord(type: _awardTypeTextFieldController.text,title: _awwardTitleTextFieldController.text,date: userDOB1);
    if (defaultMilestone.type.isNotEmpty) {
      awardDataList.insert(0, defaultMilestone);
      
    } else {}
  }

  Future<void> _selectDate(BuildContext context, String nav) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != DateTime.now()) {
      String formattedDate = DateFormat('MMM yyyy').format(picked);
      setState(() {
         userDOB1 = picked;
        toDate = formattedDate;
      });
    }
  }

  

  void addNewAwardkSection(int index, RecordAward recordAward) {
  
    TextEditingController awardTypeListController = TextEditingController(text: recordAward.type.toString());
    TextEditingController awardTitleListTextFieldController = TextEditingController(text: recordAward.title.toString());
    TextEditingController toDateFieldController = TextEditingController(text: recordAward.date.toString());
    DateTime userDOB = DateTime.now();
    String toDate = '';

    void selectDateList(String nav) async {
      DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );

      if (picked != null && picked != DateTime.now()) {
        String formattedDate = DateFormat('MMM yyyy').format(picked);
        setState(() {
          userDOB = picked;
          
        toDateFieldController.text=formattedDate;
          toDate = formattedDate;
        });
      }
    }
      AwardRecord awardRecord = AwardRecord(
        type: awardTypeListController.text,
        title: awardTitleListTextFieldController.text,
        date: userDOB);

    addNewAwardList.add(Column(
      children: [
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            setState(() {
              addNewAwardList.removeAt(index);
              if (index >= 0 && index < awardDataList.length) {
                awardDataList.removeAt(index);
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
                title: "Award Type",
                suffixIcon: 'assets/images/dropdown.png',
                hintText: "Select Award Type",
                bottomSheet: MyBottomAwardMainSheet(
                    onItemSelected: (String value) {
                      // Assign the value to the desired controller
                      awardTypeListController.text = value;
                      setState(() {
                        if (index >= 0 && index < awardDataList.length) {
                          awardDataList[index].type = value.toString();
                        }
                      });
                    },
                    state: state),
                controller: awardTypeListController);
          },
        ),
        SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
        InputFieldWithLabel(
          hintText: "Enter award title",
          title: "Title",
          validateText: "title name is required",
          controller: awardTitleListTextFieldController,
          textType: TextInputType.text,
          onChanged: (value) {
            setState(() {
              if (index >= 0 && index < awardDataList.length) {
                awardDataList[index].title = value.toString();
              }
            });
          },
        ),
        SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
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
                width: MediaQuery.sizeOf(context).width.w,
                child: FormFieldInput(
                  suffixIcon: Image.asset('assets/images/datee.png', width: 24, height: 24,),
                  readOnly: true,
                  hint: "MM/YYYY",
                  controller: toDateFieldController,
                  onChanged: (value) {
                    print(DateTime.parse(value.toString()));
                    if (index >= 0 && index < awardDataList.length) {
                      awardDataList[index].date =DateTime.parse(value.toString());
                    }
                  },
                  onTap: () {
                    selectDateList("toD");
                  },
                  // onTapData: ,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
      ],
    ));
    awardDataList.add(awardRecord);
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
      title: 'Award, Publication, Books',
    );
  }

  Widget _buildFormSection() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildAwardTypeTextField(),
            SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
            _buildTitleTextField(),
            SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
            _buildAwardDateTextField(),
            SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
            _buildMoreEduDetails()
          ],
        ),
      ),
    );
  }

  Widget _buildAwardTypeTextField() {
    return BlocConsumer<GetUserDropdownFormCubit,
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
            title: "Award Type",
            suffixIcon: 'assets/images/dropdown.png',
            hintText: "Select Award Type",
            bottomSheet: MyBottomAwardMainSheet(
                onItemSelected: (String value) {
                  // Assign the value to the desired controller
                  _awardTypeTextFieldController.text = value;
                },
                state: state),
            controller: _awardTypeTextFieldController);
      },
    );
  }

  Widget _buildTitleTextField() {
    return InputFieldWithLabel(
        hintText: "Enter award title",
        title: "Title",
        validateText: "title name is required",
        controller: _awwardTitleTextFieldController,
        textType: TextInputType.text);
  }

  Widget _buildMoreEduDetails() {
    return Column(
      children: [
        Column(
          children: addNewAwardList,
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            setState(() {
              addNewAwardkSection(addNewAwardList.length,RecordAward.empty());
            });
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
           
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

  Widget _buildAwardDateTextField() {
    return Column(
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
            _selectDate(context, "toD");
          },
          child: Container(
            //width: MediaQuery.sizeOf(context).width * 0.45.w,
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
    );
  }

  Widget _buildActionButtonback() {
    return Column(
      children: [
        CustomButton(
          type: ButtonType.regularButton(
              onTap: () {
                
                addFirstDefaultMilestone();
                 List<AwardRecord> milestoneListAsMap = awardDataList;
                          print(milestoneListAsMap);
                //context.router.push(const AccountBudgetRoute());
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
addFirstDefaultMilestone();
 List<AwardRecord> milestoneListAsMap = awardDataList;
          AwardFormParam awardFormParam=AwardFormParam(record: milestoneListAsMap);
           print(awardFormParam.toJson());
                
    context.read<CreateAwardfInformationCubit>().createAwardInfo(awardFormParam: awardFormParam);
  }

      Widget _buildActionButton() {
    return BlocConsumer<CreateAwardfInformationCubit,
        BlocState<Failure<ExceptionMessage>, CompoundUserInfoModel>>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () => null,
          success: (state) {
            if (state.data.status=="success") {
              // clear form inputs
              _formKey.currentState!.reset();

             context.router.push(const AccountBudgetRoute());
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
        final isLoading = state is Loading<Failure<ExceptionMessage>, CompoundUserInfoModel>;

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
