// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class FormFieldInput extends StatefulWidget {
  FormFieldInput(
      {super.key,
      this.controller,
      this.padding,
      this.height = 54,
      this.isFocused = false,
      this.onSaved,
      this.onTap,
      this.cursorHeight,
      this.enable = true,
      this.validate,
      this.onTapData,
      // this.validateString,
      this.fillColor = Colors.transparent,
      this.width = double.maxFinite,
      this.obSecure = false,
      this.borderRadius = 10,
      this.scale = 0.7,
      this.hint,
      this.textInputType = TextInputType.text,
      this.prefixIcon,
      this.suffixIcon,
      this.onChanged,
      this.contentPadding,
      this.maxLength,
      this.maxLines,
      this.align,
      this.disableBorderColor,
      this.borderSideColor,
      this.hintStyle,
      this.autovalidateMode,
      this.inputFormatters,
      this.fontSize,
      this.readOnly = false});
  final TextEditingController? controller;
  final Widget? prefixIcon, suffixIcon;
  final String? hint;
  final Function(String)? onSaved;
  final double height, width, borderRadius;
  final TextInputType textInputType;
  final Function(String?)? onChanged;
  final Color fillColor;
  final bool obSecure, enable;
  final Function()? onTap;
  final EdgeInsetsGeometry? contentPadding;
  final TextAlign? align;
  final Color? borderSideColor;
  final Color? disableBorderColor;
  final EdgeInsets? padding;
  final int? maxLength;
  final int? maxLines;
  final double? scale, cursorHeight, fontSize;
  final String? Function(String?)? validate;
  final Function? onTapData;
  final AutovalidateMode? autovalidateMode;
  bool isFocused;
  final TextStyle? hintStyle;
  final List<TextInputFormatter>? inputFormatters;
  bool readOnly;

  @override
  State<FormFieldInput> createState() => _FormFieldInputState();
}

class _FormFieldInputState extends State<FormFieldInput> {
  bool secure = false;

  @override
  void initState() {
    super.initState();
    if (widget.obSecure) {
      setState(() {
        secure = true;
      });
    }
  }

  Widget icon() {
    return switch (widget.obSecure) {
      true => SvgPicture.asset(
          'assets/svg/view_off.svg',
        ),
      _ => SvgPicture.asset(
          'assets/svgs/eye1.svg',
        )
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizing.kBorderRadius),
        // color: CustomTypography.kGreyColor40,
      ),
      child: TextFormField(
        readOnly: widget.readOnly,
        cursorColor: CustomTypography.kPrimaryColorJapa500,
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(color: const Color(0xff344054)),

        controller: widget.controller,
        keyboardType: widget.textInputType,
        textAlignVertical: TextAlignVertical.center,
        enabled: widget.enable,

        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          hintText: widget.hint,
          //  labelStyle: TextStyle(color: Colors.red),
          // label: Text(
          //   "Email Address",
          //   style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          //       fontWeight: FontWeight.w500,
          //       color: CustomTypography.kBlackColor,
          //       fontSize: 14.0.sp),
          // ),
          // suffixStyle: TextStyle(fontSize: 10),

          suffixIconConstraints:
              const BoxConstraints(minHeight: 24, minWidth: 24),
          suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 10, top: 0, bottom: 0),
              child: widget.obSecure == true
                  ? InkWell(
                      onTap: () {
                        setSecure();
                      },
                      child: switch (secure) {
                        true => SvgPicture.asset(
                            'assets/svg/view_off.svg',
                            color: Colors.black,
                          ),
                        _ => SvgPicture.asset(
                            'assets/svg/eye1.svg',
                            color: Colors.black,
                          )
                      })
                  : widget.suffixIcon),
          //  suffixIcon: Container(
          //   color: Colors.red,
          //    child: Padding(
          //           padding: const EdgeInsets.only(right: 3,top: 3),
          //           child: widget.obSecure == true
          //               ? InkWell(
          //                   onTap: () {
          //                     setSecure();
          //                   },
          //                   child: switch (secure) {
          //                     true => SvgPicture.asset(
          //                         'assets/svg/view_off.svg',
          //                         color: Colors.black,
          //                       ),
          //                     _ => SvgPicture.asset(
          //                         'assets/svg/eye1.svg',
          //                         color: Colors.black,
          //                       )
          //                   })
          //               : widget.suffixIcon),
          //  ),
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
            borderSide:
                BorderSide(color: CustomTypography.kGreyColor70, width: 1.5),
          ),
        ),
        onTap: () {
          widget.onTap != null ? widget.onTap!() : () {};
        },
        onChanged: (value) {
          setState(() {
            widget.isFocused = value.isNotEmpty;
          });
          print(widget.isFocused);
          widget.onChanged?.call(value);
        },
        validator: widget.validate,
        // validator: (value) {
        //   return _emailOneTextFieldController.text.isEmpty
        //       ? 'Email one is required!'
        //       : null;
        // },
      ),
    );
  }

  setSecure() {
    setState(() {
      secure = !secure;
    });
  }
}

class FormFieldInputHalf extends StatefulWidget {
  FormFieldInputHalf(
      {super.key,
      this.controller,
      this.padding,
      this.height = 54,
      this.isFocused = false,
      this.onSaved,
      this.onTap,
      this.cursorHeight,
      this.enable = true,
      this.validate,
      this.onTapData,
      // this.validateString,
      this.fillColor = Colors.transparent,
      this.width = double.maxFinite,
      this.obSecure = false,
      this.borderRadius = 10,
      this.scale = 0.7,
      this.hint,
      this.textInputType = TextInputType.text,
      this.prefixIcon,
      this.suffixIcon,
      this.onChanged,
      this.contentPadding,
      this.maxLength,
      this.maxLines,
      this.align,
      this.disableBorderColor,
      this.borderSideColor,
      this.hintStyle,
      this.autovalidateMode,
      this.inputFormatters,
      this.fontSize});
  final TextEditingController? controller;
  final Widget? prefixIcon, suffixIcon;
  final String? hint;
  final Function(String)? onSaved;
  final double height, width, borderRadius;
  final TextInputType textInputType;
  final Function(String?)? onChanged;
  final Color fillColor;
  final bool obSecure, enable;
  final Function()? onTap;
  final EdgeInsetsGeometry? contentPadding;
  final TextAlign? align;
  final Color? borderSideColor;
  final Color? disableBorderColor;
  final EdgeInsets? padding;
  final int? maxLength;
  final int? maxLines;
  final double? scale, cursorHeight, fontSize;
  final String? Function(String?)? validate;
  final Function? onTapData;
  final AutovalidateMode? autovalidateMode;
  bool isFocused;
  final TextStyle? hintStyle;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<FormFieldInputHalf> createState() => _FormFieldInputHalfState();
}

class _FormFieldInputHalfState extends State<FormFieldInputHalf> {
  bool secure = false;

  @override
  void initState() {
    super.initState();
    if (widget.obSecure) {
      setState(() {
        secure = true;
      });
    }
  }

  Widget icon() {
    return switch (widget.obSecure) {
      true => SvgPicture.asset(
          'assets/svg/view_off.svg',
        ),
      _ => SvgPicture.asset(
          'assets/svgs/eye1.svg',
        )
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.45.w,
      //padding: EdgeInsets.all(10.dm),
      height: 44.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizing.kBorderRadius),
        // color: CustomTypography.kGreyColor40,
      ),
      child: TextFormField(
        cursorColor: CustomTypography.kPrimaryColorJapa500,
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(color: const Color(0xff344054)),

        controller: widget.controller,
        keyboardType: widget.textInputType,
        textAlignVertical: TextAlignVertical.center,
        enabled: widget.enable,

        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon != null
              ? Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    widget.prefixIcon!
                  ],
                )
              : null,
          hintText: widget.hint,
          //  labelStyle: TextStyle(color: Colors.red),
          // label: Text(
          //   "Email Address",
          //   style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          //       fontWeight: FontWeight.w500,
          //       color: CustomTypography.kBlackColor,
          //       fontSize: 14.0.sp),
          // ),
          suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 10, top: 10),
              child: widget.obSecure == true
                  ? InkWell(
                      onTap: () {
                        setSecure();
                      },
                      child: switch (secure) {
                        true => SvgPicture.asset(
                            'assets/svg/view_off.svg',
                            color: Colors.black,
                          ),
                        _ => SvgPicture.asset(
                            'assets/svg/eye1.svg',
                            color: Colors.black,
                          )
                      })
                  : widget.suffixIcon),
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
            borderSide:
                BorderSide(color: CustomTypography.kGreyColor70, width: 1.5),
          ),
        ),
        onTap: () {
          widget.onTap != null ? widget.onTap!() : () {};
        },
        onChanged: (value) {
          setState(() {
            widget.isFocused = value.isNotEmpty;
          });
          print(widget.isFocused);
          widget.onChanged?.call(value);
        },
        validator: widget.validate,
        // validator: (value) {
        //   return _emailOneTextFieldController.text.isEmpty
        //       ? 'Email one is required!'
        //       : null;
        // },
      ),
    );
  }

  setSecure() {
    setState(() {
      secure = !secure;
    });
  }
}

class OtpFieldInput extends StatefulWidget {
  OtpFieldInput(
      {super.key,
      this.controller,
      this.padding,
      this.height = 54,
      this.isFocused = false,
      this.onSaved,
      this.onTap,
      this.cursorHeight,
      this.enable = true,
      this.validate,
      this.onTapData,
      // this.validateString,
      this.fillColor = Colors.transparent,
      this.width = double.maxFinite,
      this.obSecure = false,
      this.borderRadius = 10,
      this.scale = 0.7,
      this.hint,
      this.textInputType = TextInputType.text,
      this.prefixIcon,
      this.suffixIcon,
      this.onChanged,
      this.contentPadding,
      this.maxLength,
      this.maxLines,
      this.align,
      this.disableBorderColor,
      this.borderSideColor,
      this.hintStyle,
      this.autovalidateMode,
      this.inputFormatters,
      this.fontSize});
  final TextEditingController? controller;
  final Widget? prefixIcon, suffixIcon;
  final String? hint;
  final Function(String)? onSaved;
  final double height, width, borderRadius;
  final TextInputType textInputType;
  final Function(String?)? onChanged;
  final Color fillColor;
  final bool obSecure, enable;
  final Function()? onTap;
  final EdgeInsetsGeometry? contentPadding;
  final TextAlign? align;
  final Color? borderSideColor;
  final Color? disableBorderColor;
  final EdgeInsets? padding;
  final int? maxLength;
  final int? maxLines;
  final double? scale, cursorHeight, fontSize;
  final String? Function(String?)? validate;
  final Function? onTapData;
  final AutovalidateMode? autovalidateMode;
  bool isFocused;
  final TextStyle? hintStyle;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<OtpFieldInput> createState() => _OtpFieldInputState();
}

class _OtpFieldInputState extends State<OtpFieldInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width / 2.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizing.kBorderRadius),
        // color: CustomTypography.kGreyColor40,
      ),
      child: TextFormField(
        obscureText: true,
        //obscuringCharacter: AutofillHints.password.l,
        cursorColor: CustomTypography.kPrimaryColorJapa500,
        style: const TextStyle(
            color: Color(0xff344054), wordSpacing: 100, letterSpacing: 10),
        controller: widget.controller,
        keyboardType: widget.textInputType,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: widget.hint,
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
            borderSide:
                BorderSide(color: CustomTypography.kGreyColor70, width: 1.5),
          ),
        ),
        onTap: () {
          widget.onTap != null ? widget.onTap!() : () {};
        },
        onChanged: (value) {
          setState(() {
            widget.isFocused = value.isNotEmpty;
          });
          print(widget.isFocused);
          widget.onChanged?.call(value);
        },
        validator: widget.validate,
        // validator: (value) {
        //   return _emailOneTextFieldController.text.isEmpty
        //       ? 'Email one is required!'
        //       : null;
        // },
      ),
    );
  }
}

class PhoneNumberInputField extends StatefulWidget {
  const PhoneNumberInputField({
    required this.controller,
    required this.placeholder,
    this.label,
    this.enterPressed,
    this.fieldFocusNode,
    this.nextFocusNode,
    this.additionalNote,
    this.onChanged,
    this.onCountryChanged,
    this.maxLength,
    this.maxLines = 1,
    this.validationMessage,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.password = false,
    this.isReadOnly = false,
    this.smallVersion = true,
    this.suffix,
    this.onTap,
    this.prefix,
    this.validationColor = Colors.white,
    this.prefixSizedBoxWidth = 20,
    required this.hintText,
    super.key,
  });

  final TextEditingController controller;
  final TextInputType? textInputType;
  final bool password;
  final bool isReadOnly;
  final String placeholder;
  final String? validationMessage;
  final Function? enterPressed;
  final bool smallVersion;
  final FocusNode? fieldFocusNode;
  final Function? onTap;
  final FocusNode? nextFocusNode;
  final TextInputAction textInputAction;
  final String? additionalNote;
  final String? label;
  final double prefixSizedBoxWidth;
  final Function(PhoneNumber)? onChanged;
  final void Function(Country)? onCountryChanged;
  final int? maxLines;
  final int? maxLength;
  final Widget? suffix;
  final Widget? prefix;
  final Color validationColor;
  final String hintText;

  @override
  // ignore: library_private_types_in_public_api
  _PhoneNumberInputFieldState createState() => _PhoneNumberInputFieldState();
}

class _PhoneNumberInputFieldState extends State<PhoneNumberInputField> {
  bool? isPassword;
  double fieldHeight = 52;

  @override
  void initState() {
    super.initState();
    isPassword = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Theme(
                  data: Theme.of(context).copyWith(
                      // Specify dropdownColor
                      // dropdownMenuTheme: DropdownMenuThemeData(inputDecorationTheme: InputDecorationTheme(fillColor: Colors.white)), // Yo
                      //ur desired color
                      dialogTheme:
                          const DialogTheme(backgroundColor: Colors.white),
                      dialogBackgroundColor: Colors.white),
                  child: IntlPhoneField(
                    initialCountryCode: "",
                    cursorColor: CustomTypography.kPrimaryColorJapa500,
                    focusNode: widget.fieldFocusNode,
                    textInputAction: widget.textInputAction,
                    autovalidateMode: AutovalidateMode.disabled,
                    flagsButtonPadding: const EdgeInsets.all(8),
                    dropdownTextStyle: const TextStyle(color: Colors.black),
                    dropdownIconPosition: IconPosition.trailing,
                    style: const TextStyle(color: Colors.black),
                    controller: widget.controller,

                    //dropdownDecoration: BoxDecoration(color: Colors.red),
                    decoration: InputDecoration(
                      fillColor: Colors.black,
                      hintText: widget.hintText,
                      contentPadding: EdgeInsets.all(15.w),
                      hintStyle: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: CustomTypography.kGreyColorlabel,
                              fontSize: 13.0.sp),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Sizing.kBorderRadius),
                        borderSide: BorderSide(
                            color: CustomTypography.kGreyColorBorderSide,
                            width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Sizing.kBorderRadius),
                        borderSide: BorderSide(
                            color: CustomTypography.kGreyColorBorderSide,
                            width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        gapPadding: 0.0,
                        //borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            color: CustomTypography.kGreyColor70, width: 1.5),
                      ),
                    ),
                    //dropdownDecoration: const BoxDecoration(),
                    //initialCountryCode: 'NG',
                    showCountryFlag: true,

                    onChanged: widget.onChanged,
                    onCountryChanged: widget.onCountryChanged,
                    validator: (value) {
                      return null;
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        if (widget.validationMessage != null)
          Align(
            alignment: Alignment.topLeft,
            child: Text(widget.validationMessage!,
                style: Theme.of(context).textTheme.titleMedium?.copyWith()),
          )
        else
          const SizedBox(),
      ],
    );
  }
}

class FormFieldInputPreffix extends StatefulWidget {
  FormFieldInputPreffix(
      {super.key,
      this.controller,
      this.padding,
      this.height = 54,
      this.isFocused = false,
      this.onSaved,
      this.onTap,
      this.cursorHeight,
      this.enable = true,
      this.validate,
      this.onTapData,
      // this.validateString,
      this.fillColor = Colors.transparent,
      this.width = double.maxFinite,
      this.obSecure = false,
      this.borderRadius = 10,
      this.scale = 0.7,
      this.hint,
      this.textInputType = TextInputType.text,
      this.prefixIcon,
      this.suffixIcon,
      this.onChanged,
      this.contentPadding,
      this.maxLength,
      this.maxLines,
      this.align,
      this.disableBorderColor,
      this.borderSideColor,
      this.hintStyle,
      this.autovalidateMode,
      this.inputFormatters,
      this.fontSize,
      this.readOnly = false});
  final TextEditingController? controller;
  final Widget? prefixIcon, suffixIcon;
  final String? hint;
  final Function(String)? onSaved;
  final double height, width, borderRadius;
  final TextInputType textInputType;
  final Function(String?)? onChanged;
  final Color fillColor;
  final bool obSecure, enable;
  final Function()? onTap;
  final EdgeInsetsGeometry? contentPadding;
  final TextAlign? align;
  final Color? borderSideColor;
  final Color? disableBorderColor;
  final EdgeInsets? padding;
  final int? maxLength;
  final int? maxLines;
  final double? scale, cursorHeight, fontSize;
  final String? Function(String?)? validate;
  final Function? onTapData;
  final AutovalidateMode? autovalidateMode;
  bool isFocused;
  final TextStyle? hintStyle;
  final List<TextInputFormatter>? inputFormatters;
  bool readOnly;

  @override
  State<FormFieldInputPreffix> createState() => _FormFieldInputPreffixState();
}

class _FormFieldInputPreffixState extends State<FormFieldInputPreffix> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizing.kBorderRadius),
        // color: CustomTypography.kGreyColor40,
      ),
      child: TextFormField(
        readOnly: widget.readOnly,
        cursorColor: CustomTypography.kPrimaryColorJapa500,
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(color: const Color(0xff344054),),

        controller: widget.controller,
        keyboardType: widget.textInputType,
        textAlignVertical: TextAlignVertical.center,
        enabled: widget.enable,
          
        decoration: InputDecoration(
        
          prefix: Padding(
            padding: const  EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: SvgPicture.asset("assets/svg/downarrow.svg"),
          ),
          prefixIconConstraints:  const BoxConstraints(minHeight: 24, minWidth: 24),
          prefixIcon: Padding(
            padding:  EdgeInsetsDirectional.only(start: 5),
            child: widget.prefixIcon,
          ),
          hintText: widget.hint,
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
            borderSide:
                BorderSide(color: CustomTypography.kGreyColor70, width: 1.5),
          ),
           contentPadding:const EdgeInsets.fromLTRB(90, 0, 0, 30),
        ),
        onTap: () {
          widget.onTap != null ? widget.onTap!() : () {};
        },
        onChanged: (value) {
          setState(() {
            widget.isFocused = value.isNotEmpty;
          });
          print(widget.isFocused);
          widget.onChanged?.call(value);
        },
        validator: widget.validate,
        // validator: (value) {
        //   return _emailOneTextFieldController.text.isEmpty
        //       ? 'Email one is required!'
        //       : null;
        // },
      ),
    );
  }

 
}
