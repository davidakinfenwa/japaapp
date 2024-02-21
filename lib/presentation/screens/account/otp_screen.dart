import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:japaapp/business/blocs/auth_blocs/signup_otp_verification_form_cubit/signup_otp_verification_form_cubit.dart';
import 'package:japaapp/business/blocs/bloc_state.dart';
import 'package:japaapp/business/snapshot_cache/snapshot_cache.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/dependence/dependence.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/core/route/app_router.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/core/util/keyboard_util.dart';
import 'package:japaapp/core/util/snackbar_util.dart';
import 'package:japaapp/core/util/toast_util.dart';
import 'package:japaapp/core/util/width_constraints.dart';
import 'package:japaapp/domain/form_params/form_params.dart';
import 'package:japaapp/domain/model/models.dart';
import 'package:japaapp/presentation/shared/response_indicators/loading_indicator.dart';
import '../../../business/blocs/auth_blocs/resend_otp_code_form_cubit/resend_otp_code_form_cubit.dart';

enum OtpVerificationScreenSource { login, signup }

@RoutePage()
class OtpScreen extends StatefulWidget implements AutoRouteWrapper {
  const OtpScreen({
    Key? key,
    this.source = OtpVerificationScreenSource.signup,
  }) : super(key: key);
  final OtpVerificationScreenSource source;

  @override
  State<OtpScreen> createState() => _OtpScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignupOtpVerificationFormCubit>(
          create: (context) => getIt<SignupOtpVerificationFormCubit>(),
        ),
        BlocProvider<ResendOtpCodeFormCubit>(
          create: (context) => getIt<ResendOtpCodeFormCubit>(),
        ),
      ],
      child: this,
    );
  }
}

class _OtpScreenState extends State<OtpScreen> {
  late TapGestureRecognizer _tapRecognizer;
  late FocusNode _otpVerificationCodeTextFieldFocusNode;
  late TextEditingController _otpVerificationCodeTextFieldController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _tapRecognizer = TapGestureRecognizer()..onTap = _handlePress;
    _otpVerificationCodeTextFieldFocusNode = FocusNode();
    _otpVerificationCodeTextFieldController = TextEditingController();
  }

  @override
  void dispose() {
    _otpVerificationCodeTextFieldFocusNode.dispose();
    _otpVerificationCodeTextFieldController.dispose();
    super.dispose();
  }

  void _handlePress() {
    HapticFeedback.vibrate();
    // context.router.replace(const LoginRoute());
  }

  void _onOTPVerificationCallback() {
    KeyboardUtil.hideKeyboard(context);

    if (!_formKey.currentState!.validate()) return;

    ToastUtil.showToast('Verifying Code! Please wait...');

    final _authenticatedUserInfo = context.read<AuthSnapshotCache>().userInfo;

    final _signupOtpVerificationFormParams = SignupOtpVerificationFormParams(
      email: _authenticatedUserInfo.email,
      otp: _otpVerificationCodeTextFieldController.text,
    );

    context.read<SignupOtpVerificationFormCubit>().verifyOTPCode(
        signupOtpVerificationFormParams: _signupOtpVerificationFormParams);
  }

  Widget _buildTopSection() {
    return Column(
      children: [
        Text(
          "Enter OTP",
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: CustomTypography.kGreyColor100),
        ),
        SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
        Column(
          children: [
            Text.rich(
              TextSpan(
                  text: 'We have just sent you 4 digit code via your',
                  children: const [],
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: CustomTypography.kGreyColor60,
                      fontSize: 14.0.sp)),
            ),
            Text.rich(
              TextSpan(
                  text: 'email ',
                  children: [
                    TextSpan(
                      text: ' sample@gmail.com',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: CustomTypography.kSecondaryColornew,
                              fontSize: 14.0.sp),
                      recognizer: _tapRecognizer,
                    ),
                  ],
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: CustomTypography.kGreyColor60,
                      fontSize: 14.0.sp)),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildBackArrow() {
    return Container(
      alignment: Alignment.centerLeft,
      child: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          context.router.pushNamed('/signup');
        },
      ),
    );
  }

  Widget _buildOtpVerificationCodeTextField() {
    return OtpTextField(
      
      numberOfFields: 4,
      borderColor: CustomTypography.kPrimaryColornew,
      focusedBorderColor: CustomTypography.kPrimaryColornew,
      borderRadius: BorderRadius.all(Radius.circular(24.r)),
      showFieldAsBox: true,
      fieldWidth: 56.w,
      margin: EdgeInsets.only(right: 15.w),
      onCodeChanged: (String code) {
       // _otpVerificationCodeTextFieldController.text = code;
      },
      onSubmit: (String verificationCode) {
        if (verificationCode.length == Sizing.kOTPCodeLength) {
          _otpVerificationCodeTextFieldController.text = verificationCode;
          // The code has the correct length, proceed with your logic
          _onOTPVerificationCallback();
        } else {
          // Code length is not valid, show an error message
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Error"),
                content: Text(
                    'OTP Verification Code is required and must be ${Sizing.kOTPCodeLength} digits.'),
              );
            },
          );
        }
      },
    );
  }

  // Widget _buildSignInButton() {
  //   return BlocConsumer<SignupOtpVerificationFormCubit,BlocState<Failure<ExceptionMessage>, ResponseModel<GenericResponseModel>>>(
  //     builder: (context,state){

  //   }, listener: (context, state){

  //   })

  //    CustomButton(
  //     type: ButtonType.regularButton(
  //         onTap: () => _onUserProceedCallback(),
  //         label: 'Continue',
  //         isLoadingMode: false,
  //         backgroundColor: CustomTypography.kSecondaryColornew,
  //         borderRadius:
  //             BorderRadius.all(Radius.circular(Sizing.kBorderRadius * 7.r))),
  //   );
  // }

  Widget _buildOtpVerificationButton() {
    return BlocConsumer<
        SignupOtpVerificationFormCubit,
        BlocState<Failure<ExceptionMessage>,
            ResponseModel<GenericResponseModel>>>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () => null,
          success: (state) {
            state.data.map(
              successResponse: (state) {
                // clear form inputs
                _formKey.currentState!.reset();

                context.router.pushAll([const ProfilePicUploadRoute()]);
              },
              errorResponse: (state) {
                SnackBarUtil.snackbarError<String>(
                  context,
                  showAction: true,
                  code: ExceptionCode.UNDEFINED,
                  message: state.data.message,
                  onRefreshCallback: () => _onOTPVerificationCallback(),
                );
              },
            );
          },
          error: (state) {
            SnackBarUtil.snackbarError<String>(
              context,
              showAction: true,
              code: state.failure.exception.code,
              message: state.failure.exception.message.toString(),
              onRefreshCallback: () => _onOTPVerificationCallback(),
            );
          },
        );
      },
      builder: (context, state) {
        // final _isLoading = state is Loading<Failure<ExceptionMessage>,
        //     ResponseModel<GenericResponseModel>>;

        // return CustomButton(
        //   type: ButtonType.regularButton(
        //       onTap: () => _onOTPVerificationCallback(),
        //       label: 'Proceed',
        //       isLoadingMode: _isLoading,
        //       backgroundColor: CustomTypography.kSecondaryColornew,
        //       borderRadius: BorderRadius.all(
        //           Radius.circular(Sizing.kBorderRadius * 7.r))),
        // );

        return state.maybeMap(
          orElse: () => const Icon(Icons.arrow_right_alt_rounded),
          loading: (_) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                LoadingIndicator(
                  type: LoadingIndicatorType.circularProgressIndicator(
                    isSmallSize: true,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildAuthModeSwitcherSection() {
    return Text.rich(
      TextSpan(
        text: "Didn\'t receive code?",
        children: [
          TextSpan(
            text: ' Resend code',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.w500,
                color: CustomTypography.kSecondaryColornew,
                fontSize: 16.0.sp),
            recognizer: _tapRecognizer,
          ),
        ],
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.w500,
            color: CustomTypography.kGreyColor60,
            fontSize: 16.0.sp),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WidthConstraint(context).withHorizontalSymmetricalPadding(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: (Sizing.kSizingMultiple * 3).h),
                  _buildBackArrow(),
                  SizedBox(height: (Sizing.kSizingMultiple * 2).h),
                  _buildTopSection(),
                  SizedBox(height: (Sizing.kSizingMultiple * 4).h),
                  _buildOtpVerificationCodeTextField(),
                  SizedBox(height: (Sizing.kSizingMultiple * 5).h),
                  _buildOtpVerificationButton(),
                  SizedBox(height: (Sizing.kSizingMultiple * 3).h),
                  _buildAuthModeSwitcherSection(),
                  SizedBox(height: (Sizing.kSizingMultiple * 9).h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
