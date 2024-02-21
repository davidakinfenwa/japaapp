// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/theme/custom_typography.dart';


class StaggerTile extends StatefulWidget {
  const StaggerTile(
      {Key? key, required this.image, required this.name, required this.height})
      : super(key: key);
  final String image;
  final String name;
  final double height;

  @override
  State<StaggerTile> createState() => _StaggerTileState();
}

class _StaggerTileState extends State<StaggerTile> {
  // double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: 156.w,
      decoration: BoxDecoration(
          color: CustomTypography.kBackgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          border: Border.all(color: const Color(0xffE3E7EC), width: 1)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CachedNetworkImage(
            //   imageUrl: widget.image,
            //   fit: BoxFit.fill,
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 14, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: CustomTypography.kBackgroundColor,
                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                        border: Border.all(color: const Color(0xffE3E7EC), width: 1)),
                    child: Center(child: SvgPicture.asset(widget.image)),
                  ),
                  SizedBox(
                    height: Sizing.kHSpacing8 * 2,
                  ),
                  Text(
                    widget.name,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: CustomTypography.kGreyColor100,
                        fontFamily: "inter",
                        fontSize: 16.0.sp),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
