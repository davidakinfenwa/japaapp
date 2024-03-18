import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/route/app_router.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/core/util/width_constraints.dart';
import 'package:japaapp/presentation/shared/custom_button.dart';
import 'package:japaapp/presentation/widget/back_button.dart';
import 'package:japaapp/presentation/widget/form_field.dart';

@RoutePage()
class OTPVerificationPage extends StatefulWidget {
  const OTPVerificationPage({super.key});

  @override
  State<OTPVerificationPage> createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  TextEditingController _otpTextFieldController = TextEditingController();
  

  TapGestureRecognizer _tapRecognizer = TapGestureRecognizer();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _otpTextFieldController = TextEditingController();
    _tapRecognizer = TapGestureRecognizer()..onTap = _handlePress;
  }

  void _handlePress() {
    HapticFeedback.vibrate();
    //context.router.replace(const SignUpRoute());
  }

  @override
  void dispose() {
    _otpTextFieldController.dispose();
   
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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

                        // _buildSeeHowItWorksButton(),
                        //SizedBox(height: (MediaQuery.sizeOf(context).height*0.1).h),

                        // SizedBox(height: (Sizing.kSizingMultiple * 2).h),
                        // _buildSignInButton(),
                        // SizedBox(height: (Sizing.kSizingMultiple * 2).h),
                        // _buildAuthModeSwitcherSection(),
                        // SizedBox(height: (Sizing.kSizingMultiple * 3).h),
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
                color:const Color(0xff344054)),
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
          _buildLableInfo(),
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
            FilteringTextInputFormatter.deny(RegExp(r'[^\d]')), // Allow only digits
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
      'You can request a new OTP in 23 seconds',
       style: Theme.of(context).textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w500,
        color: CustomTypography.kGreyColorlabel,
        height: 0.15.h,
        fontSize: 13.0.sp),
         
        );
  }

  Widget _buildActionButton() {
    return Column(
      children: [
        CustomButton(
          type: ButtonType.regularButton(
              onTap: () {context.router.push(const CreateAccountRoute());},
              label: 'Continue',
              isLoadingMode: false,
              backgroundColor:CustomTypography.kGreyColorButton,
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


String addSpace(String value) {
    // Insert a space after each character
    return value.split('').join(' ');
  }
}


class _CustomTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text.replaceAllMapped(
        RegExp(r'.{4}'), (match) => '${match.group(0)} '); // Add space after every 4 characters
    return newValue.copyWith(text: newText);
  }
}


class ObscuredTextFormatter extends TextInputFormatter {
  final double textSize;

  ObscuredTextFormatter({required this.textSize});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.replaceAll(RegExp(r'.'), '\u2022'), // Replace each character with a bullet (•)
      selection: newValue.selection,
    );
  }
}