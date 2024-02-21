import 'package:flutter/material.dart';
import 'package:japaapp/presentation/widget/datail_task_tab_widget.dart';


class DetailTaskTabPages extends StatelessWidget {
  DetailTaskTabPages({
    super.key,
    required this.tabIndex,
  });
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: tabIndex == 0
                ? const DatailSection()
                : tabIndex == 1
                    ? const CommentSection()
                    : tabIndex == 2
                        ? PaymentSection()
                        : CircularProgressIndicator())
      ]),
    );
  }
}
