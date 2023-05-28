import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smarty/main.dart';

import 'devices/presentation/views/device_home.dart';
import 'home/presentation/views/home.dart';
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
    // RoutineHomeScreen(),
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
    var theme = context.read<ThemeProvider>();
    return Scaffold(
      backgroundColor: BatThemeData.of(context).colors.background,
      body: SafeArea(
        child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: _children,
          controller: _tabController,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: BatThemeData.of(context).colors.background,
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _tabController.index,
        unselectedFontSize: 14,
        elevation: 2.0,
        selectedIconTheme: const IconThemeData(color: BatPalette.primary),
        unselectedIconTheme: IconThemeData(
            color: theme.isDark ? BatPalette.white60 : BatPalette.grey60),
        selectedLabelStyle: BatThemeData.of(context).typography.bodyCopyMedium,
        unselectedLabelStyle: BatThemeData.of(context).typography.bodyCopy,
        selectedItemColor: BatPalette.primary,
        unselectedItemColor:
            theme.isDark ? BatPalette.white60 : BatPalette.grey60,
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
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.replay_rounded),
          //     activeIcon: Icon(Icons.replay_rounded),
          //     label: "Routine"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_rounded),
              activeIcon: Icon(Icons.bar_chart_rounded),
              label: "Stats"),
        ],
      ),
    );
  }
}
