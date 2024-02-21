import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/route/app_router.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/core/util/image_picker.dart';
import 'package:japaapp/core/util/width_constraints.dart';
import 'package:japaapp/presentation/shared/custom_button.dart';


@RoutePage()
class ProfilePicUploadScreen extends StatefulWidget {
  const ProfilePicUploadScreen({super.key});

  @override
  State<ProfilePicUploadScreen> createState() => _ProfilePicUploadScreenState();
}

class _ProfilePicUploadScreenState extends State<ProfilePicUploadScreen> {
  Uint8List? _image;

  void _onSelectImageButton(BuildContext context) async {
    Uint8List img = await pickImage(context, ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  void _onCancelImageSelected() {
    setState(() {
      _image = null;
    });
  }

  Widget _buildTopSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _image != null ? "Profile Photo" : "Add Your Photo",
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: CustomTypography.kGreyColor100),
        ),
        _image != null
            ? const SizedBox()
            : SizedBox(height: (Sizing.kSizingMultiple * 1.5).h),
        _image == null
            ? SizedBox(
                width: 245.w,
                //height: 66.h,
                child: Text(
                  'Adding a photo helps your profile to standout unique, click the image  icon to add your profile picture now.',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: CustomTypography.kGreyColor70,
                          fontSize: 14.0.sp),
                  textAlign: TextAlign.center,
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  Widget _buildInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _image != null
            ? SizedBox(
                width: 245.w,
                //height: 66.h,
                child: Text(
                  'Adding a photo helps your profile to standout unique, click the image  icon to add your profile picture now.',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: CustomTypography.kGreyColor70,
                          fontSize: 14.0.sp),
                  textAlign: TextAlign.center,
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  Widget _buildSkipButton() {
    return Container(
        alignment: Alignment.centerRight,
        child: TextButton(
          child: Text(
            "Skip",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: CustomTypography.kSecondaryColornew,
                fontSize: 14.0.sp),
          ),
          onPressed: () =>context.router.replace(const TabRoute()),
        ));
  }

  Widget _buildProfilePic() {
    return _image != null
        ? Stack(
            children: [
              CircleAvatar(
                backgroundColor: CustomTypography.kGreyColor20,
                radius: 64.r,
                backgroundImage: MemoryImage(_image!),
              ),
              Positioned(
                  bottom: 0,
                  top: -80.h,
                  left: 80.w,
                  child: IconButton(
                      onPressed: () => _onCancelImageSelected(),
                      icon: const Icon(Icons.cancel)))
            ],
          )
        : CircleAvatar(
            backgroundColor: CustomTypography.kGreyColor20,
            radius: 64.r,
            child: GestureDetector(
              onTap: ()=>_onSelectImageButton(context),
              child: Icon(
                Icons.photo_camera_outlined,
                size: Sizing.kIconImagesHeightSize * 2.h,
                weight: 3.0,
                color: CustomTypography.kGreyColor80,
              ),
            ),
          );
  }

  Widget _buildSignInButton() {
    return CustomButton(
      type: ButtonType.regularButton(
          onTap:
              _image != null ? () => context.router.replace(const TabRoute()) : () => _onSelectImageButton(context),
          label: _image != null ? 'Looks Awesome' : 'Start',
          isLoadingMode: false,
          backgroundColor: CustomTypography.kSecondaryColornew,
          borderRadius:
              BorderRadius.all(Radius.circular(Sizing.kBorderRadius * 7.r))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: WidthConstraint(context).withHorizontalSymmetricalPadding(
            child: Column(
              children: [
                //SizedBox(height: (Sizing.kSizingMultiple * 3).h),
                _buildSkipButton(),
                SizedBox(height: (Sizing.kSizingMultiple * 2).h),
                _buildTopSection(),
                SizedBox(height: (Sizing.kSizingMultiple * 2).h),
                _buildProfilePic(),
                SizedBox(height: (Sizing.kSizingMultiple * 2).h),
                _buildInfoSection(),
                SizedBox(height: (Sizing.kSizingMultiple * 2).h),
                _buildSignInButton(),
                // SizedBox(height: (Sizing.kSizingMultiple * 3).h),
                // _buildAuthModeSwitcherSection(),
                // SizedBox(height: (Sizing.kSizingMultiple * 9).h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
