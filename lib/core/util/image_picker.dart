

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


String errorMessage = "No image was selected";

pickImage(BuildContext context, ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();

  XFile? file = await imagePicker.pickImage(source: source);

  if (file != null) {
    return await file.readAsBytes();
  }
  else{
     Navigator.pop(context);
  return errorMessage;
  }
  
}


