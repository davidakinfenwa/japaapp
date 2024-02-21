import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/route/app_router.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/core/util/keyboard_util.dart';
import 'package:japaapp/core/util/width_constraints.dart';
import 'package:japaapp/presentation/shared/custom_button.dart';


@RoutePage()
class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
  
  // @override
  // Widget wrappedRoute(BuildContext context) {
  //   // TODO: implement wrappedRoute
  //   throw UnimplementedError();
  // }
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscuredPassword = true;
  late TapGestureRecognizer _tapRecognizer;

  late TextEditingController _phoneNumberTextFieldController;
  late TextEditingController _passwordTextFieldController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _tapRecognizer = TapGestureRecognizer()..onTap = _handlePress;

    _phoneNumberTextFieldController = TextEditingController();
    _passwordTextFieldController = TextEditingController();
  }

  void _handlePress() {
    HapticFeedback.vibrate();
    context.router.replace(const SignUpRoute());
  }

  @override
  void dispose() {
    _phoneNumberTextFieldController.dispose();
    _passwordTextFieldController.dispose();
    super.dispose();
  }

  Widget _buildTopSection() {
    return Column(
      children: [
        Text(
          "Welcome Back to oTask",
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontSize: 24.sp,
              fontFamily: "inter",
              fontWeight: FontWeight.w600,
              color: CustomTypography.kGreyColor100),
        ),
        SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
        Text(
          'Login to your account',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: CustomTypography.kGreyColor70,
              fontSize: 14.0.sp),
        ),
      ],
    );
  }

  void _onUserSigninCallback() {
    KeyboardUtil.hideKeyboard(context);
    context.router.replace(const TabRoute());

    // if (!_formKey.currentState!.validate()) return;

    // final _signInFromParams = SignInFromParams(
    //   phoneNumber: _phoneNumberTextFieldController.text,
    //   password: _passwordTextFieldController.text,
    // );
    // context.read<SigninFormCubit>().signin(signInFromParams: _signInFromParams);
  }

  Widget _buildEmailAndUsernameTextField() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: Sizing.kSizingMultiple,
          ),
          TextFormField(
            controller: _phoneNumberTextFieldController,
            keyboardType: TextInputType.text,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              // hintText: 'Enter your email or username',
              label: Text(
                "Email Address / Username",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: CustomTypography.kGreyColor60,
                    fontSize: 14.0.sp),
              ),
              hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: CustomTypography.kGreyColor70,
                  fontSize: 14.0.sp),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide:
                    BorderSide(color: CustomTypography.kGreyColor50, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                    color: CustomTypography.kGreyColor50, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                gapPadding: 0.0,
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                    color: CustomTypography.kGreyColor70, width: 1.5),
              ),
            ),
            validator: (value) {
              return _phoneNumberTextFieldController.text.isEmpty
                  ? 'Phone number is required!'
                  : null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFingerPrint() {
    return CircleAvatar(
      backgroundColor: CustomTypography.kBackgroundColor,
      radius: 50.r,
      backgroundImage: const AssetImage("assets/images/fingerprint.png"),
    );
  }

  Widget _buildPasswordTextField() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   "Password",
          //   style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          //       fontWeight: FontWeight.w500,
          //       color: CustomTypography.kGreyColor100,
          //       fontSize: 14.0.sp),
          // ),
          const SizedBox(
            height: Sizing.kSizingMultiple,
          ),
          TextFormField(
            obscureText: _obscuredPassword,
            controller: _passwordTextFieldController,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              label: Text(
                "Enter Password",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: CustomTypography.kGreyColor60,
                    fontSize: 14.0.sp),
              ),
              hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: CustomTypography.kGreyColor70,
                  fontSize: 14.0.sp),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obscuredPassword = !_obscuredPassword;
                  });
                },
                icon: Icon(
                  _obscuredPassword
                      ? Icons.visibility_rounded
                      : Icons.visibility_off_rounded,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide:
                    BorderSide(color: CustomTypography.kGreyColor50, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                    color: CustomTypography.kGreyColor50, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                gapPadding: 0.0,
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                    color: CustomTypography.kGreyColor70, width: 1.5),
              ),
            ),
            validator: (value) {
              return _passwordTextFieldController.text.isEmpty
                  ? 'Password is required!'
                  : null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildForgotPasswordText() {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          HapticFeedback.vibrate();
          //context.router.push(const ForgotPasswordScreenRoute());
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Forgot password?',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: CustomTypography.kGreyColor70,
                  fontSize: 16.0.sp),
            ),
            Text(
              ' Reset ',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: CustomTypography.kSecondaryColor,
                  fontSize: 16.0.sp),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormSection() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildEmailAndUsernameTextField(),
          SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
          _buildPasswordTextField(),
          SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
          _buildForgotPasswordText(),
        ],
      ),
    );
  }

  Widget _buildSignInButton() {
    return CustomButton(
      type: ButtonType.regularButton(
          onTap: () => _onUserSigninCallback(),
          label: 'Sign In',
          isLoadingMode: false,
          backgroundColor: CustomTypography.kSecondaryColornew,
          borderRadius:
              BorderRadius.all(Radius.circular(Sizing.kBorderRadius * 7.r))),
    );
  }

  Widget _buildAuthModeSwitcherSection() {
    return Text.rich(
      TextSpan(
        text: 'Don\'t have an account?',
        children: [
          TextSpan(
            text: ' Sign Up',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.w500,
                color: CustomTypography.kSecondaryColornew,
                fontSize: 16.0.sp),
            recognizer: _tapRecognizer,
          ),
        ],
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.w500,
            color: CustomTypography.kGreyColor70,
            fontSize: 16.0.sp),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: WidthConstraint(context).withHorizontalSymmetricalPadding(
            child: Column(
              children: [
                SizedBox(height: (Sizing.kSizingMultiple * 4).h),
                _buildTopSection(),
                SizedBox(height: (Sizing.kSizingMultiple * 4).h),
                _buildFormSection(),
                SizedBox(height: (Sizing.kSizingMultiple * 2).h),
                _buildFingerPrint(),
                SizedBox(height: (Sizing.kSizingMultiple * 2).h),
                _buildSignInButton(),
                SizedBox(height: (Sizing.kSizingMultiple * 2).h),
                _buildAuthModeSwitcherSection(),
                SizedBox(height: (Sizing.kSizingMultiple * 3).h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
