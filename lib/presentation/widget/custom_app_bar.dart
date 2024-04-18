import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:japaapp/presentation/widget/back_button.dart';

class CustomApbar extends StatelessWidget {
  const CustomApbar(
      {required this.title,
      this.otherWidget,
      this.leadingWidget,
      this.onTapExit,
      super.key});
  final String title;
  final Widget? otherWidget;
  final VoidCallback? onTapExit;
  final Widget? leadingWidget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0.w, right: 0.w,top: 5.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leadingWidget ??
                  CustomBackButton(
                    onTapExit: () {
                      onTapExit == null ? Navigator.pop(context) : onTapExit!();
                    },
                  ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      //color: Colors.green,
                      width: 200,
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            
                            color: const Color(0xff344054)),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              otherWidget ?? const SizedBox.shrink(),
            ],
          ),
          10.verticalSpace
        ],
      ),
    );
  }
}
