import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/route/app_router.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/core/util/width_constraints.dart';
import 'package:japaapp/presentation/shared/custom_button.dart';
import 'package:japaapp/presentation/widget/custom_app_bar.dart';
import 'package:japaapp/presentation/widget/form_field.dart';
import 'package:japaapp/presentation/widget/input_field_with_label.dart';

@RoutePage()
class AccountBasicInfoPage extends StatefulWidget {
  const AccountBasicInfoPage({super.key});

  @override
  State<AccountBasicInfoPage> createState() => _AccountBasicInfoPageState();
}

class _AccountBasicInfoPageState extends State<AccountBasicInfoPage> {
  TextEditingController _comfirmPasswordTextFieldController =
      TextEditingController();
  TextEditingController _firstNameTextFieldController = TextEditingController();
  TextEditingController _otherNameTextFieldController = TextEditingController();
  TextEditingController _lastNameTextFieldController = TextEditingController();
  TextEditingController _passwordTextFieldController = TextEditingController();
  TextEditingController _countryOriginTextFieldController =
      TextEditingController();
  int selectedMeansOfPayment = -2;

  late StreamController<String> countryOriginStreamController;
  // dynamic completePhoneNumber;
  // String countryDialCode = '';
  // String phonenumber = '';
  // String sign = '+';
  String countryValue = "";
  String stateValue = "";
  // String cityValue = "";
  DateTime userDOB = DateTime.now();

  String toDate = '';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _comfirmPasswordTextFieldController = TextEditingController();
    _firstNameTextFieldController = TextEditingController();
    _otherNameTextFieldController = TextEditingController();
    _lastNameTextFieldController = TextEditingController();
    _passwordTextFieldController = TextEditingController();
    _countryOriginTextFieldController = TextEditingController();
    validateStreams();
  }

  void validateStreams() {
    countryOriginStreamController = StreamController<String>.broadcast();

    _countryOriginTextFieldController.addListener(() {
      countryOriginStreamController.sink
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
    _countryOriginTextFieldController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context, String nav) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != DateTime.now()) {
      String formattedDate = DateFormat('dd MMMM yyyy').format(picked);
      setState(() {
        userDOB = picked;
        toDate = formattedDate;
      });
    }
  }

  Widget _buildBackground() {
    return Opacity(
      opacity: 0.4, // Set opacity value (0.0 to 1.0)
      child:
          //  SvgPicture.asset("assets/svg/chat.svg"),
          Image.asset(
        'assets/images/neew.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildSalutationSection() {
    return CustomApbar(
      title: 'My Profile',
      otherWidget: Container(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        decoration: BoxDecoration(
          color: CustomTypography.kPrimaryColor200,
          borderRadius:
              BorderRadius.all(Radius.circular(Sizing.kBorderRadius * 2.r)),
        ),
        child: Center(
          child: Text(
            'Edit',
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: CustomTypography.kWhiteColor, fontSize: 10.sp
                    //height: 0.9,
                    ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildProfileAvatarRowSection() {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          SizedBox.square(
            dimension: 90,
            child: Center(
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: ShapeDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/images/com13.png"),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              //  _getImageFileFromDevice(source: ImageSource.gallery);
            },
            child: Icon(
              Icons.camera_alt,
              color: CustomTypography.kBackgroundColor,
            ),
          )
        ],
      ),
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
            _buildCountryOfOriginTextField(),
            SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
            _buildCountryOfResidenceTextField(),
            SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
            _buildDateOfBirthTextField(),
            SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
            _buildGenderSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildFirstNameTextField() {
    return InputFieldWithLabel(
        hintText: "Enter first name",
        title: "First name",
        validateText: "first name is required",
        controller: _firstNameTextFieldController,
        textType: TextInputType.text);
  }

  Widget _buildSecondNameTextField() {
    return InputFieldWithLabel(
        hintText: "Enter other name",
        title: "Other name",
        validateText: "other name is required",
        controller: _otherNameTextFieldController,
        textType: TextInputType.text);
  }

  Widget _buildLastNameTextField() {
    return InputFieldWithLabel(
        hintText: "Enter last name",
        title: "Last name",
        validateText: "last name is required",
        controller: _lastNameTextFieldController,
        textType: TextInputType.text);
  }

  Widget _buildCountryOfOriginTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const SizedBox(
        //   height: Sizing.kSizingMultiple,
        // ),

        FormFieldInput(
          controller: _countryOriginTextFieldController,
          hint: 'Select Contry of Origin',
          textInputType: TextInputType.emailAddress,
          enable: true,
          suffixIcon: Text(
            stateValue,
            textAlign: TextAlign.center,
          ),
          //prefixIcon: ,
          onTap: () {
            showCountryPicker(
              context: context,
              //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
              exclude: <String>['KN', 'MF'],
              favorite: <String>['SE'],
              //Optional. Shows phone code before the country name.
              showPhoneCode: true,
              onSelect: (Country country) {
                print('Select country: ${country.displayName}');
                print('Select country: ${country.flagEmoji}');
                _countryOriginTextFieldController.text =
                    country.displayNameNoCountryCode;
                stateValue = country.flagEmoji;
              },
              // Optional. Sets the theme for the country list picker.
              countryListTheme: CountryListThemeData(
                textStyle: const TextStyle(color: Colors.black),
                // Optional. Sets the border radius for the bottomsheet.
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
                // Optional. Styles the search field.

                inputDecoration: InputDecoration(
                  labelStyle: const TextStyle(color: Colors.black),
                  labelText: 'Search',
                  hintText: 'Start typing to search',
                  prefixIcon: const Icon(Icons.search),
                  hintStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: CustomTypography.kGreyColorlabel,
                      fontSize: 13.0.sp),
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
                    //borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                        color: CustomTypography.kGreyColor70, width: 1.5),
                  ),
                ),
                // Optional. Styles the text in the search field
                searchTextStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            );
          },
          // validate: (value) {
          //   return _passwordTextFieldController.text.isEmpty
          //       ? 'Password is required!'
          //       : null;
          // },
        )
      ],
    );
  }

  Widget _buildCountryOfResidenceTextField() {
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const SizedBox(
        //   height: Sizing.kSizingMultiple,
        // ),

        FormFieldInput(
          controller: _passwordTextFieldController,
          hint: 'Contry of residence',
          textInputType: TextInputType.emailAddress,
          enable: true,
          suffixIcon: Text(
            countryValue,
            textAlign: TextAlign.center,
          ),
          //prefixIcon: ,
          onTap: () {
            showCountryPicker(
              context: context,
              //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
              exclude: <String>['KN', 'MF'],
              favorite: <String>['SE'],
              //Optional. Shows phone code before the country name.
              showPhoneCode: true,
              onSelect: (Country country) {
                print('Select country: ${country.displayName}');
                print('Select country: ${country.flagEmoji}');
                _passwordTextFieldController.text =
                    country.displayNameNoCountryCode;
                countryValue = country.flagEmoji;
              },
              // Optional. Sets the theme for the country list picker.
              countryListTheme: CountryListThemeData(
                textStyle: const TextStyle(color: Colors.black),
                // Optional. Sets the border radius for the bottomsheet.
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
                // Optional. Styles the search field.

                inputDecoration: InputDecoration(
                  labelStyle: const TextStyle(color: Colors.black),
                  labelText: 'Search',
                  hintText: 'Start typing to search',
                  prefixIcon: const Icon(Icons.search),
                  hintStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: CustomTypography.kGreyColorlabel,
                      fontSize: 13.0.sp),
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
                    //borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                        color: CustomTypography.kGreyColor70, width: 1.5),
                  ),
                ),
                // Optional. Styles the text in the search field
                searchTextStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            );
          },
          // validate: (value) {
          //   return _passwordTextFieldController.text.isEmpty
          //       ? 'Password is required!'
          //       : null;
          // },
        )
      ],
    );
  }

  Widget _buildDateOfBirthTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Date of Birth",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: CustomTypography.kGreyColorlabel,
              ),
        ),
        SizedBox(
          height: Sizing.kHSpacing8 / 2,
        ),
        InkWell(
          onTap: () {
            setState(() {});
            // showModalBottomSheet(
            //   context: context,
            //   builder: (context) {
            //     return const MyBottomSheet();
            //   },
            // );
            _selectDate(context, "toD");
          },
          child: Container(
            //width: MediaQuery.sizeOf(context).width * 0.45.w,
            padding: EdgeInsets.all(10.dm),
            decoration: BoxDecoration(
              //color: const Color(0xFFF4F4F4),
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(
                width: 1.w, // Width of the border
                color: const Color(0xFFB7C6CC),
              ),
            ),
            height: 44.h,
            child: Padding(
              padding: EdgeInsets.only(left: 0.0.w, right: 0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    toDate.isEmpty ? 'MM/YYYY' : toDate,
                    style: toDate.isEmpty
                        ? Theme.of(context).textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: CustomTypography.kGreyColorlabel,
                            fontSize: 13.0.sp)
                        : Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: const Color(0xff344054)),
                  ),
                  Image.asset(
                    'assets/images/datee.png',
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton() {
    return Column(
      children: [
        CustomButton(
          type: ButtonType.regularButton(
              onTap: () {
                context.router.push(const AccountEducationRoutes());
              },
              label: 'Next',
              isLoadingMode: false,
              backgroundColor: CustomTypography.kPrimaryColor200,
              textColor: CustomTypography.kWhiteColor,
              borderRadius: BorderRadius.all(
                  Radius.circular(Sizing.kBorderRadius * 7.r))),
        ),
      ],
    );
  }

  Widget _buildGenderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   "Gender",
        //   style: Theme.of(context).textTheme.titleMedium?.copyWith(
        //         color: const Color(0xFF101A1A),
        //         fontWeight: FontWeight.w500
        //       ),
        // ),
        SizedBox(
          height: Sizing.kSizingMultiple.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(6),
              onTap: () {
                //Navigator.of(context).pop();
                setState(() {
                  selectedMeansOfPayment = 1;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 8.0.w),
                        child: selectedMeansOfPayment == 1
                            ? SvgPicture.asset(
                                'assets/svg/checked.svg',
                              )
                            : SvgPicture.asset(
                                'assets/svg/unchecked.svg',
                              ),
                      ),
                    ],
                  ),
                  Text(
                    "Male",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: const Color(0xFF101A1A),
                        ),
                  ),
                ],
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(6),
              onTap: () {
                //Navigator.of(context).pop();
                setState(() {
                  selectedMeansOfPayment = 2;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 8.0.w),
                        child: selectedMeansOfPayment == 2
                            ? SvgPicture.asset(
                                'assets/svg/checked.svg',
                              )
                            : SvgPicture.asset(
                                'assets/svg/unchecked.svg',
                              ),
                      ),
                    ],
                  ),
                  Text(
                    "Female",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: const Color(0xFF101A1A),
                        ),
                  ),
                ],
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(6),
              onTap: () {
                //Navigator.of(context).pop();
                setState(() {
                  selectedMeansOfPayment = 3;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 8.0.w),
                        child: selectedMeansOfPayment == 3
                            ? SvgPicture.asset(
                                'assets/svg/checked.svg',
                              )
                            : SvgPicture.asset(
                                'assets/svg/unchecked.svg',
                              ),
                      ),
                    ],
                  ),
                  Text(
                    "Prefer not to say",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: const Color(0xFF101A1A),
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNotice() {
    return Center(
      child: Container(
        width: 275,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: ShapeDecoration(
          color: const Color(0xFFEFF1EE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 3.0.w),
              child: SvgPicture.asset(
                'assets/svg/notices.svg',
              ),
            ),
            Text(
              "Note: Ensure all details are fill as seen in passport",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: const Color(0xFF101A1A),
                  fontWeight: FontWeight.w500,
                  fontSize: 10.sp),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Stack(
        children: [
          _buildBackground(),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SafeArea(
              child: WidthConstraint(context).withHorizontalSymmetricalPadding(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: (Sizing.kSizingMultiple * 1).h),
                    _buildSalutationSection(),
                    SizedBox(height: (Sizing.kSizingMultiple).h),
                    _buildProfileAvatarRowSection(),
                    SizedBox(height: (Sizing.kSizingMultiple * 4).h),
                    _buildFormSection(),
                    SizedBox(height: (Sizing.kSizingMultiple * 4).h),
                    _buildActionButton(),
                    SizedBox(height: (Sizing.kSizingMultiple * 2).h),
                    _buildNotice()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
