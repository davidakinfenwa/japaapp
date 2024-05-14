import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:japaapp/business/blocs/bloc_state.dart';
import 'package:japaapp/business/blocs/journey/intending_migrant_form_cubit.dart';
import 'package:japaapp/business/blocs/journey/new_migrant_process_form_cubit.dart';
import 'package:japaapp/business/snapshot/tabscreen_provider.dart';
import 'package:japaapp/business/snapshot_cache/journey_snapshot_cache.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/dependence/dependence.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/core/route/app_router.dart';

import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/core/util/keyboard_util.dart';
import 'package:japaapp/core/util/width_constraints.dart';
import 'package:japaapp/domain/form_params/form_params.dart';
import 'package:japaapp/domain/model/journey/intending_migrant_model.dart';
import 'package:japaapp/domain/model/journey/new_migrant_model.dart';
import 'package:japaapp/presentation/shared/alert_dialog.dart';
import 'package:japaapp/presentation/shared/custom_button.dart';
import 'package:japaapp/presentation/shared/response_indicators/error_indicator.dart';

import 'package:japaapp/presentation/widget/custom_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

@RoutePage()
class IntendingMigrantScreen extends StatefulWidget
    implements AutoRouteWrapper {
  const IntendingMigrantScreen({super.key, required this.nav});
  final String nav;

  @override
  State<IntendingMigrantScreen> createState() => _IntendingMigrantScreenState();
  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<IntendingMigrantCubit>(
            create: (context) =>
                getIt<IntendingMigrantCubit>()..intendingMigrant()),

        BlocProvider<NewMigrantCubit>(
            create: (context) => getIt<NewMigrantCubit>()),

        // BlocProvider<TaskActionCubit>(create: (context) => getIt<TaskActionCubit>()),
      ],
      child: this,
    );
  }
}

class _IntendingMigrantScreenState extends State<IntendingMigrantScreen> {
  int selectedIteminList = -1;
  int selectedMeansOfPayment = -2;
  Country? country;
  String countryName="";

  // List<int> selectedItemsData = [];

  final List<String> items = [
    'Admission',
     'Community',
     'Employment',
     'Housing',
   'Permanent Residency',
  ];
  late List<bool> selectedItemsData;
  late List<bool> selectedItemsDataNew;

  Future<String> fetchCountryCode() async {
    final response = await http.get(Uri.parse("http://ip-api.com/json"));
    print(response);
    final result = json.decode(response.body);
    final countryCode = result["country"];
    return countryCode;
  }

  @override
  void initState() {
    super.initState();
    selectedItemsData = List.filled(items.length, false, growable: true);
    setState(() {
      widget.nav == "home"
          ? getIt<IntendingMigrantCubit>().intendingMigrant()
          : "";
    });
    selectedItemsDataNew = List.filled(30, false, growable: true);
    // selectedItemsDataNew = List.filled(getIt<JourneySnapshotCache>().intendingMigrantProcessModel.data.length, false, growable: true);
    // widget.nav == "home" ? LoadingData.showCustomDialog(context) : "";
    fetchCountryCode().then((countrycode) {
      setState(() {
        //country = CountryParser.tryParseCountryCode(countrycode);
        countryName=countrycode;
      });
    });
  }

  List<String> selectedTitles = [];
  DateTime userDOB = DateTime.now();

  String toDate = '';

  Future<void> _selectDate( BuildContext context, String nav, String userId) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2050),
    );

    if (picked != null && picked != DateTime.now()) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      setState(() {
        userDOB = picked;
        toDate = formattedDate;
        context.read<IntendingMigrantCubit>().setDueDate(
            setDueDateFormParams: SetDueDateFormParams(
                id: userId.toString(), dueDate: formattedDate.toString()));
        context.read<JourneySnapshotCache>().notifyAllListeners();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
   // print(country?.displayNameNoCountryCode);
   print(countryName);
    var bottomNavCProvider = Provider.of<TabScreenNotifier>(context);
    return WillPopScope(
      onWillPop: () async {
        BotToast.cleanAll();
        bottomNavCProvider.pageIndex = 0;
        context.router.replaceAll([const TabRoute()]);
        return true;
      },
      child: Scaffold(
          // backgroundColor: Colors.white,
          body: _buildProcessforSectionForIntendingOrNewMigrant()),
    );
  }

  Widget _buildProcessforSectionForIntendingOrNewMigrant() {
    return Stack(
      children: [
        _buildBackground(),
        WidthConstraint(context).withHorizontalSymmetricalPadding(
          child: Column(
            children: [
              SizedBox(height: (Sizing.kSizingMultiple * 4).h),
              Stack(
                children: [
                  _buildSalutationSection(),
                ],
              ),
              Expanded(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: (Sizing.kSizingMultiple).h),
                          widget.nav == "home"
                              ? _buildIntendedImmigrantSection()
                              : _buildNewImmigrantInNeeedSection(),
                          SizedBox(height: (Sizing.kSizingMultiple).h),
                          widget.nav == "home"
                              ? const SizedBox()
                              : _buildNotice()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBackground() {
    return Opacity(
      opacity: 0.4, // Set opacity value (0.0 to 1.0)
      child:
          //  SvgPicture.asset("assets/svg/chat.svg"),
          Image.asset(
        'assets/images/neew.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildSalutationSection() {
    var bottomNavCProvider = Provider.of<TabScreenNotifier>(context);
    return CustomApbar(
      title: 'My Process',
      onTapExit: () {
        BotToast.cleanAll();
        bottomNavCProvider.pageIndex = 0;
        context.router.replaceAll([const TabRoute()]);
      },
    );
  }

  Widget _buildIntendedImmigrantSection() {
    var bottomNavCProvider = Provider.of<TabScreenNotifier>(context);

    return BlocConsumer<IntendingMigrantCubit,
            BlocState<Failure<ExceptionMessage>, IntendingMigrantProcessModel>>(
        listener: (context, state) {
      state.maybeMap(
        orElse: () => null,
        success: (state) {
          if (state.data.status == "success") {
            if (state.data.message == "Analysis Completed") {
            } else {
              showCustomAlertDialog(context,
                  subtitle: state.data.message.toString(),
                  title: 'Success',
                  backgroundColor: true,
                  buttonText: "Dismiss", onTap: () {
                context.router.maybePop();
              }, alertType: AlertType.success);
            }
            context.read<JourneySnapshotCache>().notifyAllListeners();
          }
        },
        error: (state) {
          showCustomAlertDialog(context,
              subtitle: state.failure.exception.message.toString(),
              title: 'Error',
              backgroundColor: true,
              buttonText: "Dismiss", onTap: () {
            context.router.maybePop();
            bottomNavCProvider.pageIndex = 1;
            context.router.replaceAll([const TabRoute()]);
          }, alertType: AlertType.warning);
        },
      );
    }, builder: (context, state) {
      final checkList =
          context.read<JourneySnapshotCache>().intendingMigrantProcessModel;
      return state.maybeMap(
        orElse: () {
          if (checkList != IntendingMigrantProcessModel.empty()) {
            return intendingMigrantListBloc(checkList);
          }

          return const Center(child: CircularProgressIndicator.adaptive());
        },
        success: (_) => intendingMigrantListBloc(checkList),
        error: (state) {
          if (checkList != IntendingMigrantProcessModel.empty()) {
            return intendingMigrantListBloc(checkList);
          }

          return Center(
            child: WidthConstraint(context).withHorizontalSymmetricalPadding(
              child: ErrorIndicator(
                type: ErrorIndicatorType.simple(
                  // onRetryCallback: () => _onGetSenderIdListCallback(),
                  code: state.failure.exception.code,
                  message: state.failure.exception.message.toString(),
                ),
              ),
            ),
          );
        },
      );

      // final isLoading = state is Loading<Failure<ExceptionMessage>, IntendingMigrantProcessModel>;
      // print("this is the loading kkkkkk $isLoading");

      // return  intendingMigrantListBloc(checkList);
    });
  }

  Column intendingMigrantListBloc(IntendingMigrantProcessModel checkList) {
    return Column(children: [
      ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: checkList.data.length > 1 ? checkList.data.length - 1 : 0,
          itemBuilder: (context, index) {
            final isSelected = selectedItemsDataNew[index];
            final result = checkList.data[index];
            if (checkList.data.isEmpty) {
              return Container(
                padding: EdgeInsets.fromLTRB(0, 190.h, 0, 0),
                alignment: Alignment.center,
                height: MediaQuery.sizeOf(context).height * 0.5.h,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/empty.png"))),
                child: Text(
                  "Wait a minute, you have no record yet. Click the button below to get started.",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        // color: Colors.black,
                        color: const Color(0xFF344054),

                        fontWeight: FontWeight.w500,
                      ),
                  textAlign: TextAlign.center,
                ),
              );

              //  (child: Text("No data", style: TextStyle(color: Colors.black),),);
            }

            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // final isSelected = selectedItemsData.contains(index);
                  InkWell(
                    onTap: () {
                      setState(() {
                        // Toggle selection for the tapped item
                        selectedItemsDataNew[index] = !isSelected;

                        if (isSelected || result.status == "completed") {
                          // If already selected, remove title from list
                          context.read<IntendingMigrantCubit>().markTask(
                              markTaskDoneFormParams: MarkTaskDoneFormParams(
                                  id: result.id.toString(), status: "pending"));
                          selectedTitles.remove(checkList.data[index].id);
                        } else {
                          // If not selected, add title to list
                          context.read<IntendingMigrantCubit>().markTask(
                              markTaskDoneFormParams: MarkTaskDoneFormParams(
                                  id: result.id.toString(),
                                  status: "completed"));
                          selectedTitles.add(checkList.data[index].id);
                        }
                        // getIt<IntendingMigrantCubit>().intendingMigrant();
                        context
                            .read<JourneySnapshotCache>()
                            .notifyAllListeners();
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(2.h),
                            child: Center(
                                child: SvgPicture.asset(
                              isSelected || result.status == "completed"
                                  ? "assets/svg/mcheck.svg"
                                  : "assets/svg/muncheck.svg",
                              // height: 30.h,
                              // width: 30,
                            ))),
                        SizedBox(
                          width: Sizing.kSizingMultiple.h,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.65.w,
                          child: Text(
                            result.task,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                    // color: Colors.black,
                                    color: const Color(0xFF344054),
                                    fontWeight: FontWeight.w500,
                                    decoration: isSelected ||
                                            result.status == "completed"
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: Sizing.kWSpacing10.h,
                  ),

                  Expanded(
                    child: PopupMenuButton(
                        color: const Color(0xFFFFFFFF),
                        shadowColor: Colors.white,
                        surfaceTintColor: Colors.white,
                        icon: Icon(
                          Icons.more_horiz,
                          color: CustomTypography.kPrimaryColor300,
                          size: 24,
                        ),
                        //  elevation: 0,
                        position: PopupMenuPosition.under,
                        itemBuilder: (_) => <PopupMenuItem<String>>[
                              PopupMenuItem<String>(
                                value: 'due date',
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/datee.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                    SizedBox(
                                      width: Sizing.kWSpacing8,
                                    ),
                                    Text(
                                      'Set due date',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xFF344054),
                                              // fontFamily: "inter",
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.0.sp),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  _selectDate(
                                      context, "home", result.id.toString());
                                },
                              ),
                              PopupMenuItem<String>(
                                value: 'Delete',
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                        "assets/svg/deletebin.svg"),
                                    SizedBox(
                                      width: Sizing.kWSpacing8,
                                    ),
                                    Text(
                                      'Delete',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: const Color(0xFF344054),
                                              // fontFamily: "inter",
                                              fontStyle: FontStyle.normal,
                                              fontSize: 14.0.sp),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  showCustomAlertDialogWithWhite(context,
                                      subtitle:
                                          "Are you sure you want to delete",
                                      title: 'Delete Task',
                                      backgroundColor: true,
                                      buttonText: "Dismiss", onTap: () {
                                    context.router.maybePop();
                                  }, onTapSeconButton: () {
                                    setState(() {
                                      context
                                          .read<IntendingMigrantCubit>()
                                          .deleteTask(
                                              deleteTaskFormParams:
                                                  DeleteTaskFormParams(
                                                      id: result.id
                                                          .toString()));
                                      context
                                          .read<JourneySnapshotCache>()
                                          .notifyAllListeners();
                                      context.router.maybePop();
                                    });
                                  }, alertType: AlertType.warning);
                                },
                              ),
                            ]),
                  ),

                  SizedBox(
                    width: 3.w,
                  ),
                ],
              ),
            );
          }),
      SizedBox(height: (Sizing.kSizingMultiple * 4).h),
      checkList.data.length > 1 ? _buildActionButton() : const SizedBox()
    ]);
  }

  Widget _buildActionButton() {
    return Column(
      children: [
        CustomButton(
          type: ButtonType.withBorderLongButton(
              onTap: () {
                //context.router.push(const TabRoute());
              },
              label: 'Speak with a consultant',
              isLoadingMode: false,
              //: CustomTypography.kPrimaryColor200,
              borderColor: CustomTypography.kPrimaryColor300,
              textColor: CustomTypography.kPrimaryColor300,
              borderRadius: BorderRadius.all(
                  Radius.circular(Sizing.kBorderRadius * 7.r))),
        ),
      ],
    );
  }

  Widget _buildNewImmigrantInNeeedSection() {
    bool isAllSelected() {
      // Check if all items are selected
      return selectedItemsData.every((item) => item);
    }

    void toggleSelectAll(bool value) {
      setState(() {
        selectedItemsData = List.filled(items.length, value);

        if (value) {
          selectedTitles =
              items.map((item) => item).toList();
        } else {
          selectedTitles.clear();
        }
      });
    }

    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              toggleSelectAll(selectedTitles.length != items.length);
            });
          },
          child: Container(
            padding: EdgeInsets.all(Sizing.kHSpacing10),
            decoration: BoxDecoration(
                color: CustomTypography.kGreyColor20,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Sizing.kBorderRadius * 2.r),
                  topRight: Radius.circular(Sizing.kBorderRadius * 2.r),
                ),
                border: const Border(
                    left: BorderSide(color: Color(0xFFEAECF0)),
                    top: BorderSide(color: Color(0xFFEAECF0)),
                    right: BorderSide(color: Color(0xFFEAECF0)),
                    bottom: BorderSide(
                      width: 1.16,
                      color: Color(0xFFEAECF0),
                    ))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Select All",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: const Color(0xFF667084),
                      fontWeight: FontWeight.w500),
                ),
                SvgPicture.asset(
                  isAllSelected()
                      ? "assets/svg/mcheck.svg"
                      : "assets/svg/muncheck.svg",
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 8, 0),
          child: Column(children: [
            ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  final data = items[index];
                  final isSelected = selectedItemsData[index];
                  // final isSelected = selectedItemsData.contains(index);
                  return InkWell(
                    onTap: () {
                      setState(() {
                        // Toggle selection for the tapped item
                        selectedItemsData[index] = !isSelected;

                        if (isSelected) {
                          // If already selected, remove title from list
                          selectedTitles.remove(data);
                        } else {
                          // If not selected, add title to list
                          selectedTitles.add(data);
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.65.w,
                            child: Text(
                              data,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color: const Color(0xFF344054),
                                      fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.all(2.h),
                              child: Center(
                                  child: SvgPicture.asset(
                                isSelected
                                    ? "assets/svg/mcheck.svg"
                                    : "assets/svg/muncheck.svg",
                                // height: 30.h,
                                // width: 30,
                              ))),
                        ],
                      ),
                    ),
                  );
                }),
          ]),
        ),
        SizedBox(height: (Sizing.kSizingMultiple * 4).h),
        _buildActionContinueButton()
      ],
    );
  }

  // Widget _buildActionContinueButton() {
  //   return Column(
  //     children: [
  //       CustomButton(
  //         type: ButtonType.regularButton(
  //             onTap: () {
  //               context.router.replace(
  //                   SelectedServicesRoute(selectedServices: selectedTitles));
  //               //print(selectedTitles);
  //             },
  //             label: 'Continue',
  //             isLoadingMode: false,
  //             backgroundColor: CustomTypography.kPrimaryColor300,
  //             textColor: CustomTypography.kWhiteColor,
  //             borderRadius: BorderRadius.all(
  //                 Radius.circular(Sizing.kBorderRadius * 7.r))),
  //       ),
  //     ],
  //   );
  // }

  
  void _onUserSignUpCallback() async {
    KeyboardUtil.hideKeyboard(context);
    

   final newMigrantList=NewMigrantFormParams(countryOfResidence: countryName, interest: selectedTitles);
    context.read<NewMigrantCubit>().newMigrant(migrantFormParams: newMigrantList);
  }

Widget _buildActionContinueButton() {
    return BlocConsumer<NewMigrantCubit,
        BlocState<Failure<ExceptionMessage>, NewMigrantResponseModel>>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () => null,
          success: (state) {
            if (state.data.status == "success") {
              // clear form inputs
              context.router.replace(
                    SelectedServicesRoute(selectedServices: selectedTitles));

              context.router.replace(const TabRoute());
            } else {
              showCustomAlertDialog(context,
                  subtitle: state.data.message,
                  title: 'Error',
                  backgroundColor: true,
                  buttonText: "Dismiss", onTap: () {
                context.router.maybePop();
              }, alertType: AlertType.warning);
              // SnackBarUtil.snackbarError<String>(
              //   context,
              //   code: ExceptionCode.UNDEFINED,
              //   message: state.data.message,
              // );
            }
          },
          error: (state) {
            showCustomAlertDialog(context,
                subtitle: state.failure.exception.message.toString(),
                title: 'Error',
                backgroundColor: true,
                buttonText: "Dismiss", onTap: () {
              context.router.maybePop();
            }, alertType: AlertType.warning);
            // SnackBarUtil.snackbarError<String>(
            //   context,
            //   code: state.failure.exception.code,
            //   message: state.failure.exception.message.toString(),
            //   onRefreshCallback: () => _onUserSignUpCallback(),
            // );
          },
        );
      },
      builder: (context, state) {
        final isLoading =
            state is Loading<Failure<ExceptionMessage>, NewMigrantResponseModel>;

        return Column(
          children: [
            CustomButton(
              type: ButtonType.regularButton(
                  onTap: () => _onUserSignUpCallback(),
                  label: 'Continue',
                  isLoadingMode: isLoading,
                  backgroundColor: CustomTypography.kPrimaryColor300,
                  textColor: CustomTypography.kWhiteColor,
                  borderRadius: BorderRadius.all(
                      Radius.circular(Sizing.kBorderRadius * 7.r))),
            ),
           
          ],
        );
      },
    );
  }
  Widget _buildNotice() {
    return Container(
      width: MediaQuery.sizeOf(context).width.w,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 5.0.w),
            child: SvgPicture.asset(
              'assets/svg/notices.svg',
            ),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.8,
            child: RichText(
                text: TextSpan(
              text: 'Note:',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: const Color(0xFF344054),
                  fontWeight: FontWeight.w700,
                  fontSize: 13.sp),
              children: <TextSpan>[
                TextSpan(
                  text:
                      ' you can choose the list of services you need help with',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: const Color(0xFF344054),
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp),
                ),
                // TextSpan(text: '!'),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
