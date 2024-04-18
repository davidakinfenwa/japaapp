// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AccountAwardRoutes.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountAwardPages(),
      );
    },
    AccountBasicInfoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const AccountBasicInfoPage()),
      );
    },
    AccountBudgetRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AccountBudgetPage(),
      );
    },
    AccountEducationRoutes.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const AccountEducationPages()),
      );
    },
    AccountFamilyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const AccountFamilyPage()),
      );
    },
    AccountWorkRoutes.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const AccountWorkPages()),
      );
    },
    CommunityDetailRoute.name: (routeData) {
      final args = routeData.argsAs<CommunityDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CommunityDetailScreen(
          key: args.key,
          title: args.title,
        ),
      );
    },
    CreateAccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const CreateAccountPage()),
      );
    },
    EmailVerificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const EmailVerificationPage()),
      );
    },
    FirstRouteOndoard.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FirstScreenOndoard(),
      );
    },
    JoureyCompareDestinationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const JoureyCompareDestinationPage(),
      );
    },
    JourneyCountryPredictedRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const JourneyCountryPredictedPage(),
      );
    },
    JourneyLandingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const JourneyLandingPage(),
      );
    },
    JourneySelectionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const JourneySelectionPage(),
      );
    },
    JourneyVisaPredictedRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const JourneyVisaPredictedPage(),
      );
    },
    JourneyVisaTypeSelectionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const JourneyVisaTypeSelectionPage(),
      );
    },
    LandingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LandingPage(),
      );
    },
    MyProcessTabRoute.name: (routeData) {
      final args = routeData.argsAs<MyProcessTabRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MyProcessTabScreen(
          key: args.key,
          nav: args.nav,
        ),
      );
    },
    OTPVerificationRoute.name: (routeData) {
      final args = routeData.argsAs<OTPVerificationRouteArgs>(
          orElse: () => const OTPVerificationRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(
            child: OTPVerificationPage(
          key: args.key,
          source: args.source,
        )),
      );
    },
    SelectedServicesRoute.name: (routeData) {
      final args = routeData.argsAs<SelectedServicesRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SelectedServicesScreen(
          key: args.key,
          selectedServices: args.selectedServices,
        ),
      );
    },
    SignInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const SignInPage()),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
    StartRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const StartScreen(),
      );
    },
    TabRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const TabScreen()),
      );
    },
  };
}

/// generated route for
/// [AccountAwardPages]
class AccountAwardRoutes extends PageRouteInfo<void> {
  const AccountAwardRoutes({List<PageRouteInfo>? children})
      : super(
          AccountAwardRoutes.name,
          initialChildren: children,
        );

  static const String name = 'AccountAwardRoutes';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AccountBasicInfoPage]
class AccountBasicInfoRoute extends PageRouteInfo<void> {
  const AccountBasicInfoRoute({List<PageRouteInfo>? children})
      : super(
          AccountBasicInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountBasicInfoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AccountBudgetPage]
class AccountBudgetRoute extends PageRouteInfo<void> {
  const AccountBudgetRoute({List<PageRouteInfo>? children})
      : super(
          AccountBudgetRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountBudgetRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AccountEducationPages]
class AccountEducationRoutes extends PageRouteInfo<void> {
  const AccountEducationRoutes({List<PageRouteInfo>? children})
      : super(
          AccountEducationRoutes.name,
          initialChildren: children,
        );

  static const String name = 'AccountEducationRoutes';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AccountFamilyPage]
class AccountFamilyRoute extends PageRouteInfo<void> {
  const AccountFamilyRoute({List<PageRouteInfo>? children})
      : super(
          AccountFamilyRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountFamilyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AccountWorkPages]
class AccountWorkRoutes extends PageRouteInfo<void> {
  const AccountWorkRoutes({List<PageRouteInfo>? children})
      : super(
          AccountWorkRoutes.name,
          initialChildren: children,
        );

  static const String name = 'AccountWorkRoutes';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CommunityDetailScreen]
class CommunityDetailRoute extends PageRouteInfo<CommunityDetailRouteArgs> {
  CommunityDetailRoute({
    Key? key,
    required String title,
    List<PageRouteInfo>? children,
  }) : super(
          CommunityDetailRoute.name,
          args: CommunityDetailRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'CommunityDetailRoute';

  static const PageInfo<CommunityDetailRouteArgs> page =
      PageInfo<CommunityDetailRouteArgs>(name);
}

class CommunityDetailRouteArgs {
  const CommunityDetailRouteArgs({
    this.key,
    required this.title,
  });

  final Key? key;

  final String title;

  @override
  String toString() {
    return 'CommunityDetailRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [CreateAccountPage]
class CreateAccountRoute extends PageRouteInfo<void> {
  const CreateAccountRoute({List<PageRouteInfo>? children})
      : super(
          CreateAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EmailVerificationPage]
class EmailVerificationRoute extends PageRouteInfo<void> {
  const EmailVerificationRoute({List<PageRouteInfo>? children})
      : super(
          EmailVerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmailVerificationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FirstScreenOndoard]
class FirstRouteOndoard extends PageRouteInfo<void> {
  const FirstRouteOndoard({List<PageRouteInfo>? children})
      : super(
          FirstRouteOndoard.name,
          initialChildren: children,
        );

  static const String name = 'FirstRouteOndoard';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [JoureyCompareDestinationPage]
class JoureyCompareDestinationRoute extends PageRouteInfo<void> {
  const JoureyCompareDestinationRoute({List<PageRouteInfo>? children})
      : super(
          JoureyCompareDestinationRoute.name,
          initialChildren: children,
        );

  static const String name = 'JoureyCompareDestinationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [JourneyCountryPredictedPage]
class JourneyCountryPredictedRoute extends PageRouteInfo<void> {
  const JourneyCountryPredictedRoute({List<PageRouteInfo>? children})
      : super(
          JourneyCountryPredictedRoute.name,
          initialChildren: children,
        );

  static const String name = 'JourneyCountryPredictedRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [JourneyLandingPage]
class JourneyLandingRoute extends PageRouteInfo<void> {
  const JourneyLandingRoute({List<PageRouteInfo>? children})
      : super(
          JourneyLandingRoute.name,
          initialChildren: children,
        );

  static const String name = 'JourneyLandingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [JourneySelectionPage]
class JourneySelectionRoute extends PageRouteInfo<void> {
  const JourneySelectionRoute({List<PageRouteInfo>? children})
      : super(
          JourneySelectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'JourneySelectionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [JourneyVisaPredictedPage]
class JourneyVisaPredictedRoute extends PageRouteInfo<void> {
  const JourneyVisaPredictedRoute({List<PageRouteInfo>? children})
      : super(
          JourneyVisaPredictedRoute.name,
          initialChildren: children,
        );

  static const String name = 'JourneyVisaPredictedRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [JourneyVisaTypeSelectionPage]
class JourneyVisaTypeSelectionRoute extends PageRouteInfo<void> {
  const JourneyVisaTypeSelectionRoute({List<PageRouteInfo>? children})
      : super(
          JourneyVisaTypeSelectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'JourneyVisaTypeSelectionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LandingPage]
class LandingRoute extends PageRouteInfo<void> {
  const LandingRoute({List<PageRouteInfo>? children})
      : super(
          LandingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LandingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyProcessTabScreen]
class MyProcessTabRoute extends PageRouteInfo<MyProcessTabRouteArgs> {
  MyProcessTabRoute({
    Key? key,
    required String nav,
    List<PageRouteInfo>? children,
  }) : super(
          MyProcessTabRoute.name,
          args: MyProcessTabRouteArgs(
            key: key,
            nav: nav,
          ),
          initialChildren: children,
        );

  static const String name = 'MyProcessTabRoute';

  static const PageInfo<MyProcessTabRouteArgs> page =
      PageInfo<MyProcessTabRouteArgs>(name);
}

class MyProcessTabRouteArgs {
  const MyProcessTabRouteArgs({
    this.key,
    required this.nav,
  });

  final Key? key;

  final String nav;

  @override
  String toString() {
    return 'MyProcessTabRouteArgs{key: $key, nav: $nav}';
  }
}

/// generated route for
/// [OTPVerificationPage]
class OTPVerificationRoute extends PageRouteInfo<OTPVerificationRouteArgs> {
  OTPVerificationRoute({
    Key? key,
    OtpVerificationScreenSource source = OtpVerificationScreenSource.signup,
    List<PageRouteInfo>? children,
  }) : super(
          OTPVerificationRoute.name,
          args: OTPVerificationRouteArgs(
            key: key,
            source: source,
          ),
          initialChildren: children,
        );

  static const String name = 'OTPVerificationRoute';

  static const PageInfo<OTPVerificationRouteArgs> page =
      PageInfo<OTPVerificationRouteArgs>(name);
}

class OTPVerificationRouteArgs {
  const OTPVerificationRouteArgs({
    this.key,
    this.source = OtpVerificationScreenSource.signup,
  });

  final Key? key;

  final OtpVerificationScreenSource source;

  @override
  String toString() {
    return 'OTPVerificationRouteArgs{key: $key, source: $source}';
  }
}

/// generated route for
/// [SelectedServicesScreen]
class SelectedServicesRoute extends PageRouteInfo<SelectedServicesRouteArgs> {
  SelectedServicesRoute({
    Key? key,
    required List<dynamic> selectedServices,
    List<PageRouteInfo>? children,
  }) : super(
          SelectedServicesRoute.name,
          args: SelectedServicesRouteArgs(
            key: key,
            selectedServices: selectedServices,
          ),
          initialChildren: children,
        );

  static const String name = 'SelectedServicesRoute';

  static const PageInfo<SelectedServicesRouteArgs> page =
      PageInfo<SelectedServicesRouteArgs>(name);
}

class SelectedServicesRouteArgs {
  const SelectedServicesRouteArgs({
    this.key,
    required this.selectedServices,
  });

  final Key? key;

  final List<dynamic> selectedServices;

  @override
  String toString() {
    return 'SelectedServicesRouteArgs{key: $key, selectedServices: $selectedServices}';
  }
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [StartScreen]
class StartRoute extends PageRouteInfo<void> {
  const StartRoute({List<PageRouteInfo>? children})
      : super(
          StartRoute.name,
          initialChildren: children,
        );

  static const String name = 'StartRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TabScreen]
class TabRoute extends PageRouteInfo<void> {
  const TabRoute({List<PageRouteInfo>? children})
      : super(
          TabRoute.name,
          initialChildren: children,
        );

  static const String name = 'TabRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
