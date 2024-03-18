import 'package:auto_route/auto_route.dart';
import 'package:japaapp/presentation/screens/account/account.dart';
import 'package:japaapp/presentation/screens/journey/journey.dart';
import 'package:japaapp/presentation/screens/onboard/screen_onboard.dart';
import 'package:japaapp/presentation/screens/screens.dart';



part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: SplashRoute.page, ),
        AutoRoute(page: StartRoute.page,initial: true),
        AutoRoute(page: TabRoute.page),
        AutoRoute(page: LandingRoute.page),
        AutoRoute(page: SignInRoute.page,path: '/login'),
        AutoRoute(page: EmailVerificationRoute.page),
        AutoRoute(page: OTPVerificationRoute.page),
        AutoRoute(page: CreateAccountRoute.page,path: '/signup'),
        AutoRoute(page: AccountBasicInfoRoute.page,path: '/basic_info'),
        AutoRoute(page: AccountEducationRoutes.page,path: '/edu_page'),
        AutoRoute(page: AccountWorkRoutes.page,path: '/work_page'),
        AutoRoute(page: AccountFamilyRoute.page,path: '/family_page'),
        AutoRoute(page: AccountAwardRoutes.page,path: '/award_page'),
        AutoRoute(page: AccountBudgetRoute.page,path: '/budget_page'),
        AutoRoute(page: JourneyLandingRoute.page,path: '/journey_landing_page'),
        AutoRoute(page: JourneySelectionRoute.page,path: '/journey_selection_page'),
        AutoRoute(page: JourneyCountryPredictedRoute.page,path: '/journey_country_prediction'),
        AutoRoute(page: JourneyVisaTypeSelectionRoute.page,path: '/journey_visa_selection'),
        AutoRoute(page: JourneyVisaPredictedRoute.page,path: '/journey_visa_prediction'),
        CustomRoute(page: JoureyCompareDestinationRoute.page,transitionsBuilder: TransitionsBuilders.slideRight, durationInMilliseconds: 3000)
        
      ];
}
