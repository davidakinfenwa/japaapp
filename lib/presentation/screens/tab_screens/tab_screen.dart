import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:japaapp/business/snapshot/tabscreen_provider.dart';
import 'package:japaapp/presentation/screens/tab_screens/account_page.dart';
import 'package:japaapp/presentation/screens/tab_screens/dashboard.dart';
import 'package:japaapp/presentation/screens/tab_screens/thrive.dart';
import 'package:japaapp/presentation/screens/tab_screens/process_tab.dart';
import 'package:japaapp/presentation/shared/bottommainnav.dart';
import 'package:provider/provider.dart';



@RoutePage()
class TabScreen extends StatefulWidget  {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();

}

class _TabScreenState extends State<TabScreen> {
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
