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
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailTextFieldController = TextEditingController();
  TextEditingController _passwordTextFieldController = TextEditingController();

  TapGestureRecognizer _tapRecognizer = TapGestureRecognizer();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _emailTextFieldController = TextEditingController();
    _passwordTextFieldController = TextEditingController();
    _tapRecognizer = TapGestureRecognizer()..onTap = _handlePress;
  }

  void _handlePress() {
    HapticFeedback.vibrate();
   context.router.replace(const CreateAccountRoute());
  }

  @override
  void dispose() {
    _emailTextFieldController.dispose();
    _passwordTextFieldController.dispose();
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
          child: Row(
            children: [
              Text(
                "Welcome back  ",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w700,
                    height: 0.75.h,
                    color: Color(0xff344054)),
              ),
              Image.asset(
                  'assets/images/emoji.png',
                  width: (Sizing.kSizingMultiple *3).w,
                ),
            ],
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
          controller: _emailTextFieldController,
          textInputType: TextInputType.emailAddress,
          hint: 'Enter email address',
          validate: (value) {
            return _emailTextFieldController.text.isEmpty
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
          obSecure: true,
          controller: _passwordTextFieldController,
          hint: 'Enter Password',
          textInputType: TextInputType.visiblePassword,
          validate: (value) {
            return _passwordTextFieldController.text.isEmpty
                ? 'Password is required!'
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
              onTap: () {
                context.router.replace(const TabRoute());
                },
              label: 'Login',
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
        text: 'Don\'t have an account?',
        children: [
          TextSpan(
            text: ' SignUp',
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
