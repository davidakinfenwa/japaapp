import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/route/app_router.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/presentation/shared/response_indicators/loading_indicator.dart';


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
  
  // @override
  // Widget wrappedRoute(BuildContext context) {
  //   // TODO: implement wrappedRoute
  //   throw UnimplementedError();
  // }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
   
    Future.delayed(const Duration(seconds: Sizing.kSplashScreenDelay));
    context.router.replaceAll([const StartRoute()]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomTypography.kPrimaryColor200,
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/logo/ytask.png',
                  width: (Sizing.kSizingMultiple * 30).w,
                ),
              ),
            ),
            
            LoadingIndicator(
              type: LoadingIndicatorType.linearProgressIndicator(),
            ),
          ],
        ));
  }
}
