import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japaapp/business/blocs/account_bloc/get_all_user_data_form_cubit.dart';
import 'package:japaapp/business/blocs/account_bloc/get_user_drop_down_form_cubit.dart';
import 'package:japaapp/business/blocs/news_bloc/recent_news_form_cubit.dart';
import 'package:japaapp/business/snapshot/tabscreen_provider.dart';
import 'package:japaapp/business/snapshot_cache/snapshot_cache.dart';
import 'package:japaapp/core/dependence/dependence.dart';
import 'package:japaapp/presentation/screens/tab_screens/account_page.dart';
import 'package:japaapp/presentation/screens/tab_screens/dashboard.dart';
import 'package:japaapp/presentation/screens/tab_screens/thrive.dart';
import 'package:japaapp/presentation/screens/tab_screens/process_tab.dart';
import 'package:japaapp/presentation/shared/bottommainnav.dart';
import 'package:provider/provider.dart';



@RoutePage()
class TabScreen extends StatefulWidget implements AutoRouteWrapper  {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
    @override
  Widget wrappedRoute(BuildContext context) {
     //final userInfo = context.read<AccountSnapshotCache>().userInfo;
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetAllUserDataFormCubit>(
          create: (context) => getIt<GetAllUserDataFormCubit>()..userAuthenticatedData(),
        ),
         BlocProvider<GetUserDropdownFormCubit>(
          create: (context) => getIt<GetUserDropdownFormCubit>()..userDropdownData(),
        ),
        BlocProvider<RecentNewCubit>(
          create: (context) => getIt<RecentNewCubit>()..recentNews(),
        ),
      ],
      child: this,
    );
  }

}

class _TabScreenState extends State<TabScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // WidgetsBinding.instance.addObserver(this);
  }
    @override
  void didChangeDependencies() {
    super.didChangeDependencies();
     getIt<GetAllUserDataFormCubit>().userAuthenticatedData();
      
    }
 void _onGetDashboardMetricsCallback() {
    final _authSnapshotCache = context.read<AuthSnapshotCache>();

    // final _getAccountDetailsFormParams = GetAccountDetailsFormParams(
    //   userId: _authSnapshotCache.userInfo.uid,
    //   accountNumber: _authSnapshotCache.userInfo.accountNumber!,
    // );

    // context.read<GetAccountMetricsCubit>().getAccountMetrics(
    //     getAccountDetailsFormParams: _getAccountDetailsFormParams);
    // context.read<GetAccountBalanceCubit>().getAccountBalance(
    //     getAccountDetailsFormParams: _getAccountDetailsFormParams);
  }

  //  void _onPageViewPageChangedCallback(int index) {
  //   setState(() {
  //     _activePageIndex = index;
  //   });

  //   if (_activePageIndex == 0) {
  //     _onGetDashboardMetricsCallback();
  //   }
  // }

  List<Widget> pageList = [
    const DashboardTab(),
    const MyProcessTabScreen(nav: "home",),
    const ThriveScreen(),
    const AccountTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabScreenNotifier>(builder: ((context, value, child) {
      return Scaffold(
        body: pageList[value.pageIndex],
        bottomNavigationBar: const BottomMainNav(),
      );
    }));
  }
}
