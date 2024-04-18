// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/presentation/widget/form_field.dart';

class InputFieldWithLabel extends StatefulWidget {
   const InputFieldWithLabel({
    super.key,
    required this.hintText,
    required this.title,
    required this.validateText,
    required this.controller,
    required this.textType,
    this.onChanged
  });
  final TextEditingController controller;
  final String hintText;
  final String title;
  final String validateText;
 final TextInputType textType;
  final Function(String?)? onChanged;

  @override
  State<InputFieldWithLabel> createState() => _InputFieldWithLabelState();
}

class _InputFieldWithLabelState extends State<InputFieldWithLabel> {
  @override
  Widget build(BuildContext context) {
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
          controller: widget.controller,
          textInputType: TextInputType.name,
          hint: widget.hintText,
          onChanged: (value){
             widget.onChanged?.call(value);
          },
          validate: (value) {
            return widget.controller.text.isEmpty
                ? widget.validateText
                : null;
          },
        )
      ],
    );
  }
}