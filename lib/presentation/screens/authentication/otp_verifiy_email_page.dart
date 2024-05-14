import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:japaapp/business/blocs/auth_blocs/email_otp_verification_form_cubit/email_otp_verification_form_cubit.dart';
import 'package:japaapp/business/blocs/auth_blocs/resend_otp_code_form_cubit/resend_otp_code_form_cubit.dart';
import 'package:japaapp/business/blocs/bloc_state.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/dependence/dependence.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/core/route/app_router.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/core/util/keyboard_util.dart';
import 'package:japaapp/core/util/snackbar_util.dart';
import 'package:japaapp/core/util/toast_util.dart';
import 'package:japaapp/core/util/width_constraints.dart';
import 'package:japaapp/data/local_data/local_storage.dart';
import 'package:japaapp/domain/form_params/auth/otp_verification_form_params.dart';
import 'package:japaapp/domain/form_params/form_params.dart';
import 'package:japaapp/domain/model/auth/email_verification_otp_model.dart';
import 'package:japaapp/domain/model/auth/resend_otp_response_model.dart';
import 'package:japaapp/presentation/shared/custom_button.dart';
import 'package:japaapp/presentation/widget/back_button.dart';
import 'package:japaapp/presentation/widget/form_field.dart';

enum OtpVerificationScreenSource { login, signup }

@RoutePage()
class OTPVerificationPage extends StatefulWidget implements AutoRouteWrapper {
  final OtpVerificationScreenSource source;
  const OTPVerificationPage({
    super.key,
    this.source = OtpVerificationScreenSource.signup,
  });

  @override
  State<OTPVerificationPage> createState() => _OTPVerificationPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EmailOtpVerificationFormCubit>(
          create: (context) => getIt<EmailOtpVerificationFormCubit>(),
        ),
        BlocProvider<ResendOtpCodeFormCubit>(
          create: (context) => getIt<ResendOtpCodeFormCubit>(),
        ),
      ],
      child: this,
    );
  }
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  TextEditingController _otpTextFieldController = TextEditingController();

  TapGestureRecognizer tapRecognizer = TapGestureRecognizer();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Timer? _timer;
  int _currentSeconds = 0;
  final _interval = const Duration(seconds: 1);

  int get _timerMaxSeconds => Sizing.kOTPExpiryDuration;

  // represents where this screen is navigated from
  // OtpVerificationScreenSource get _source => widget.source;
  bool _shouldEnableResendOTPCodeButton = false;
  @override
  void initState() {
    super.initState();
    _otpTextFieldController = TextEditingController();
    tapRecognizer = TapGestureRecognizer()..onTap = _handlePress;

    if (widget.source == OtpVerificationScreenSource.signup) {
      if (mounted) _startTimeout();

      setState(() {
        _shouldEnableResendOTPCodeButton = false;
      });
    } else {
      setState(() {
        _shouldEnableResendOTPCodeButton = true;
      });
    }


    
  }

  void _handlePress() {
    HapticFeedback.vibrate();
    //context.router.replace(const SignUpRoute());
    _onResendOTPValidationCodeCallback();
    setState(() {
      _startTimeout();
     _shouldEnableResendOTPCodeButton = false;
     _showOrHideResendOTPVerificationCodeButton();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();

    _otpTextFieldController.dispose();

    super.dispose();
  }

  String get _timerText =>
      '${((_timerMaxSeconds - _currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((_timerMaxSeconds - _currentSeconds) % 60).toString().padLeft(2, '0')}';

  void _startTimeout() {
    final _duration = _interval;
    _timer = Timer.periodic(_duration, (timer) {
      setState(() {
        _currentSeconds = timer.tick;

        if (timer.tick >= _timerMaxSeconds) timer.cancel();
      });
    });
  }

  void _showOrHideResendOTPVerificationCodeButton() {
    if (_currentSeconds >= _timerMaxSeconds) {
      setState(() {
        _shouldEnableResendOTPCodeButton = true;
      });
    }
  }

  void _onOTPVerificationCallback() async {
    KeyboardUtil.hideKeyboard(context);
    final userId = await TokenService().retrieveUserId();
    //if (!_formKey.currentState!.validate()) return;
    ToastUtil.showToast('Verifying Code! Please wait...');

    final emailVerificationFromParams = EmailOtpVerificationFormParams(
      id: userId!,
      otp: _otpTextFieldController.text,
    );
    context.read<EmailOtpVerificationFormCubit>().verifyOTPCode( emailOtpVerificationFormParams: emailVerificationFromParams);
  }

  void _onResendOTPValidationCodeCallback() async {
    //final _authenticatedUserInfo = context.read<AuthSnapshotCache>().userInfo;
    final userId = await TokenService().retrieveUserId();
    final _resendOtpFormParams = ResendOtpFormParams(id: userId.toString());
    context
        .read<ResendOtpCodeFormCubit>()
        .resendOTPVerificationCode(resendOtpFormParams: _resendOtpFormParams);
  }

  @override
  Widget build(BuildContext context) {
    _showOrHideResendOTPVerificationCodeButton();
    // final bool isKeyboardVisible = KeyboardUtil.isKeyboardVisible(context);

    return Scaffold(
      body: GestureDetector(
           onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  WidthConstraint(context).withHorizontalSymmetricalPadding(
                      child: const CustomBackButton())
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SingleChildScrollView(
                    child:
                        WidthConstraint(context).withHorizontalSymmetricalPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: (Sizing.kSizingMultiple * 4).h),
                          _buildTopSection(),
        
                          SizedBox(height: (Sizing.kSizingMultiple).h),
                          _buildFormSection(),
                          SizedBox(
                              height:
                                  (MediaQuery.sizeOf(context).height * 0.1).h),
        
                         
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: Sizing.kHSpacing50.h),
                    child:
                        WidthConstraint(context).withHorizontalSymmetricalPadding(
                            child: Column(
                      children: [
                        _buildActionButton(),
                      ],
                    )),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopSection() {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.75.w,
          child: Text(
            "Verify email address",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 25.sp,
                fontWeight: FontWeight.w700,
                height: 0.75.h,
                color: const Color(0xff344054)),
          ),
        ),
      ],
    );
  }

  Widget _buildFormSection() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildOtpTextField(),
          SizedBox(height: (Sizing.kSizingMultiple * 2).h),
          _shouldEnableResendOTPCodeButton==false
              ? _buildLableInfo()
              : _buildResendVerificationCode(),
         // _buildResendVerificationCode()
        ],
      ),
    );
  }

  Widget _buildOtpTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: Sizing.kSizingMultiple,
        ),
        OtpFieldInput(
          controller: _otpTextFieldController,
          textInputType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.deny(
                RegExp(r'[^\d]')), // Allow only digits
            _CustomTextFormatter(),
            ObscuredTextFormatter(textSize: 24)
          ], // Custom formatter to add space between characters],
          hint: 'Enter OTP',
          //       onChanged: (value) {
          //         addSpace(value!);
          //   // setState(() {
          //   //   _otpTextFieldController.value = TextEditingValue(
          //   //     text: addSpace(value!),
          //   //     selection: TextSelection.collapsed(offset: addSpace(value).length),
          //   //   );
          //   // });
          // },
          validate: (value) {
            return _otpTextFieldController.text.isEmpty
                ? 'OTP is required!'
                : null;
          },
        )
      ],
    );
  }

  Widget _buildLableInfo() {
    return Text(
      'You can request a new OTP in $_timerText seconds',
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.w500,
          color: CustomTypography.kGreyColorlabel,
          height: 0.15.h,
          fontSize: 13.0.sp),
    );
  }

  Widget _buildActionButtonBackup() {
    return Column(
      children: [
        CustomButton(
          type: ButtonType.regularButton(
              onTap: () {
                context.router.push(const CreateAccountRoute());
              },
              label: 'Continue',
              isLoadingMode: false,
              backgroundColor: CustomTypography.kGreyColorButton,
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

  Widget _buildActionButton() {
    return BlocConsumer<EmailOtpVerificationFormCubit,
        BlocState<Failure<ExceptionMessage>, EmailVerificationOtpModel>>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () => null,
          success: (state) {
            if (state.data.status == "success") {
              // clear form inputs
              _formKey.currentState!.reset();

              context.router.push(const CreateAccountRoute());
            } else {
              SnackBarUtil.snackbarError<String>(
                context,
                code: ExceptionCode.UNDEFINED,
                message: state.data.message,
              );
            }
          },
          error: (state) {
            SnackBarUtil.snackbarError<String>(
              context,
              code: state.failure.exception.code,
              message: state.failure.exception.message.toString(),
              onRefreshCallback: () => _onOTPVerificationCallback(),
            );
          },
        );
      },
      builder: (context, state) {
        final isLoading = state
            is Loading<Failure<ExceptionMessage>, EmailVerificationOtpModel>;

        return Column(
          children: [
            CustomButton(
              type: ButtonType.regularButton(
                  onTap: () => _onOTPVerificationCallback(),
                  label: 'Continue',
                  isLoadingMode: isLoading,
                  backgroundColor: CustomTypography.kPrimaryColor300,
                  textColor: CustomTypography.kWhiteColor,
                  borderRadius: BorderRadius.all(
                      Radius.circular(Sizing.kBorderRadius * 7.r))),
            ),
            SizedBox(
              height: Sizing.kHSpacing10,
            ),
            //_buildAuthModeSwitcherSection()
          ],
        );
      },
    );
  }

  Widget _buildResendVerificationCode() {
    return BlocConsumer<ResendOtpCodeFormCubit,
        BlocState<Failure<ExceptionMessage>, ResendOtpModel>>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () => null,
          success: (state) {
            if (state.data.status == "success") {
              // TODO: fix bug with disabling button after resending otp-code
              // start timeout
              if (mounted) {
                setState(() {
                  _shouldEnableResendOTPCodeButton = false;
                  _startTimeout();
                });
              }

              ToastUtil.showToast(state.data.message.toString());
            } else {
              SnackBarUtil.snackbarError<String>(
                context,
                code: ExceptionCode.UNDEFINED,
                message: state.data.message,
              );
            }
          },
          error: (state) {
            SnackBarUtil.snackbarError<String>(
              context,
              code: state.failure.exception.code,
              message: state.failure.exception.message.toString(),
            );
          },
        );
      },
      builder: (context, state) {
        final _isLoading =
            state is Loading<Failure<ExceptionMessage>, ResendOtpModel>;

        return Text.rich(
      TextSpan(
        text: 'Didt receive otp?',
        children: [
          TextSpan(
            text: ' Resend',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w700,
                color: const Color(0xff5A5A5A),
                fontSize: 16.0.sp),
            recognizer: tapRecognizer,
          ),
        ],
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w500,
            color: CustomTypography.kGreyColorlabel,
            height: 0.15.h,
            fontSize: 16.0.sp),
      ),
    );
        
        // CustomButton(
        //   type: ButtonType.regularButton(
        //     onTap: () => _onResendOTPValidationCodeCallback(),
        //     isLoadingMode: _isLoading,
        //     label: 'Resend Verification Code',
        //     isDisabledMode: !_shouldEnableResendOTPCodeButton,
        //   ),
        // );
      },
    );
  }

  String addSpace(String value) {
    // Insert a space after each character
    return value.split('').join(' ');
  }
}

class _CustomTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text.replaceAllMapped(RegExp(r'.{4}'),
        (match) => '${match.group(0)} '); // Add space after every 4 characters
    return newValue.copyWith(text: newText);
  }
}

class ObscuredTextFormatter extends TextInputFormatter {
  final double textSize;

  ObscuredTextFormatter({required this.textSize});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.replaceAll(
          RegExp(r'.'), '\u2022'), // Replace each character with a bullet (•)
      selection: newValue.selection,
    );
  }
}
