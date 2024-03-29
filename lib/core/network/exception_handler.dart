
import 'package:flutter/material.dart';


import 'package:http/http.dart' as http;
import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/core/util/snackbar_util.dart';

void handleException(dynamic e, BuildContext context) {
  if (e is http.ClientException) {
    SnackBarUtil.snackbarError(context, code: ExceptionCode.CANCELLED, message: "Connection Timeout");
  } else {
    print("this is the error from $e");
    debugPrint(e.toString());
    throw Exception(e);
  }
}
