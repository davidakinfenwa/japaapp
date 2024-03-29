import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:japaapp/presentation/screens/process/process.dart';
import 'package:japaapp/presentation/screens/profile/account.dart';
import 'package:japaapp/presentation/screens/journey/journey.dart';
import 'package:japaapp/presentation/screens/onboard/screen_onboard.dart';
import 'package:japaapp/presentation/screens/screens.dart';



part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        //AutoRoute(page: SplashRoute.page, ),
        AutoRoute(page: StartRoute.page,initial: true),
        CustomRoute(page: TabRoute.page,transitionsBuilder: TransitionsBuilders.slideBottom, durationInMilliseconds: 600),
        CustomRoute(page: LandingRoute.page,transitionsBuilder: TransitionsBuilders.slideLeftWithFade, durationInMilliseconds: 600),
        CustomRoute(page: SignInRoute.page,path: '/login',transitionsBuilder: TransitionsBuilders.slideLeftWithFade, durationInMilliseconds: 600),
        CustomRoute(page: EmailVerificationRoute.page,transitionsBuilder: TransitionsBuilders.slideLeftWithFade, durationInMilliseconds: 600),
        CustomRoute(page: OTPVerificationRoute.page,transitionsBuilder: TransitionsBuilders.slideLeftWithFade, durationInMilliseconds: 600),
        CustomRoute(page: CreateAccountRoute.page,path: '/signup',transitionsBuilder: TransitionsBuilders.slideLeftWithFade, durationInMilliseconds: 600),
        CustomRoute(page: AccountBasicInfoRoute.page,path: '/basic_info',transitionsBuilder: TransitionsBuilders.slideLeftWithFade, durationInMilliseconds: 600),
        CustomRoute(page: AccountEducationRoutes.page,path: '/edu_page',transitionsBuilder: TransitionsBuilders.slideLeftWithFade, durationInMilliseconds: 600),
        CustomRoute(page: AccountWorkRoutes.page,path: '/work_page',transitionsBuilder: TransitionsBuilders.slideLeftWithFade, durationInMilliseconds: 600),
        CustomRoute(page: AccountFamilyRoute.page,path: '/family_page',transitionsBuilder: TransitionsBuilders.slideLeftWithFade, durationInMilliseconds: 600),
        CustomRoute(page: AccountAwardRoutes.page,path: '/award_page',transitionsBuilder: TransitionsBuilders.slideLeftWithFade, durationInMilliseconds: 600),
        CustomRoute(page: AccountBudgetRoute.page,path: '/budget_page',transitionsBuilder: TransitionsBuilders.slideLeftWithFade, durationInMilliseconds: 600),
        CustomRoute(page: JourneyLandingRoute.page,path: '/journey_landing_page',transitionsBuilder: TransitionsBuilders.slideLeftWithFade, durationInMilliseconds: 600),
        CustomRoute(page: JourneySelectionRoute.page,path: '/journey_selection_page',transitionsBuilder: TransitionsBuilders.slideLeftWithFade, durationInMilliseconds: 600),
        CustomRoute(page: JourneyCountryPredictedRoute.page,path: '/journey_country_prediction',transitionsBuilder: TransitionsBuilders.slideLeftWithFade, durationInMilliseconds: 600),
        CustomRoute(page: JourneyVisaTypeSelectionRoute.page,path: '/journey_visa_selection',transitionsBuilder: TransitionsBuilders.slideLeftWithFade, durationInMilliseconds: 600),
        CustomRoute(page: JourneyVisaPredictedRoute.page,path: '/journey_visa_prediction',transitionsBuilder: TransitionsBuilders.slideLeftWithFade, durationInMilliseconds: 600),
        CustomRoute(page: JoureyCompareDestinationRoute.page,transitionsBuilder: TransitionsBuilders.slideRight, durationInMilliseconds: 900),
        CustomRoute(page: MyProcessTabRoute.page,transitionsBuilder: TransitionsBuilders.noTransition,),
        CustomRoute(page: SelectedServicesRoute.page,transitionsBuilder: TransitionsBuilders.noTransition, ),

        
      ];
}
