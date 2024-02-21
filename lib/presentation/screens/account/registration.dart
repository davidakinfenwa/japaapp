import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:japaapp/business/blocs/auth_blocs/signup_form_cubit/signup_form_cubit.dart';
import 'package:japaapp/business/blocs/bloc_state.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/dependence/dependence.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/core/route/app_router.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/core/util/keyboard_util.dart';
import 'package:japaapp/core/util/snackbar_util.dart';
import 'package:japaapp/core/util/width_constraints.dart';
import 'package:japaapp/domain/form_params/form_params.dart';
import 'package:japaapp/domain/model/models.dart';
import 'package:japaapp/presentation/shared/custom_button.dart';


@RoutePage()
class SignUpScreen extends StatefulWidget implements AutoRouteWrapper {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<SignupFormCubit>(
      create: (context) => getIt<SignupFormCubit>(),
      child: this,
    );
  }
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscuredPassword = true;
  late TapGestureRecognizer _tapRecognizer;

  late TextEditingController _emailTextFieldController;
  late TextEditingController _passwordTextFieldController;
  late TextEditingController _firstNameTextFieldController;
  late TextEditingController _lastNameTextFieldController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _tapRecognizer = TapGestureRecognizer()..onTap = _handlePress;

    _emailTextFieldController = TextEditingController();
    _passwordTextFieldController = TextEditingController();
    _firstNameTextFieldController = TextEditingController();
    _lastNameTextFieldController = TextEditingController();
  }

  void _handlePress() {
    HapticFeedback.vibrate();
    context.router.replace(const LoginRoute());
  }

  @override
  void dispose() {
    _emailTextFieldController.dispose();
    _passwordTextFieldController.dispose();
    _firstNameTextFieldController.dispose();
    _lastNameTextFieldController.dispose();
    super.dispose();
  }

  Widget _buildTopSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Create your Account",
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              color: CustomTypography.kGreyColor100),
        ),
        SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
        Text(
          'Get Started with oTask',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: CustomTypography.kGreyColor60,
              fontSize: 14.0.sp),
        ),
      ],
    );
  }

  void _onUserSignupCallback() {
    KeyboardUtil.hideKeyboard(context);

    if (!_formKey.currentState!.validate()) return;

    final _signUpFromParams = SignUpFromParams(
      firstname: _firstNameTextFieldController.text,
      lastname: _lastNameTextFieldController.text,
      email: _emailTextFieldController.text,
      password: _passwordTextFieldController.text,
    );
    context.read<SignupFormCubit>().signup(signUpFromParams: _signUpFromParams);
  }

  Widget _buildBackArrow() {
    return Container(
      alignment: Alignment.centerLeft,
      child: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          context.router.pushNamed('/login');
        },
      ),
    );
  }

  Widget _buildFirstNameTextField() {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   "Full Name",
          //   style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          //       fontWeight: FontWeight.w500,
          //       color: CustomTypography.kGreyColor100,
          //       fontSize: 14.0.sp),
          // ),
          const SizedBox(
            height: Sizing.kSizingMultiple,
          ),
          TextFormField(
            controller: _firstNameTextFieldController,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              //hintText: 'Enter your full name',
              label: Text(
                " Enter First Name",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: CustomTypography.kGreyColor70,
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
              return _firstNameTextFieldController.text.isEmpty
                  ? 'First Name is required!'
                  : null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLastNameTextField() {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   "Last Name",
          //   style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          //       fontWeight: FontWeight.w500,
          //       color: CustomTypography.kGreyColor100,
          //       fontSize: 14.0.sp),
          // ),
          const SizedBox(
            height: Sizing.kSizingMultiple,
          ),
          TextFormField(
            controller: _lastNameTextFieldController,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              label: Text(
                " Enter Last Name",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: CustomTypography.kGreyColor70,
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
              return _lastNameTextFieldController.text.isEmpty
                  ? 'Lastname is required!'
                  : null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildEmailAndUsernameTextField() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   "Email Address",
          //   style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          //       fontWeight: FontWeight.w500,
          //       color: CustomTypography.kGreyColor100,
          //       fontSize: 14.0.sp),
          // ),
          const SizedBox(
            height: Sizing.kSizingMultiple,
          ),
          TextFormField(
            controller: _emailTextFieldController,
            keyboardType: TextInputType.emailAddress,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              label: Text(
                " Enter Email Address",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: CustomTypography.kGreyColor70,
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
              return _emailTextFieldController.text.isEmpty
                  ? 'email is required!'
                  : null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   "Password",
          //   style: Theme.of(context).primaryTextTheme.headlineSmall?.copyWith(
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
                " Enter Password Name",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: CustomTypography.kGreyColor70,
                    fontSize: 14.0.sp),
              ),
              hintStyle: Theme.of(context)
                  .primaryTextTheme
                  .headlineSmall
                  ?.copyWith(
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

  Widget _buildFormSection() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildFirstNameTextField(),
          SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
          _buildLastNameTextField(),
          SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
          _buildEmailAndUsernameTextField(),
          SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
          _buildPasswordTextField(),
          SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
          // _buildForgotPasswordText(),
        ],
      ),
    );
  }

  // Widget _buildSignInButton() {
  //   return CustomButton(
  //     type: ButtonType.regularButton(
  //         onTap: () => _onUserSigninCallback(),
  //         label: 'Sign Up',
  //         isLoadingMode: false,
  //         backgroundColor: CustomTypography.kSecondaryColornew,
  //         borderRadius:
  //             BorderRadius.all(Radius.circular(Sizing.kBorderRadius * 7.r))),
  //   );
  // }

  Widget _buildSignUpButton() {
    return BlocConsumer<SignupFormCubit,
        BlocState<Failure<ExceptionMessage>, UserInfoModel>>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () => null,
          success: (state) {
            if (state.data.SIGN_UP_SUCCESSFUL) {
              // clear form inputs
              _formKey.currentState!.reset();

              context.router.replaceAll([OtpRoute()]);
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
              onRefreshCallback: () => _onUserSignupCallback(),
            );
          },
        );
      },
      builder: (context, state) {
        final _isLoading =
            state is Loading<Failure<ExceptionMessage>, UserInfoModel>;

        return CustomButton(
          type: ButtonType.regularButton(
              onTap: () => _onUserSignupCallback(),
              label: 'Sign Up',
              isLoadingMode: _isLoading,
              backgroundColor: CustomTypography.kSecondaryColornew,
              borderRadius: BorderRadius.all(
                  Radius.circular(Sizing.kBorderRadius * 7.r))),
        );
      },
    );
  }

  Widget _buildAuthModeSwitcherSection() {
    return Text.rich(
      TextSpan(
        text: 'Already have an account?',
        children: [
          TextSpan(
            text: ' Login',
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

  Widget _buildTermsAndConditionsText() {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            text: 'By signing up you agree to our',
            children: [
              TextSpan(
                text: ' Terms',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: CustomTypography.kGreyColor100,
                    fontSize: 14.0.sp),
                recognizer: _tapRecognizer,
              ),
            ],
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w400,
                color: CustomTypography.kGreyColor70,
                fontSize: 14.0.sp),
          ),
        ),
        Text.rich(
          TextSpan(
            text: 'and',
            children: [
              TextSpan(
                text: ' Conditions',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: CustomTypography.kGreyColor100,
                    fontSize: 14.0.sp),
                recognizer: _tapRecognizer,
              ),
            ],
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w400,
                color: CustomTypography.kGreyColor70,
                fontSize: 14.0.sp),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: WidthConstraint(context).withHorizontalSymmetricalPadding(
              child: Column(
                children: [
                  SizedBox(height: (Sizing.kSizingMultiple * 0.5).h),
                  _buildBackArrow(),
                  SizedBox(height: (Sizing.kSizingMultiple * 2).h),
                  _buildTopSection(),
                  SizedBox(height: (Sizing.kSizingMultiple * 4).h),
                  _buildFormSection(),
                  SizedBox(height: (Sizing.kSizingMultiple * 5).h),
                  _buildSignUpButton(),
                  SizedBox(height: (Sizing.kSizingMultiple * 3).h),
                  _buildAuthModeSwitcherSection(),
                  SizedBox(height: (Sizing.kSizingMultiple * 5).h),
                  _buildTermsAndConditionsText(),
                  SizedBox(height: (Sizing.kSizingMultiple * 2).h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
