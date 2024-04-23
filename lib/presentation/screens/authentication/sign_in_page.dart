import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:japaapp/business/blocs/auth_blocs/signin_form_cubit/signin_form_cubit.dart';
import 'package:japaapp/business/blocs/bloc_state.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/dependence/dependence.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/core/route/app_router.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/core/util/keyboard_util.dart';
import 'package:japaapp/core/util/snackbar_util.dart';
import 'package:japaapp/core/util/width_constraints.dart';
import 'package:japaapp/domain/form_params/auth/signin_form_params.dart';
import 'package:japaapp/domain/model/auth/user_info_model.dart';
import 'package:japaapp/presentation/shared/alert_dialog.dart';
import 'package:japaapp/presentation/shared/custom_button.dart';
import 'package:japaapp/presentation/widget/back_button.dart';
import 'package:japaapp/presentation/widget/form_field.dart';

@RoutePage()
class SignInPage extends StatefulWidget implements AutoRouteWrapper {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
    @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<SigninFormCubit>(
      create: (context) => getIt<SigninFormCubit>(),
      child: this,
    );
  }
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
    context.router.replace(const EmailVerificationRoute());
  }

  @override
  void dispose() {
    _emailTextFieldController.dispose();
    _passwordTextFieldController.dispose();
    super.dispose();
  }

    void _onUserSignInCallback() async{
    KeyboardUtil.hideKeyboard(context);

    //if (!_formKey.currentState!.validate()) return;

    final signInFromParams = SignInFromParams(email: _emailTextFieldController.text, password: _passwordTextFieldController.text);
    context.read<SigninFormCubit>().signin(signInFromParams: signInFromParams);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WidthConstraint(context).withHorizontalSymmetricalPadding(
          child: Stack(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [CustomBackButton()],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: (Sizing.kSizingMultiple * 4).h),
                        _buildTopSection(),
                        SizedBox(height: (Sizing.kSizingMultiple).h),
                        _buildFormSection(),
                        SizedBox( height:(MediaQuery.sizeOf(context).height * 0.1).h),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                      padding: EdgeInsets.only(bottom: Sizing.kHSpacing50.h),
                      child: Column(
                        children: [
                          _buildActionButton(),
                        ],
                      )),
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
          //width: MediaQuery.sizeOf(context).width * 0.75.w,
          child: Row(
            children: [
              Text(
                "Welcome back  ",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w700,
                    height: 0.75.h,
                    
                    ),
              ),
              Image.asset(
                'assets/images/emoji.png',
                width: (Sizing.kSizingMultiple * 3).w,
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
        FormFieldInputWithLabel(
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
        FormFieldInputWithLabel(
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

  Widget _buildActionButtonb() {
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


      Widget _buildActionButton() {
    return BlocConsumer<SigninFormCubit,
        BlocState<Failure<ExceptionMessage>, UserInfoModel>>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () => null,
          success: (state) {
            if (state.data.accessToken!.isNotEmpty) {
              // clear form inputs
              _formKey.currentState!.reset();

              context.router.replace(const TabRoute());
            } else {
              showCustomAlertDialog(context, subtitle: state.data.message, title: 'Error',backgroundColor: true,buttonText: "Dismiss",onTap: (){context.router.maybePop();},alertType: AlertType.warning);
              // SnackBarUtil.snackbarError<String>(
              //   context,
              //   code: ExceptionCode.UNDEFINED,
              //   message: state.data.message,
              // );
            }
          },
          error: (state) {
              showCustomAlertDialog(context, subtitle: state.failure.exception.message.toString(), title: 'Error',backgroundColor: true,buttonText: "Dismiss",onTap: (){context.router.maybePop();},alertType: AlertType.warning);

            // SnackBarUtil.snackbarError<String>(
            //   context,
            //   code: state.failure.exception.code,
            //   message: state.failure.exception.message.toString(),
            //   onRefreshCallback: () => _onUserSignInCallback(),
            // );
          },
        );
      },
      builder: (context, state) {
        final isLoading =
            state is Loading<Failure<ExceptionMessage>, UserInfoModel>;

        return Column(
          children: [
            CustomButton(
              type: ButtonType.regularButton(
                  onTap: () {
                    
                    _onUserSignInCallback();
                  },
                   label: 'Login',
                  isLoadingMode: isLoading,
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
      },
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
