import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/presentation/widget/progress_bar.dart';
import 'package:provider/provider.dart';

class UploadedDocumentWidget extends StatelessWidget {
  const UploadedDocumentWidget(
      {required this.imageName,
      required this.imageSize,
       this.imagePath,
      this.uploadValue = 0,
       this.onDelete,
       this.update,
       this.nav,
      super.key});
  final int? uploadValue;
  final String imageName;
  final int imageSize;
  final File? imagePath;
  final VoidCallback? update;
  final String? nav;
  final VoidCallback? onDelete;
  @override
  Widget build(BuildContext context) {
        // final value =
        // Provider.of<SimpleStateChangesProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) { });

    return InkWell(
      onTap: () {
        // if(update==true)
        // print("update");
        if (update != null) {
    update!();
  }

        // Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFEBECEA)),
          borderRadius: BorderRadius.circular(8),
          //color: Colors.red
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: (){

                    },
                    child: SvgPicture.asset(
                      'assets/svg/fileUpload.svg',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 160,
                              child: Text(
                                imageName,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontSize: 14,
                                  color: CustomTypography.kBlackColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            SvgPicture.asset(
                              'assets/svg/greenCheck.svg',
                            ),
                          ],
                        ),
                        Text(
                          "${(imageSize / 1000).toString()}kb",
                          style:Theme.of(context).textTheme.titleLarge?.copyWith(),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const ContainerWithProgressBarUpload(value:1),
                             SizedBox(
                              width: 55.w,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  // Call the onDelete callback to inform the parent widget
                                  onDelete!();
                                },
                                child:  Icon(
                                  Icons.delete,
                                  color: CustomTypography.kErrorColor50,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



