import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:smarty/core/navigation/navigator.dart';
import 'package:smarty/features/devices/domain/models/devices.dart';
import 'package:smarty/utils/enums.dart';

import '../../../../shared/res/res.dart';

class StatsHomeScreen extends StatefulWidget {
  const StatsHomeScreen({Key? key}) : super(key: key);

  @override
  State<StatsHomeScreen> createState() => _StatsHomeScreenState();
}

class _StatsHomeScreenState extends State<StatsHomeScreen>
    with TickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 2;

  @override
  void initState() {
    super.initState();
    _controller =
        TabController(length: 4, vsync: this, initialIndex: _selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32 + MediaQuery.of(context).padding.top),
              Row(
                children: [
                  if (AppNavigator.canPop)
                    GestureDetector(
                      onTap: () => AppNavigator.pop(),
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Power Usage',
                        style: TextStyles.headline4,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 36),
              Center(
                child: TabBar(
                    controller: _controller,
                    padding: EdgeInsets.zero,
                    indicatorPadding: EdgeInsets.zero,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                    isScrollable: true,
                    onTap: (int v) {
                      setState(() {
                        _selectedIndex = v;
                        _controller.index = v;
                      });
                    },
                    indicatorColor: Colors.transparent,
                    tabs: [
                      Container(
                        width: 55,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: _selectedIndex == 0
                              ? SmartyColors.primary
                              : SmartyColors.secondary10,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            'Day',
                            style: TextStyles.subtitle.copyWith(
                                color: _selectedIndex == 0
                                    ? SmartyColors.tertiary
                                    : SmartyColors.primary60),
                          ),
                        ),
                      ),
                      Container(
                        width: 55,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: _selectedIndex == 1
                              ? SmartyColors.primary
                              : SmartyColors.secondary10,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            'Week',
                            style: TextStyles.subtitle.copyWith(
                                color: _selectedIndex == 1
                                    ? SmartyColors.tertiary
                                    : SmartyColors.primary60),
                          ),
                        ),
                      ),
                      Container(
                        width: 55,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: _selectedIndex == 2
                              ? SmartyColors.primary
                              : SmartyColors.secondary10,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            'Month',
                            style: TextStyles.subtitle.copyWith(
                                color: _selectedIndex == 2
                                    ? SmartyColors.tertiary
                                    : SmartyColors.primary60),
                          ),
                        ),
                      ),
                      Container(
                        width: 55,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: _selectedIndex == 3
                              ? SmartyColors.primary
                              : SmartyColors.secondary10,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            'Year',
                            style: TextStyles.subtitle.copyWith(
                                color: _selectedIndex == 3
                                    ? SmartyColors.tertiary
                                    : SmartyColors.primary60),
                          ),
                        ),
                      ),
                    ]),
              ),
              const SizedBox(height: 32),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                decoration: BoxDecoration(
                  color: SmartyColors.secondary10,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Summary for June 2022',
                      style:
                          TextStyles.body.copyWith(color: SmartyColors.grey60),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: SmartyColors.primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 24,
                                backgroundColor: SmartyColors.secondary60,
                                child: Icon(
                                  Icons.bolt_outlined,
                                  color: SmartyColors.tertiary,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '2500',
                                    style: TextStyles.headline4.copyWith(
                                        color: SmartyColors.tertiary,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    'KWh used',
                                    style: TextStyles.body.copyWith(
                                      color: SmartyColors.tertiary60,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: SmartyColors.primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 24,
                                backgroundColor: SmartyColors.secondary60,
                                child: Icon(
                                  Icons.currency_pound_sharp,
                                  color: SmartyColors.tertiary,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '850',
                                    style: TextStyles.headline4.copyWith(
                                        color: SmartyColors.tertiary,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    'USD spent',
                                    style: TextStyles.body.copyWith(
                                      color: SmartyColors.tertiary60,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const LineChartSample2(),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Devices',
                    style: TextStyles.body.copyWith(
                        color: SmartyColors.grey, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      Text(
                        'January',
                        style: TextStyles.body.copyWith(
                          color: SmartyColors.grey,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: SmartyColors.grey60,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 25),
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(height: 24),
                  itemBuilder: (context, index) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            devices[index].type.icon!,
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                devices[index].name!,
                                style: TextStyles.body.copyWith(
                                  color: SmartyColors.grey,
                                ),
                              ),
                              Text(
                                'Living Room',
                                style: TextStyles.subtitle.copyWith(
                                  color: SmartyColors.grey60,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Text(
                        '250KWh',
                        style: TextStyles.subtitle.copyWith(
                          color: SmartyColors.grey60,
                        ),
                      ),
                    ],
                  ),
                  itemCount: devices.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({Key? key}) : super(key: key);

  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    const Color(0xFF0063B2).withOpacity(0.3),
    const Color(0xFFD5D7DA).withOpacity(0.1),
    const Color(0xFF0063B2).withOpacity(0.1)
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: const EdgeInsets.only(
                right: 18.0, left: 12.0, top: 24, bottom: 12),
            child: LineChart(mainData()),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    TextStyle style = TextStyle(
      color: SmartyColors.grey80,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('Jan', style: style);
        break;
      case 2:
        text = Text('Mar', style: style);
        break;
      case 5:
        text = Text('Jun', style: style);
        break;
      case 8:
        text = Text('Sep', style: style);
        break;
      case 11:
        text = Text('Dec', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    TextStyle style = TextStyle(
      color: SmartyColors.grey80,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 2:
        text = '20';
        break;
      case 5:
        text = '50';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 0.2,
            dashArray: [2, 2],
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 0.2,
            dashArray: [2, 2],
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(
          color: SmartyColors.grey30,
          width: 0.5,
          style: BorderStyle.solid,
        ),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          barWidth: 1,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ],
    );
  }
}
