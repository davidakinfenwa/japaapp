import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:japaapp/presentation/screens/screens.dart';



part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: StartRoute.page),
        AutoRoute(page: LoginRoute.page, path: '/login'),
        AutoRoute(page: SignUpRoute.page, path: '/signup'),
        AutoRoute(page: OtpRoute.page),
        AutoRoute(page: ProfilePicUploadRoute.page),
        AutoRoute(page: TabRoute.page),
        AutoRoute(page: TaskRoute.page),
        AutoRoute(page: TaskDetailRoute.page),
     
        

      ];
}
