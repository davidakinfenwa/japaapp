import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


class UploadDocUi extends StatelessWidget {
  const UploadDocUi({super.key, this.getFilePopUp});
  final VoidCallback? getFilePopUp;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) { });

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20)
          .copyWith(top: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        //color: AppTheme.white,
        border: Border.all(color: const Color(0xFFEBECEA)),
        borderRadius: BorderRadius.circular(8.sp),
      ),
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) => uploadOptionsBody(context));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: const Color(0xFFF8F8F8),
              child: SvgPicture.asset('assets/svg/uploade.svg'),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text.rich(
              TextSpan(
                text: 'Click to upload ',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 14.sp,
                      color: Colors.black,
                    ),
                children: [
                  TextSpan(
                    text: 'or drag and drop',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 14.sp,
                          color: Colors.black,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'image or file (max. 5mb)',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 12.sp,
                    color: Colors.black,
                  ),
            )
          ],
        ),
      ),
    );
  }

  Widget uploadOptionsBody(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) { });
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.sp, vertical: 20),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Text(
                "Upload image",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              SizedBox(
                height: 7.sp,
              ),
               Divider(color: Colors.grey.shade400,),
              SizedBox(
                height: 7.sp,
              ),
              InkWell(
                onTap: () {
                  if (getFilePopUp != null) {
                    getFilePopUp!(); // Call the getFilePopUp callback
                  }
                  Navigator.pop(context);

                  // _getSingleFileFromDevice(isXLSXFile: true);
                },
                child: Text(
                  "Upload from phone",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
              SizedBox(
                height: 7.sp,
              ),
              //const Divider(),
               Divider(color: Colors.grey.shade400,),

              SizedBox(
                height: 7.sp,
              ),
              InkWell(
                onTap: () {
                  //value.setUploadProgress = -1;
                  Navigator.pop(context);
                },
                child: Text(
                  "Take a Picture",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
              SizedBox(
                height: 7.sp,
              ),
              //Take a photo
            ],
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                fixedSize: Size(MediaQuery.of(context).size.width, 61)),
            child: Text(
              "Cancel",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ))
      ]),
    );
  }
}
