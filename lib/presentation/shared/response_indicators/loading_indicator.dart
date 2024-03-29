import 'package:flutter/material.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/theme/custom_typography.dart';




class OverlayLoadingIndicator extends StatelessWidget {
  const OverlayLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomTypography.kGreyColor10.withOpacity(.50),
      child: Center(
        child: LoadingIndicatorType.circularProgressIndicator().child,
      ),
    );
  }
}

class LoadingIndicatorType {
  final Widget child;

  const LoadingIndicatorType._({required this.child});

  factory LoadingIndicatorType.circularProgressIndicator(
      {bool isSmallSize = false, bool isMiniSize = false}) {
    return LoadingIndicatorType._(
      child: SizedBox(
        height: isSmallSize
            ? Sizing.kProgressIndicatorSizeSmall
            : isMiniSize
                ? Sizing.kProgressIndicatorSizeMini
                : null,
        width: isSmallSize
            ? Sizing.kProgressIndicatorSizeSmall
            : isMiniSize
                ? Sizing.kProgressIndicatorSizeMini
                : null,
        child: CircularProgressIndicator(
          strokeWidth: Sizing.kProgressIndicatorStrokeWidth,
          color: CustomTypography.kSecondaryColor300,
        ),
      ),
    );
  }

  factory LoadingIndicatorType.linearProgressIndicator() {
    return LoadingIndicatorType._(
      child: LinearProgressIndicator(
        color: CustomTypography.kSecondaryColor300,
        backgroundColor: CustomTypography.kTransparentColor,
      ),
    );
  }

  factory LoadingIndicatorType.overlay(
      {required Widget child, bool isLoading = false}) {
    return LoadingIndicatorType._(
      child: LayoutBuilder(
        builder: (context, constraint) {
          return SizedBox(
            height: constraint.maxHeight,
            width: constraint.maxWidth,
            child: Stack(
              children: [
                child,
                if (isLoading) ...[
                  const OverlayLoadingIndicator(),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  final LoadingIndicatorType type;
  final Alignment? alignment;

  const LoadingIndicator({Key? key, required this.type, this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(alignment: alignment ?? Alignment.center, child: type.child);
  }
}
