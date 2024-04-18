import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:japaapp/business/snapshot/tabscreen_provider.dart';
import 'package:japaapp/core/dependence/dependence.dart';
import 'package:japaapp/core/route/app_router.dart';
import 'package:japaapp/core/theme/custom_typography.dart';
import 'package:japaapp/presentation/screens/profile/provider/account_provider.dart';

import 'package:provider/provider.dart';

import 'business/blocs/auth_blocs/signin_form_cubit/signin_form_cubit.dart';
import 'business/snapshot_cache/snapshot_cache.dart';

import 'core/interceptors/interceptors.dart';
import 'core/network/network.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void _setupDioInterceptors() {
  dioClient.interceptors.add(getIt<LoggingInterceptors>());
  dioClient.interceptors.add(getIt<HeaderInterceptors>());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initGetIt();
  _setupDioInterceptors();
  // SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: CustomTypography.kTransparentColor,
        statusBarIconBrightness: Brightness.dark // Change this color as needed
        ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) =>  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TabScreenNotifier()),
        ChangeNotifierProvider(create: (context) => AuthSnapshotCache()),
        ChangeNotifierProvider(create: (context) => AccountPageProvider()),
        ChangeNotifierProvider(create: (context) => AccountSnapshotCache()),
        
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider<SigninFormCubit>(
          create: (context) => getIt<SigninFormCubit>(),
        ),
      ], child: const MyApp())
      )
      )
      );

 

//  runApp(const MyApp()),
  
  
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
            supportedLocales: const [
        Locale('en'),
        Locale('ar'),
        Locale('es'),
        Locale('de'),
        Locale('fr'),
        Locale('el'),
        Locale('et'),
        Locale('nb'),
        Locale('nn'),
        Locale('pl'),
        Locale('pt'),
        Locale('ru'),
        Locale('hi'),
        Locale('ne'),
        Locale('uk'),
        Locale('hr'),
        Locale('tr'),
        Locale('lv'),
        Locale('lt'),
        Locale('ku'),
        Locale('nl'),
        Locale('it'),
        Locale('ko'),
        Locale('ja'),
        Locale('id'),
        Locale('cs'),
        Locale('ht'),
        Locale('sk'),
        Locale('ro'),
        Locale('bg'),
        Locale('ca'),
        Locale('he'),
        Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'), // Generic Simplified Chinese 'zh_Hans'
        Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'), // Generic traditional Chinese 'zh_Hant'
      ],
      localizationsDelegates: const [
        CountryLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
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
