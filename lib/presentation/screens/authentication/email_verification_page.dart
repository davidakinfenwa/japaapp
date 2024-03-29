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
class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({super.key});

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  TextEditingController _emailOneTextFieldController = TextEditingController();
  TextEditingController _emailTwoTextFieldController = TextEditingController();

  TapGestureRecognizer _tapRecognizer = TapGestureRecognizer();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _emailOneTextFieldController = TextEditingController();
    _emailTwoTextFieldController = TextEditingController();
    _tapRecognizer = TapGestureRecognizer()..onTap = _handlePress;
  }

  void _handlePress() {
    HapticFeedback.vibrate();
   context.router.replace(const SignInRoute());
  }

  @override
  void dispose() {
    _emailOneTextFieldController.dispose();
    _emailTwoTextFieldController.dispose();
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
            "Create an Account",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 25.sp,
                fontWeight: FontWeight.w700,
                height: 0.75.h,
                color: Color(0xff344054)),
          ),
        ),
      ],
    );
  }

  Widget _buildFormSection() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildEmailOneTextField(),
          SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
          _buildEmailTwoTextField(),
        ],
      ),
    );
  }

  Widget _buildEmailOneTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: Sizing.kSizingMultiple,
        ),
        FormFieldInput(
          controller: _emailOneTextFieldController,
          textInputType: TextInputType.emailAddress,
          hint: 'Enter email address',
          validate: (value) {
            return _emailOneTextFieldController.text.isEmpty
                ? 'Email one is required!'
                : null;
          },
        )
      ],
    );
  }

  Widget _buildEmailTwoTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: Sizing.kSizingMultiple,
        ),
        FormFieldInput(
          controller: _emailTwoTextFieldController,
          hint: 'Confirm email address',
          textInputType: TextInputType.emailAddress,
          validate: (value) {
            return _emailTwoTextFieldController.text.isEmpty
                ? 'Confirm email is required!'
                : null;
          },
        )
      ],
    );
  }

  Widget _buildActionButton() {
    return Column(
      children: [
        CustomButton(
          type: ButtonType.regularButton(
              onTap: () {context.router.push(const OTPVerificationRoute());},
              label: 'Get Started',
              isLoadingMode: false,
              backgroundColor: CustomTypography.kPrimaryColor300,
              textColor: CustomTypography.kWhiteColor,
              borderRadius: BorderRadius.all(
                  Radius.circular(Sizing.kBorderRadius * 7.r))),
        ),
        SizedBox(
          height: Sizing.kHSpacing10,
        ),
        _buildAuthModeSwitcherSection()
      ],
    );
  }

  Widget _buildAuthModeSwitcherSection() {
    return Text.rich(
      TextSpan(
        text: 'Already have an account?',
        children: [
          TextSpan(
            text: ' Login',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w700,
                color: const Color(0xff5A5A5A),
                fontSize: 16.0.sp),
            recognizer: _tapRecognizer,
          ),
        ],
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w500,
            color: CustomTypography.kGreyColorlabel,
            height: 0.15.h,
            fontSize: 16.0.sp),
      ),
    );
  }
}
