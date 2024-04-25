import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:japaapp/business/blocs/account_bloc/create_budget_info_form_cubit.dart';
import 'package:japaapp/business/blocs/bloc_state.dart';

import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/dependence/dependence.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/core/route/app_router.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/core/util/width_constraints.dart';
import 'package:japaapp/domain/form_params/account/budget_form_params.dart';
import 'package:japaapp/domain/model/models.dart';
import 'package:japaapp/presentation/shared/alert_dialog.dart';
import 'package:japaapp/presentation/shared/custom_button.dart';

import 'package:japaapp/presentation/widget/custom_app_bar.dart';
import 'package:japaapp/presentation/widget/progress_bar_with_slider.dart';


@RoutePage()
class AccountBudgetPage extends StatefulWidget implements AutoRouteWrapper {
  const AccountBudgetPage({super.key});

  @override
  State<AccountBudgetPage> createState() => _AccountBudgetPageState();
   @override
  Widget wrappedRoute(BuildContext context) {
    

    return MultiBlocProvider(
      providers: [
        BlocProvider<CreateBudgetInformationCubit>(
          create: (context) => getIt<CreateBudgetInformationCubit>(),
        ),
        
      ],
      child: this,
    );
  }
}


class _AccountBudgetPageState extends State<AccountBudgetPage> {
  
int selectedMeansOfPayment = 0;
 double _startValue=0.00;
 double _endValue=0.00;

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
                            SizedBox(height: (Sizing.kSizingMultiple ).h),
                            _buildWhatEverToggle(),
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
      title: 'Budget',
    );
  }

  Widget _buildProgressBarSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What is your budget?",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: Color(0xFF191D23),
              ),
        ),
        SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
        Container(
          //color: Colors.red,
          width: MediaQuery.sizeOf(context).width.w,
          height: 70,
          child: RangeSlide(data: (RangeValues values ) {  
                _startValue=values.start;
                _endValue=values.end;
          },))
      ],
    );
  }

  Widget _buildWhatEverToggle(){
    return   InkWell(
              borderRadius: BorderRadius.circular(6),
              onTap: () {
                //Navigator.of(context).pop();
                setState(() {
                 selectedMeansOfPayment = selectedMeansOfPayment == 1 ? 0 : 1;
                });
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width*0.5.w,
                //color: Colors.red,
                 padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 8.0.w),
                      child: selectedMeansOfPayment == 1
                          ? SvgPicture.asset(
                              'assets/svg/checked.svg',
                            )
                          : SvgPicture.asset(
                              'assets/svg/unchecked.svg',
                            ),
                    ),
                    Text(
                      "Whatever it takes",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: const Color(0xFF101A1A),
                          ),
                    ),
                  ],
                ),
              ),
            );
  }





   void _onUserSignUpCallback() async{
    final startv=double.parse(_startValue.toString()).ceil().toString();
    final endv=double.parse(_endValue.toString()).ceil().toString();
   
    BudgetFormParams budgetFormParams=BudgetFormParams(budgetedAmount: "$startv - $endv", isAnyAmount: selectedMeansOfPayment.toString());
    context.read<CreateBudgetInformationCubit>().createBudgetInfo(budgetFormParams: budgetFormParams);
  }

      Widget _buildActionButton() {
    return BlocConsumer<CreateBudgetInformationCubit,
        BlocState<Failure<ExceptionMessage>, CompoundUserInfoModel>>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () => null,
          success: (state) {
            if (state.data.status=="success") {
              // clear form inputs
             // _formKey.currentState!.reset();
             showCustomAlertDialog(context, subtitle: "Profile created successfully", title: 'Success',backgroundColor: true,buttonText: "Continue",onTap: (){context.router.replaceAll([const TabRoute()]);},alertType: AlertType.success);

             
            } else {
              showCustomAlertDialog(context, subtitle: "Something went wrong try again", title: 'Error',backgroundColor: true,buttonText: "Dismiss",onTap: (){context.router.maybePop();},alertType: AlertType.warning);
              // SnackBarUtil.snackbarError<String>(
              //   context,
              //   code: ExceptionCode.UNDEFINED,
              //   message: "Something went wrong try again",
              // );
            }
          },
          error: (state) {
            showCustomAlertDialog(context, subtitle: state.failure.exception.message.toString(), title: 'Error',backgroundColor: true,buttonText: "Dismiss",onTap: (){context.router.maybePop();},alertType: AlertType.warning);
            // SnackBarUtil.snackbarError<String>(
            //   context,
            //   code: state.failure.exception.code,
            //   message: state.failure.exception.message.toString(),
            //   onRefreshCallback: () => _onUserSignUpCallback(),
            // );
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
