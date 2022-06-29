import 'package:flutter/material.dart';

import 'devices/presentation/views/device_home.dart';
import 'home/presentation/views/home.dart';
import 'routine/presentation/views/routine_home.dart';
import 'stats/presentation/views/stats_home.dart';
import 'voice/presentation/views/voice_home.dart';

class Dashboard extends StatefulWidget {
  final int initialTab;
  const Dashboard({Key? key, this.initialTab = 0}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Widget> _children = const [
    HomeScreen(),
    DevicesScreen(),
    VoiceHomeScreen(),
    RoutineHomeScreen(),
    StatsHomeScreen(),
  ];

  @override
  void initState() {
    _tabController = TabController(length: _children.length, vsync: this);
    _tabController.index = widget.initialTab;
    super.initState();
  }

  void onTabTapped(int index) {
    _tabController.index = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        children: _children,
        controller: _tabController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _tabController.index,
        unselectedFontSize: 14,
        elevation: 2.0,
        // selectedItemColor: ShuttlersColors.shuttlersGreen,
        // selectedIconTheme: ShuttlersThemes.iconThemeData,
        // selectedLabelStyle: TextStyle(
        //   fontWeight: FontWeight.w600,
        //   letterSpacing: 0.0,
        //   fontSize: 12.0,
        // ),
        // unselectedLabelStyle: TextStyle(
        //   letterSpacing: 0.0,
        //   fontSize: 12.0,
        // ),
        // backgroundColor: Colors.white,
        enableFeedback: true,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home_outlined),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.phone_iphone_rounded),
              activeIcon: Icon(Icons.phone_iphone_rounded),
              label: "Device"),
          BottomNavigationBarItem(
              icon: Icon(Icons.keyboard_voice_outlined),
              activeIcon: Icon(Icons.keyboard_voice_outlined),
              label: "Voice"),
          BottomNavigationBarItem(
              icon: Icon(Icons.replay_rounded),
              activeIcon: Icon(Icons.replay_rounded),
              label: "Routine"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_rounded),
              activeIcon: Icon(Icons.bar_chart_rounded),
              label: "Stats"),
        ],
      ),
    );
  }
}
