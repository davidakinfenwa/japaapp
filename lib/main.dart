import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:japaapp/business/snapshot/tabscreen_provider.dart';
import 'package:japaapp/core/route/app_router.dart';
import 'package:japaapp/core/theme/custom_typography.dart';

import 'package:provider/provider.dart';

import 'business/blocs/auth_blocs/signin_form_cubit/signin_form_cubit.dart';
import 'business/snapshot_cache/snapshot_cache.dart';
import 'core/dependence/dependence.dart';
import 'core/interceptors/interceptors.dart';
import 'core/network/network.dart';

void _setupDioInterceptors() {
  dioClient.interceptors.add(getIt<LoggingInterceptors>());
  dioClient.interceptors.add(getIt<HeaderInterceptors>());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initGetIt();
  _setupDioInterceptors();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TabScreenNotifier()),
        ChangeNotifierProvider(create: (context) => AuthSnapshotCache()),
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider<SigninFormCubit>(
          create: (context) => getIt<SigninFormCubit>(),
        ),
      ], child: const MyApp())));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return KeyboardVisibilityProvider(
          child: MaterialApp.router(
            title: 'JapaApp',
            debugShowCheckedModeBanner: false,
            theme: CustomTypography.themeDataModifications,
            themeMode: ThemeMode.system,
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
          ),
        );
      },
    );
  }
}
