import 'dart:async';
import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:country_picker/country_picker.dart';

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

import 'package:japaapp/core/util/width_constraints.dart';
import 'package:japaapp/data/local_data/local_storage.dart';
import 'package:japaapp/domain/form_params/auth/signup_form_params.dart';
import 'package:japaapp/domain/model/models.dart';
import 'package:japaapp/presentation/shared/alert_dialog.dart';
import 'package:japaapp/presentation/shared/custom_button.dart';
import 'package:japaapp/presentation/widget/back_button.dart';
import 'package:japaapp/presentation/widget/form_field.dart';
import 'package:http/http.dart' as http;

@RoutePage()
class CreateAccountPage extends StatefulWidget implements AutoRouteWrapper {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<SignupFormCubit>(
      create: (context) => getIt<SignupFormCubit>(),
      child: this,
    );
  }
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

  //Country country = CountryParser.parseCountryCode("NG");
  Country? country;
  Future<String> fetchCountryCode()async{
final response=await http.get(Uri.parse("http://ip-api.com/json"));
print(response);
final result=json.decode(response.body);
final countryCode=result["countryCode"];
return countryCode;
  }

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
    fetchCountryCode().then((countrycode) {
      setState(() {
        country=CountryParser.parseCountryCode(countrycode);
      });
    } );
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

  void _onUserSignUpCallback() async {
    KeyboardUtil.hideKeyboard(context);
    final userId = await TokenService().retrieveUserId();
    //if (!_formKey.currentState!.validate()) return;

    final signUpFromParams = SignUpFromParams(
        id: userId.toString(),
        firstName: _firstNameTextFieldController.text,
        otherName: _otherNameTextFieldController.text,
        lastName: _lastNameTextFieldController.text,
        phoneNumber: _phoneNumerTextFieldController.text,
        password: _passwordTextFieldController.text,
        confirmPassword: _comfirmPasswordTextFieldController.text);
    context.read<SignupFormCubit>().signup(signUpFromParams: signUpFromParams);
  }

  void showPicker(){
    showCountryPicker(context: context, 
    //favorite: ['IN'],
    //exclude: ['GH'],
    countryListTheme: CountryListThemeData(
      
      bottomSheetHeight: 600,
      borderRadius: BorderRadius.circular(Sizing.kBorderRadius*2),
      textStyle: TextStyle(color: Colors.black),
      searchTextStyle: TextStyle(color: Colors.black),
      inputDecoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: "Search your country here...",
        
      )
      
    ),
    onSelect: (country){
      setState(() {
        this.country=country;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
           onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SafeArea(
          child: WidthConstraint(context).withHorizontalSymmetricalPadding(
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
      ),
    );
  }

  Widget _buildTopSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
           SizedBox(height: (Sizing.kSizingMultiple * 1).h),
        Text(
          "Finding that path is easier than you think. Let's get you up and running. ",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,

                ///height: 0.75.h,
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
        // StreamBuilder(
        //   stream: phoneNumberStreamController.stream,
        //   builder: (context, snapshot) {
        //     return PhoneNumberInputField(
        //       hintText: ' Enter Phone Number',
        //       controller: _phoneNumerTextFieldController,
        //       placeholder: 'Enter phone',
        //       onChanged: (val) {
        //         completePhoneNumber = val.completeNumber;
        //         phonenumber = val.number;
        //         print(phonenumber);
        //       },
        //       onCountryChanged: (val) {
        //         countryDialCode = val.fullCountryCode;
        //         //_phoneNumerTextFieldController.text = sign + countryDialCode + phonenumber;
        //         print(val.name);
        //       },
        //     );
        //   },
        // ),
       country == null ? CircularProgressIndicator() :TextFormField(
          cursorColor: CustomTypography.kPrimaryColor500,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: const Color(0xff344054),
              ),
          controller: _phoneNumerTextFieldController,
          keyboardType: TextInputType.number,
          textAlignVertical: TextAlignVertical.center,
          //enabled: widget.enable,

          decoration: InputDecoration(
             label: Text(
          "Enter phone number",
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: CustomTypography.kGreyColorlabel,
              fontSize: 13.0.sp),
        ),
            // prefix: Padding(
            //   padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            //   child: SvgPicture.asset("assets/svg/downarrow.svg"),
            // ),
            // prefixIconConstraints:
            //     const BoxConstraints(minHeight: 24, minWidth: 24),
            prefixIcon: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: showPicker ,
                child: Container(
                 //color: Colors.red,
                  padding:EdgeInsets.symmetric(vertical: 18.0, horizontal: 12.0),
              height: 55,
              width: 80,
              //alignment: Alignment.center,
              child: Text(
                "${country?.flagEmoji} +${country?.phoneCode}",
                style: TextStyle(color: Colors.black),
              ),
            )),
           
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Sizing.kBorderRadius),
          borderSide: BorderSide(
              color: CustomTypography.kGreyColorBorderSide, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Sizing.kBorderRadius),
          borderSide: BorderSide(
              color: CustomTypography.kGreyColorBorderSide, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          gapPadding: 0.0,
          borderRadius: BorderRadius.circular(Sizing.kBorderRadius),
          borderSide:
              BorderSide(color: CustomTypography.kGreyColor70, width: 1.5),
        ),
            contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
          ),
        
          validator: (value) {
            return _phoneNumerTextFieldController.text.isEmpty
                ? 'phone number is required!'
                : null;
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

  Widget _buildConfirmPasswordextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: Sizing.kSizingMultiple,
        ),
        FormFieldInputWithLabel(
          obSecure: true,
          controller: _comfirmPasswordTextFieldController,
          hint: 'Enter confirm password',
          textInputType: TextInputType.visiblePassword,
          validate: (value) {
            return _comfirmPasswordTextFieldController.text.isEmpty
                ? 'Confirm password is required!'
                : null;
          },
        )
      ],
    );
  }

  Widget _buildActionButton2() {
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

  Widget _buildActionButton() {
    return BlocConsumer<SignupFormCubit,
        BlocState<Failure<ExceptionMessage>, UserInfoModel>>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () => null,
          success: (state) {
            if (state.data.status == "success") {
              // clear form inputs
              _formKey.currentState!.reset();

              context.router.replace(const TabRoute());
            } else {
              showCustomAlertDialog(context,
                  subtitle: state.data.message,
                  title: 'Error',
                  backgroundColor: true,
                  buttonText: "Dismiss", onTap: () {
                context.router.maybePop();
              }, alertType: AlertType.warning);
              // SnackBarUtil.snackbarError<String>(
              //   context,
              //   code: ExceptionCode.UNDEFINED,
              //   message: state.data.message,
              // );
            }
          },
          error: (state) {
            showCustomAlertDialog(context,
                subtitle: state.failure.exception.message.toString(),
                title: 'Error',
                backgroundColor: true,
                buttonText: "Dismiss", onTap: () {
              context.router.maybePop();
            }, alertType: AlertType.warning);
            // SnackBarUtil.snackbarError<String>(
            //   context,
            //   code: state.failure.exception.code,
            //   message: state.failure.exception.message.toString(),
            //   onRefreshCallback: () => _onUserSignUpCallback(),
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
                  onTap: () => _onUserSignUpCallback(),
                  label: 'Creat Account',
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
