// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/presentation/widget/form_field.dart';

class ItemWithDropDown extends StatefulWidget {
 const ItemWithDropDown(
      {super.key,
      required this.title,
      required this.suffixIcon,
      required this.hintText,
      required this.bottomSheet,
      
      required this.controller});
  final TextEditingController controller;
  final String title;
  final String suffixIcon;
  final String hintText;
  final Widget bottomSheet;
  

  @override
  State<ItemWithDropDown> createState() => _ItemWithDropDownState();
}

class _ItemWithDropDownState extends State<ItemWithDropDown> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // widget.controller = TextEditingController(text: widget.providerData);
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: CustomTypography.kGreyColorlabel,
              ),
        ),
        SizedBox(
          height: Sizing.kHSpacing8 / 2,
        ),
        FormFieldInput(
          suffixIcon: Image.asset(
            widget.suffixIcon,
            width: 24.w,
            height: 24.h,
          ),
          readOnly: true,
          hint: widget.hintText,
          controller: widget.controller,
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return widget.bottomSheet;
              },
            );
          },
          // onTapData: ,
        ),
      ],
    );
  }
}








class ItemWithPreffixDropDown extends StatefulWidget {
 const ItemWithPreffixDropDown(
      {super.key,
       this.title="",
      required this.preffix,
      required this.hintText,
      required this.bottomSheet,
      
      required this.controller});
 final TextEditingController controller;
  final String title;
  final Widget preffix;
  final String hintText;
  final Widget bottomSheet;
  

  @override
  State<ItemWithPreffixDropDown> createState() => _ItemWithPreffixDropDownState();
}

class _ItemWithPreffixDropDownState extends State<ItemWithPreffixDropDown> {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // widget.controller = TextEditingController(text: widget.providerData);
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: CustomTypography.kGreyColorlabel,
              ),
        ),
        SizedBox(
          height: Sizing.kHSpacing8 / 2,
        ),
        FormFieldInputPreffix(
         contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
          prefixIcon:widget.preffix ,
          readOnly: true,
          hint: widget.hintText,
          controller: widget.controller,
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return widget.bottomSheet;
              },
            );
          },
          // onTapData: ,
        ),
      ],
    );
  }
}