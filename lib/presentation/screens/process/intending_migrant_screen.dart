import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:japaapp/business/blocs/bloc_state.dart';
import 'package:japaapp/business/blocs/journey/intending_migrant_form_cubit.dart';
import 'package:japaapp/business/snapshot/tabscreen_provider.dart';
import 'package:japaapp/business/snapshot_cache/journey_snapshot_cache.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/dependence/dependence.dart';
import 'package:japaapp/core/exceptions/exceptions.dart';
import 'package:japaapp/core/route/app_router.dart';

import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/core/util/width_constraints.dart';
import 'package:japaapp/domain/model/journey/intending_migrant_model.dart';
import 'package:japaapp/presentation/shared/alert_dialog.dart';
import 'package:japaapp/presentation/shared/custom_button.dart';


import 'package:japaapp/presentation/widget/custom_app_bar.dart';
import 'package:provider/provider.dart';

@RoutePage()
class IntendingMigrantScreen extends StatefulWidget implements AutoRouteWrapper {
  const IntendingMigrantScreen({super.key, required this.nav});
  final String nav;

  @override
  State<IntendingMigrantScreen> createState() => _IntendingMigrantScreenState();
    @override
  Widget wrappedRoute(BuildContext context) {
    
    return MultiBlocProvider(
      providers: [
         BlocProvider<IntendingMigrantCubit>(
          create: (context) => getIt<IntendingMigrantCubit>()..intendingMigrant(),
        ),
     
      ],
      child: this,
    );
  }
}

class _IntendingMigrantScreenState extends State<IntendingMigrantScreen> {
  int selectedIteminList = -1;
    int selectedMeansOfPayment = -2;
  // List<int> selectedItemsData = [];

  final List<Map<String, dynamic>> items = [
    {"title": 'Admission'},
    {"title": 'Community'},
    {"title": 'Employment'},
    {"title": 'Houseing'},
    {"title": 'Permanet Residency'},
  ];
  late List<bool> selectedItemsData;

  @override
  void initState() {
    super.initState();
    selectedItemsData = List.filled(items.length, false, growable: true);
    // widget.nav=="home"? getIt<IntendingMigrantCubit>().intendingMigrant():"";
    widget.nav=="home"? LoadingData.showCustomDialog(context):"";
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // widget.nav=="home"? LoadingData.showCustomDialog(context):"";
   
  }
  

  List<String> selectedTitles = [];
  

  @override
  Widget build(BuildContext context) {
    var bottomNavCProvider = Provider.of<TabScreenNotifier>(context);
    return WillPopScope(
      onWillPop: ()async{
        BotToast.cleanAll();
        bottomNavCProvider.pageIndex=0;
        context.router.replaceAll([TabRoute()]);
        return true;
      },
      child: Scaffold(
        // backgroundColor: Colors.white,
        body:_buildProcessforSectionForIntendingOrNewMigrant()
      ),
    );
  }




Widget _buildProcessforSectionForIntendingOrNewMigrant(){
  return  Stack(
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
              
                          //   SizedBox(height: (Sizing.kSizingMultiple * 4).h),
                          //  widget.nav == "home"
                          //       ? _buildActionButton()
                          //       : _buildActionContinueButton(),
                            SizedBox(height: (Sizing.kSizingMultiple).h),
                            widget.nav == "home"? const SizedBox(): _buildNotice()
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
    return  CustomApbar(
      title: 'My Process',
      onTapExit: (){
         BotToast.cleanAll();
        bottomNavCProvider.pageIndex=0;
        context.router.replaceAll([TabRoute()]);
      },
    );
  }

  Widget _buildIntendedImmigrantSection() {
    return BlocConsumer<IntendingMigrantCubit,
        BlocState<Failure<ExceptionMessage>, IntendingMigrantProcessModel>>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () => null,
          success: (state) {
            if (state.data.status=="success") {
              // clear form inputs
             // _formKey.currentState!.reset();
             BotToast.cleanAll();
            
            } else {
              BotToast.cleanAll();
            }
          },
          error: (state) {
            BotToast.cleanAll();
              showCustomAlertDialog(context, subtitle: state.failure.exception.message.toString(), title: 'Error',backgroundColor: true,buttonText: "Dismiss",onTap: (){context.router.maybePop();},alertType: AlertType.warning);

          },
        );
      },
      builder: (context, state) {
        // BotToast.cleanAll();
        final isLoading = state is Loading<Failure<ExceptionMessage>,   IntendingMigrantProcessModel>;
        final _checkList = context.watch<JourneySnapshotCache>().intendingMigrantProcessModel;

        return   Column(
        children:[
           ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
         itemCount: _checkList.data.length > 1 ? _checkList.data.length - 1 : 0, 
         itemBuilder:  (context, index) {
          if (_checkList.data.isEmpty ) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: 
              Text("No Data Found",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: const Color(0xFF344054),
                         fontWeight: FontWeight.w500),),),
            );
          } else {
              return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  selectedIteminList = index ;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.all(2.h),
                      child: Center(
                          child: SvgPicture.asset(
                        selectedIteminList == index
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
                      _checkList.data[index].task,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          // color: Colors.black,
                          color: const Color(0xFF344054),
                          //fontSize: 16.sp,
                          //fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500),
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
                            
                        color: Color(0xFFFFFFFF),
                        shadowColor: Colors.white,
                        surfaceTintColor: Colors.white,
                        icon:  Icon(
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
                                      SizedBox(width: Sizing.kWSpacing8,),
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
                              onTap: () {},
                            ),
              
                            PopupMenuItem<String>(
                              value: 'Delete',
                              child: Row(
                                children: [
                                      SvgPicture.asset("assets/svg/deletebin.svg"),
                                      SizedBox(width: Sizing.kWSpacing8,),
                                  Text(
                                    'Delete',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color:  const Color(0xFF344054),
                                            // fontFamily: "inter",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14.0.sp),
                                  ),
                                ],
                              ),
                              onTap: () {},
                            ),
                            ]),
            ),
            // InkWell(
            //   onTap: (){
            //     print("i am pressed");
                
            //   },
            //   child: SvgPicture.asset("assets/svg/threedot.svg")),

           
            SizedBox(
              width: 3.w,
            ),
          ],
        ),
      );
          }

    
    }
    
    ),
     SizedBox(height: (Sizing.kSizingMultiple * 4).h),
  _checkList.data.length > 1?   _buildActionButton():SizedBox()
    ]) ;
      },
    );
    
    
    
   
  }



  Widget _buildlistPopItem() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          children: [
            InkWell(
              onTap: () {
                // Navigator.of(context)
                //   ..pop()
                //   ..push(
                //     MaterialPageRoute<SecondRoute>(
                //       builder: (context) => SecondRoute(),
                //     ),
                //   );
              },
              child: Container(
                height: 50,
                color: Colors.amber[100],
                child: const Center(child: Text('Entry A')),
              ),
            ),
            const Divider(),
            Container(
              height: 50,
              color: Colors.amber[200],
              child: const Center(child: Text('Entry B')),
            ),
            const Divider(),
            Container(
              height: 50,
              color: Colors.amber[300],
              child: const Center(child: Text('Entry C')),
            ),
          ],
        ),
      ),
    );
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
              borderColor: CustomTypography.kPrimaryColor200,
              textColor: CustomTypography.kPrimaryColor200,
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
              items.map((item) => item["title"] as String).toList();
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
                          selectedTitles.remove(data['title']);
                        } else {
                          // If not selected, add title to list
                          selectedTitles.add(data['title']);
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.65.w,
                            child: Text(
                              data['title'],
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

  Widget _buildActionContinueButton() {
    return Column(
      children: [
        CustomButton(
          type: ButtonType.regularButton(
              onTap: () {
                context.router.replace( SelectedServicesRoute(selectedServices: selectedTitles));
                //print(selectedTitles);
              },
              label: 'Continue',
              isLoadingMode: false,
              backgroundColor: CustomTypography.kPrimaryColor300,
              textColor: CustomTypography.kWhiteColor,
              borderRadius: BorderRadius.all(
                  Radius.circular(Sizing.kBorderRadius * 7.r))),
        ),
      ],
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

