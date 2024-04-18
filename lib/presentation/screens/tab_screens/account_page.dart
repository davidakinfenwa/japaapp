import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:japaapp/business/blocs/account_bloc/get_all_user_data_form_cubit.dart';
import 'package:japaapp/business/blocs/account_bloc/get_user_drop_down_form_cubit.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/dependence/dependence.dart';
import 'package:japaapp/core/route/app_router.dart';
import 'package:japaapp/core/theme/custom_typography.dart';

import 'package:japaapp/core/util/width_constraints.dart';

import 'package:japaapp/presentation/widget/back_button.dart';
import 'package:japaapp/presentation/widget/custom_app_bar.dart';

class AccountTab extends StatefulWidget implements AutoRouteWrapper {
  const AccountTab({super.key});

  @override
  State<AccountTab> createState() => _AccountTabState();
  @override
  Widget wrappedRoute(BuildContext context) {
     //final userInfo = context.read<AccountSnapshotCache>().userInfo;

    return MultiBlocProvider(
      providers: [
        BlocProvider<GetAllUserDataFormCubit>(
          create: (context) => getIt<GetAllUserDataFormCubit>()..userAuthenticatedData(),
        ),
         BlocProvider<GetUserDropdownFormCubit>(
          create: (context) => getIt<GetUserDropdownFormCubit>()..userDropdownData(),
        ),
        // BlocProvider<CreateBasicInformationCubit>(
        //   create: (context) => getIt<CreateBasicInformationCubit>(),
        // ),
      ],
      child: this,
    );
  }
}

class _AccountTabState extends State<AccountTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool muteNotification = false;
  void switchNotification() {
    muteNotification = !muteNotification;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WidthConstraint(context).withHorizontalSymmetricalPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomApbar(
                title: 'Account',
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: (Sizing.kSizingMultiple).h),
                        _buildTopSection(),
                        SizedBox(height: (Sizing.kSizingMultiple).h),
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

  Widget _buildTopSection() {
    return Column(
      children: [
        eachProfileOptionFirst(context,
            iconType: false,
            iconPath: "assets/svg/user.svg",
            optionName: "My profile", onPresssed: () {
          context.router.push(const AccountBasicInfoRoute());
        }),
        eachProfileOption(context,
            iconType: false,
            iconPath: "assets/svg/skill.svg",
            optionName: "Skill up",
            onPresssed: () {}),
        eachProfileOption(context,
            iconType: false,
            iconPath: "assets/svg/settings.svg",
            optionName: "Settings",
            onPresssed: () {}),
        eachProfileOption(context,
            iconType: false,
            iconPath: "assets/svg/contactus.svg",
            optionName: "Contact us",
            onPresssed: () {}),
        eachProfileOption(
          context,
          iconType: false,
          iconPath: "assets/svg/screenmode.svg",
          optionName: "Enable night mode",
          onPresssed: () {},
          child: Container(
           //color: Colors.red,
              height: 50,
             
              child: Switch.adaptive(
                value: muteNotification,
              
                // thumbColor: MaterialStateProperty.resolveWith<Color>(
                //     (Set<MaterialState> states) {
                //   if (states.contains(MaterialState.disabled)) {
                //     return Colors.green.withOpacity(.4);
                //   }
                //   return Colors.green;
                // }),
                splashRadius: 0.2,
                activeColor: CustomTypography.kPrimaryColor200,
                inactiveThumbColor: Color(0xffA7A9A7),
                inactiveTrackColor: Color.fromARGB(255, 222, 225, 222),
                
                onChanged: (bool? value) {
                  print(value);
                  switchNotification();
                },
              ),
            
          ),
        ),
        eachProfileOption(context,
            iconType: false,
            iconPath: "assets/svg/terms.svg",
            optionName: "Terms and Conditions",
            onPresssed: () {}),
        eachProfileOption(context,
            iconType: false,
            iconPath: "assets/svg/updates.svg",
            optionName: "Check for updates",
            onPresssed: () {}),
        eachProfileOptionLast(context,
            iconType: false,
            iconPath: "assets/svg/logout.svg",
            optionName: "Log out",
            onPresssed: () {}),
      ],
    );
  }
}

eachProfileOption(BuildContext context,
    {required String iconPath,
    required String optionName,
    required bool iconType,
    Widget? child,
    bool hasTrailing = true,
    required VoidCallback onPresssed}) {
  return Column(
    children: [
      InkWell(
        onTap: onPresssed,
        splashColor:
            Colors.transparent.withOpacity(0.1), // Customize ripple color
        highlightColor: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(4), // Add border radius
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          width: MediaQuery.of(context).size.width * 0.9,
          height: 56,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 1.16.w, // Width of the border
                color: const Color(0xFFEAECF0),
              ),
              left: BorderSide(
                width: 1.16.w, // Width of the border
                color: const Color(0xFFEAECF0),
              ),
              right: BorderSide(
                width: 1.16.w, // Width of the border
                color: const Color(0xFFEAECF0),
              ),
            ),
           //borderRadius: BorderRadius.circular(4), // Add border radius
          ),
          child: Row(
            children: [
              iconType == true
                  ? Image.asset(iconPath, height: 22)
                  : SvgPicture.asset(iconPath),
              const SizedBox(width: 7),
              Text(
                optionName,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF344053),
                    ),
              ),
              if (hasTrailing)
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      child ??
                          CustomForwardButton(
                            onTapExit: () {},
                          )
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
      const SizedBox(height: 1),
    ],
  );
}

eachProfileOptionFirst(BuildContext context,
    {required String iconPath,
    required String optionName,
    required bool iconType,
    Widget? child,
    bool hasTrailing = true,
    required VoidCallback onPresssed}) {
  return Column(
    children: [
      InkWell(
        onTap: onPresssed,
        splashColor:
            Colors.transparent.withOpacity(0.1), // Customize ripple color
        highlightColor: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(4), // Add border radius
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          width: MediaQuery.of(context).size.width * 0.9,
          height: 56,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 1.16.w, // Width of the border
                color: const Color(0xFFEAECF0),
              ),
              left: BorderSide(
                width: 1.16.w, // Width of the border
                color: const Color(0xFFEAECF0),
              ),
              right: BorderSide(
                width: 1.16.w, // Width of the border
                color: const Color(0xFFEAECF0),
              ),
            ),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(Sizing.kBorderRadius.r),topRight: Radius.circular(Sizing.kBorderRadius.r)), // Add border radius
          ),
          child: Row(
            children: [
              iconType == true
                  ? Image.asset(iconPath, height: 22)
                  : SvgPicture.asset(iconPath),
              const SizedBox(width: 7),
              Text(
                optionName,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF344053),
                    ),
              ),
              if (hasTrailing)
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      child ??
                          CustomForwardButton(
                            onTapExit: () {},
                          )
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
      const SizedBox(height: 1),
    ],
  );
}

eachProfileOptionLast(BuildContext context,
    {required String iconPath,
    required String optionName,
    required bool iconType,
    bool hasTrailing = true,
    required VoidCallback onPresssed}) {
  return Column(
    children: [
      InkWell(
        onTap: onPresssed,
        splashColor:
            Colors.transparent.withOpacity(0.1), // Customize ripple color
        highlightColor: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(4), // Add border radius
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          width: MediaQuery.of(context).size.width * 0.9,
          height: 56,
          decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                  width: 1.16.w, // Width of the border
                  color: const Color(0xFFEAECF0),
                ),
                left: BorderSide(
                  width: 1.16.w, // Width of the border
                  color: const Color(0xFFEAECF0),
                ),
                right: BorderSide(
                  width: 1.16.w, // Width of the border
                  color: const Color(0xFFEAECF0),
                ),
                bottom: BorderSide(
                  width: 1.16.w, // Width of the border
                  color: const Color(0xFFEAECF0),
                )),
             borderRadius: BorderRadius.only(bottomLeft: Radius.circular(Sizing.kBorderRadius.r),bottomRight: Radius.circular(Sizing.kBorderRadius.r)),// Add border radius
          ),
          child: Row(
            children: [
              iconType == true
                  ? Image.asset(iconPath, height: 22)
                  : SvgPicture.asset(iconPath),
              const SizedBox(width: 7),
              Text(
                optionName,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF344053),
                    ),
              ),
              if (hasTrailing)
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomForwardButton(
                        onTapExit: () {},
                      )
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
      const SizedBox(height: 1),
    ],
  );
}
