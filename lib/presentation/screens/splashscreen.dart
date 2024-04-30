import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/route/app_router.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/presentation/shared/response_indicators/loading_indicator.dart';
import 'package:lottie/lottie.dart';


@RoutePage()
class SplashScreen extends StatefulWidget  {
  // @override
  // Widget wrappedRoute(BuildContext context) {
  //   return BlocProvider<GetAuthenticatedUserCubit>(
  //     create: (context) =>
  //         getIt<GetAuthenticatedUserCubit>()..getAuthenticatedUser(),
  //     child: this,
  //   );
  // }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
  

}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
   
    Future.delayed(const Duration(seconds: Sizing.kSplashScreenDelay)).then((value) {

    context.router.replaceAll([const StartRoute()]);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomTypography.kWhiteColor,
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Lottie.asset('assets/lottie/logo.json')
              ),
            ),
            
            // LoadingIndicator(
            //   type: LoadingIndicatorType.linearProgressIndicator(),
            // ),
          ],
        ));
  }
}
