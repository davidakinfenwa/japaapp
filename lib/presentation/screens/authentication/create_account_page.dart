import 'dart:async';

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
class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  TextEditingController _comfirmPasswordTextFieldController =
      TextEditingController();
  TextEditingController _firstNameTextFieldController = TextEditingController();
  TextEditingController _otherNameTextFieldController = TextEditingController();
  TextEditingController _lastNameTextFieldController = TextEditingController();
  TextEditingController _passwordTextFieldController = TextEditingController();
  TextEditingController _phoneNumerTextFieldController =
      TextEditingController();
  late StreamController<String> phoneNumberStreamController;
  dynamic completePhoneNumber;
  String countryDialCode = '';
  String phonenumber = '';
  String sign = '+';

  TapGestureRecognizer _tapRecognizer = TapGestureRecognizer();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _comfirmPasswordTextFieldController = TextEditingController();
    _firstNameTextFieldController = TextEditingController();
    _otherNameTextFieldController = TextEditingController();
    _lastNameTextFieldController = TextEditingController();
    _passwordTextFieldController = TextEditingController();
    _phoneNumerTextFieldController = TextEditingController();
    _tapRecognizer = TapGestureRecognizer()..onTap = _handlePress;
    validateStreams();
  }

  void _handlePress() {
    HapticFeedback.vibrate();
    context.router.replace(const SignInRoute());
  }

  void validateStreams() {
    phoneNumberStreamController = StreamController<String>.broadcast();

    _passwordTextFieldController.addListener(() {
      phoneNumberStreamController.sink
          .add(_passwordTextFieldController.text.trim());
      // validateInputs();
    });
  }

  @override
  void dispose() {
    _comfirmPasswordTextFieldController.dispose();
    _firstNameTextFieldController.dispose();
    _otherNameTextFieldController.dispose();
    _lastNameTextFieldController.dispose();
    _passwordTextFieldController.dispose();
    _phoneNumerTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  WidthConstraint(context).withHorizontalSymmetricalPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomBackButton(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: (Sizing.kSizingMultiple * 4).h),
                            _buildTopSection(),
                            SizedBox(height: (Sizing.kSizingMultiple).h),
                            _buildFormSection(),
                            SizedBox(
                                height:
                                    (MediaQuery.sizeOf(context).height * 0.05).h),
                            _buildActionButton(),
                            SizedBox(
                                height:
                                    (MediaQuery.sizeOf(context).height * 0.1).h),
                          ],
                        
                      ),
                    ],
                  ),
                ),
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
            "Create an Account",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 25.sp,
                fontWeight: FontWeight.w700,
                height: 0.75.h,
                ),
          ),
        ),
      ],
    );
  }

  Widget _buildFormSection() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildFirstNameTextField(),
            SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
            _buildSecondNameTextField(),
            SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
            _buildLastNameTextField(),
            SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
            _buildPhoneNumerTextField(),
            SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
            _buildPasswordTextField(),
            SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
            _buildConfirmPasswordextField(),
          ],
        ),
      ),
    );
  }

  Widget _buildFirstNameTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: Sizing.kSizingMultiple,
        ),
        FormFieldInputWithLabel(
          controller: _firstNameTextFieldController,
          textInputType: TextInputType.name,
          hint: 'Enter first name',
          validate: (value) {
            return _firstNameTextFieldController.text.isEmpty
                ? 'First name is required!'
                : null;
          },
        )
      ],
    );
  }

  Widget _buildSecondNameTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: Sizing.kSizingMultiple,
        ),
        FormFieldInputWithLabel(
          controller: _otherNameTextFieldController,
          hint: 'Enter other name',
          textInputType: TextInputType.name,
          validate: (value) {
            return _otherNameTextFieldController.text.isEmpty
                ? 'Other name is required!'
                : null;
          },
        )
      ],
    );
  }

  Widget _buildLastNameTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: Sizing.kSizingMultiple,
        ),
        FormFieldInputWithLabel(
          controller: _lastNameTextFieldController,
          hint: 'Enter Last name',
          textInputType: TextInputType.name,
          validate: (value) {
            return _lastNameTextFieldController.text.isEmpty
                ? 'Last name is required!'
                : null;
          },
        )
      ],
    );
  }

  Widget _buildPhoneNumerTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: Sizing.kSizingMultiple,
        ),
        StreamBuilder(
          stream: phoneNumberStreamController.stream,
          builder: (context, snapshot) {
            return PhoneNumberInputField(
              hintText: 'Phone Number',
              controller: _phoneNumerTextFieldController,
              placeholder: 'Enter phone',
              onChanged: (val) {
                completePhoneNumber = val.completeNumber;
                phonenumber = val.number;
                print(phonenumber);
              },
              onCountryChanged: (val) {
                countryDialCode = val.fullCountryCode;
                completePhoneNumber = sign + countryDialCode + phonenumber;
                print(val.name);
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildPasswordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: Sizing.kSizingMultiple,
        ),
        FormFieldInputWithLabel(
          controller: _passwordTextFieldController,
          hint: 'Enter Password',
          textInputType: TextInputType.emailAddress,
          validate: (value) {
            return _passwordTextFieldController.text.isEmpty
                ? 'Password is required!'
                : null;
          },
        )
      ],
    );
  }

  Widget _buildConfirmPasswordextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: Sizing.kSizingMultiple,
        ),
        FormFieldInputWithLabel(
          controller: _comfirmPasswordTextFieldController,
          hint: 'Enter confirm password',
          textInputType: TextInputType.emailAddress,
          validate: (value) {
            return _comfirmPasswordTextFieldController.text.isEmpty
                ? 'Confirm password is required!'
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
              label: 'Create Account',
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
