import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('should render a BatCave widget', (WidgetTester tester) async {
    await tester.pumpWidget(BatCave(
      home: Container(),
    ));

    expect(find.byType(BatCave), findsOneWidget);
  });

  testWidgets('should render a widget as a home route',
      (WidgetTester tester) async {
    await tester.pumpWidget(BatCave(
      home: Container(),
    ));

    expect(find.byType(Container), findsOneWidget);
  });

  testWidgets('renders without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: BatCave()));
    expect(find.byType(BatCave), findsOneWidget);
  });

  testWidgets('uses default route when no initial route is specified',
      (WidgetTester tester) async {
    final routes = {'/': (context) => const Placeholder()};
    await tester.pumpWidget(MaterialApp(home: BatCave(routes: routes)));
    expect(find.byType(Placeholder), findsOneWidget);
  });

  testWidgets('uses specified initial route', (WidgetTester tester) async {
    final routes = {'/my_route': (context) => const Placeholder()};
    await tester.pumpWidget(
        MaterialApp(home: BatCave(routes: routes, initialRoute: '/my_route')));
    expect(find.byType(Placeholder), findsOneWidget);
  });

  testWidgets('uses onGenerateRoute when specified',
      (WidgetTester tester) async {
    onGenerateRoute(settings) =>
        MaterialPageRoute(builder: (_) => const Placeholder());
    await tester.pumpWidget(
        MaterialApp(home: BatCave(onGenerateRoute: onGenerateRoute)));
    expect(find.byType(Placeholder), findsOneWidget);
  });

  testWidgets('uses onUnknownRoute when specified',
      (WidgetTester tester) async {
    onUnknownRoute(settings) =>
        MaterialPageRoute(builder: (_) => const Placeholder());
    await tester
        .pumpWidget(MaterialApp(home: BatCave(onUnknownRoute: onUnknownRoute)));
    expect(find.byType(Placeholder), findsOneWidget);
  });

  testWidgets('uses builder when specified', (WidgetTester tester) async {
    await tester.pumpWidget(BatCave(builder: (_, __) => const Placeholder()));
    expect(find.byType(Placeholder), findsOneWidget);
  });

  testWidgets('uses specified navigator key', (WidgetTester tester) async {
    final navigatorKey = GlobalKey<NavigatorState>();
    await tester.pumpWidget(BatCave(
      navigatorKey: navigatorKey,
      home: Container(),
    ));
    expect(Navigator.of(navigatorKey.currentContext!), isNotNull);
  });
}
