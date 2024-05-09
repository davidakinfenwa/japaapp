import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:japaapp/business/blocs/journey/intending_migrant_form_cubit.dart';
import 'package:japaapp/business/snapshot/tabscreen_provider.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/dependence/dependence.dart';

import 'package:japaapp/core/route/app_router.dart';
import 'package:japaapp/core/theme/custom_typography.dart';

import 'package:japaapp/core/util/width_constraints.dart';
import 'package:japaapp/domain/model/news/news_model.dart';
import 'package:japaapp/presentation/widget/back_button.dart';
import 'package:timeago/timeago.dart' as timeago;


import 'package:provider/provider.dart';

@RoutePage()
class DetailNewsScreen extends StatefulWidget implements AutoRouteWrapper {
  const DetailNewsScreen({
    super.key,
    required this.newModel
  });
 final NewsModel newModel;


  @override
  State<DetailNewsScreen> createState() => _DetailNewsScreenState();


  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<IntendingMigrantCubit>(
            create: (context) =>
                getIt<IntendingMigrantCubit>()..intendingMigrant()),
      ],
      child: this,
    );
  }
}

class _DetailNewsScreenState extends State<DetailNewsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBackground(),
              SizedBox(height: (Sizing.kSizingMultiple).h),
              WidthConstraint(context).withHorizontalSymmetricalPadding(
                child: Column(
                  children: [
                    _buildNewsContentSection(),
                  ],
                ),
              ),
              SizedBox(height: (Sizing.kSizingMultiple).h),
            ],
          ),
        ),
        Positioned(
            top: 40,
            child: WidthConstraint(context).withHorizontalSymmetricalPadding(
                child: Container(child: _buildSalutationSection()))),
      ],
    );
  }

  Widget _buildBackground() {
    return  Container(
      width: MediaQuery.sizeOf(context).width,
      child: Image.network(
                  widget.newModel.mediaImageUrl,
                  // width: 86.w,
                  // height: 134.h,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Center(
                        child: CircularProgressIndicator.adaptive(
                          // color: Custom,
                          strokeWidth: 2,
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes ?? 1)
                              : null,
                        ),
                      );
                    }
                  },
                ),
    );
    
    // Image.asset(
    //   'assets/images/newimg.png',
    //   fit: BoxFit.cover,
    // );
  }
    String formatTimeAgo(DateTime time) {
  DateTime currentTime = DateTime.now();
  Duration difference = currentTime.difference(time);
  return timeago.format(currentTime.subtract(difference));
}

  Widget _buildSalutationSection() {
      
    return const CustomBackButton();
  }

  Widget _buildNewsContentSection() {
    String providedDate = widget.newModel.date.toString();
  String providedTime = widget.newModel.time.toString();

  // Combine date and time into a single string
  String combinedDateTimeString = '$providedDate $providedTime';

  // Parse the combined string into a DateTime object
  DateTime combinedDateTime = DateFormat('yyyy-MM-dd HH:mm:ss').parse(combinedDateTimeString);
    //var bottomNavCProvider = Provider.of<TabScreenNotifier>(context);
    return Container(
      //color: Colors.red,
        width: MediaQuery.sizeOf(context).width ,
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: MediaQuery.sizeOf(context).width ,
             // height: 50,
              child: Text(
                widget.newModel.title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                     
                    ),
      
                //overflow: TextOverflow.ellipsis,
              )),
          SizedBox(
            height: Sizing.kSizingMultiple.h,
          ),
          // Text(
          //   "2h ago · by Isabella Kwai",
          //   style: Theme.of(context).textTheme.titleSmall?.copyWith(
          //       color: const Color(0xFF6C7072), fontWeight: FontWeight.w400),
          // ),

             Text.rich(
                      TextSpan(
                        text: formatTimeAgo(combinedDateTime),
                        children: [
                          TextSpan(
                            text: ' . by ${widget.newModel.postedBy}',
                            style:Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: const Color(0xFF6C7072),
                            fontWeight: FontWeight.w400),
                          ),
                        ],
                        style:
                            Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: CustomTypography.kPrimaryColor300,
                      fontWeight: FontWeight.w400),
                      ),
                    ),

            SizedBox(
            height: Sizing.kSizingMultiple.h,
          ),
          Text(
           widget.newModel.body,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: const Color(0xFF0D0D0D), 
                
                ),
          ),
        ],
      ),
    );
  }
}
