// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/core/util/width_constraints.dart';



class SnackBarUtil {
  static void snackbarClose(BuildContext context) =>
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

  static void snackbarError<T>(
    BuildContext context, {
    required ExceptionCode code,
    required T message,
    SnackBarBehavior? behavior,
    Function()? onRefreshCallback,
    bool showAction = false,
  }) {
    final _textStyle = Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: Colors.white,
        );

    final _snackBar = SnackBar(
      behavior: behavior,
      duration: const Duration(seconds: TimeDuration.kSnackbarDuration),
      content: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: WidthConstraint(context).contentWidth),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.error_outline,
              color: CustomTypography.kSecondaryColor300,
            ),
            SizedBox(width: Sizing.kSizingMultiple.h),
            Expanded(
              child: Text(
                message.toString(),
                style: _textStyle,
              ),
            )
          ],
        ),
      ),
      action: !showAction
          ? null
          : SnackBarAction(
              label: 'Retry',
              onPressed: onRefreshCallback ?? () {},
            ),
    );

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(_snackBar);
  }

  static void snackbarLoading(BuildContext context, {required String message}) {
    final _textStyle = Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: Colors.white,
        );

    final _snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: TimeDuration.kSnackbarDuration),
      content: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: WidthConstraint(context).contentWidth),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(child: Text(message, style: _textStyle)),
            const SizedBox(
              height: Sizing.kProgressIndicatorSizeSmall,
              width: Sizing.kProgressIndicatorSizeSmall,
              child: CircularProgressIndicator(
                strokeWidth: Sizing.kProgressIndicatorStrokeWidth,
              ),
            ),
          ],
        ),
      ),
    );

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(_snackBar);
  }
}
