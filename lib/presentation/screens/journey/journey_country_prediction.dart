import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:japaapp/business/blocs/bloc_state.dart';
import 'package:japaapp/business/blocs/journey/country_prediction_form_cubit.dart';
import 'package:japaapp/business/snapshot_cache/journey_snapshot_cache.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/dependence/dependence.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/core/route/app_router.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/core/util/snackbar_util.dart';
import 'package:japaapp/core/util/width_constraints.dart';
import 'package:japaapp/domain/model/journey/country_prediction_model.dart';
import 'package:japaapp/presentation/shared/custom_button.dart';
import 'package:japaapp/presentation/widget/back_button.dart';

@RoutePage()
class JourneyCountryPredictedPage extends StatefulWidget implements AutoRouteWrapper {
  const JourneyCountryPredictedPage({super.key});

  @override
  State<JourneyCountryPredictedPage> createState() =>
      _JourneyCountryPredictedPageState();

       @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<CountryPredictionCubit>(
      create: (context) => getIt<CountryPredictionCubit>(),
      child: this,
    );
  }
}

class _JourneyCountryPredictedPageState
    extends State<JourneyCountryPredictedPage> {
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
      body: Stack(
        children: [
          _buildBackground(),
          Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: (Sizing.kSizingMultiple * 6).h),
              WidthConstraint(context).withHorizontalSymmetricalPadding(
                  child: CustomBackButton(
                onTapExit: () {
                  context.router.push(const TabRoute());
                },
              ))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                child:
                    WidthConstraint(context).withHorizontalSymmetricalPadding(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildTopSection(),
                      SizedBox(height: (Sizing.kSizingMultiple * 4).h),
                      _buildGoodFitText(),
                      SizedBox(height: (Sizing.kSizingMultiple).h),
                      _buildSuggestedCountrySection(),
                      SizedBox(
                          height: (MediaQuery.sizeOf(context).height * 0.2).h),
                     
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(bottom: Sizing.kHSpacing10.h),
                            
                                    child: Column(
                              children: [
                                _buildActionButton(),
                                _buildSupriseMeSection(),
                      SizedBox(height: (Sizing.kSizingMultiple).h),

                                _buildOtherActionButton("Pick a country"),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
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

  Widget _buildTopSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          //width: MediaQuery.sizeOf(context).width * 0.75.w,
          child: Image.asset(
            'assets/images/countrycan.png',
            fit: BoxFit.cover,
            width: 100,
            height: 100,
          ),
        ),
      ],
    );
  }

  Widget _buildGoodFitText() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.8.w,
      child: Text(
        'Based on your profile, the selected country is,',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              //color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }

  Widget _buildSuggestedCountrySection() {
    final result= context.watch<JourneySnapshotCache>().countryPredictionModel;
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.8.w,
      child: Text(
        result.data,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }

  Widget _buildActionButton() {
    return Column(
      children: [
        CustomButton(
          type: ButtonType.regularButton(
              onTap: () {
                context.router.push(const JourneyVisaTypeSelectionRoute());
              },
              label: 'Continue',
              isLoadingMode: false,
              backgroundColor: CustomTypography.kPrimaryColor300,
              textColor: CustomTypography.kWhiteColor,
              borderRadius: BorderRadius.all(
                  Radius.circular(Sizing.kBorderRadius * 7.r))),
        ),
        SizedBox(
          height: Sizing.kHSpacing10,
        ),
      ],
    );
  }

  Widget _buildOtherActionButton(String label) {
    return Column(
      children: [
        CustomButton(
          type: ButtonType.withBorderLongButton(
              onTap: () {
                //context.router.push(const CreateAccountRoute());
              },
              label: label,
              isLoadingMode: false,
               textColor: CustomTypography.kPrimaryColor300,
              borderColor: CustomTypography.kPrimaryColor300,
              borderRadius: BorderRadius.all(
                  Radius.circular(Sizing.kBorderRadius * 7.r))),
        ),
        SizedBox(
          height: Sizing.kHSpacing10,
        ),
      ],
    );
  }


  
 void _onUserRerunCallback() async{
    // KeyboardUtil.hideKeyboard(context);
    // final userId = await TokenService().retrieveUserId();
    //if (!_formKey.currentState!.validate()) return;
     LoadingData.showCustomDialog(context);

    //final signUpFromParams = SignUpFromParams(id: userId.toString(), firstName: _firstNameTextFieldController.text, otherName: _otherNameTextFieldController.text, lastName: _lastNameTextFieldController.text, phoneNumber: _phoneNumerTextFieldController.text, password: _passwordTextFieldController.text, confirmPassword: _comfirmPasswordTextFieldController.text);
    context.read<CountryPredictionCubit>().countryPrediction();
  }

   Widget _buildSupriseMeSection() {
    return BlocConsumer<CountryPredictionCubit,
        BlocState<Failure<ExceptionMessage>, CountryPredictionModel>>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () => null,
          success: (state) {
            if (state.data.status=="success") {
              // clear form inputs
             // _formKey.currentState!.reset();
             BotToast.cleanAll();

             //context.router.replace(const JourneyCountryPredictedRoute());
            } else {
              BotToast.cleanAll();
              SnackBarUtil.snackbarError<String>(
                context,
                code: ExceptionCode.UNDEFINED,
                message: state.data.message,
              );
            }
          },
          error: (state) {
            BotToast.cleanAll();
            SnackBarUtil.snackbarError<String>(
              context,
              code: state.failure.exception.code,
              message: state.failure.exception.message.toString(),
              onRefreshCallback: () => _onUserRerunCallback(),
            );
          },
        );
      },
      builder: (context, state) {
        final isLoading = state is Loading<Failure<ExceptionMessage>, CountryPredictionModel>;

        return  CustomButton(
          type: ButtonType.withBorderLongButton(
              onTap:  () => _onUserRerunCallback(),
              label: "Rerun Assessment",
              isLoadingMode: false,
               textColor: CustomTypography.kPrimaryColor300,
              borderColor: CustomTypography.kPrimaryColor300,
              borderRadius: BorderRadius.all(
                  Radius.circular(Sizing.kBorderRadius * 7.r))),
        );
      },
    );
  }
}
