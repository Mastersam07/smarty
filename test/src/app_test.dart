import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  /// The below test cases were replicated from Material app tests in the flutter sdk
  /// You might want to read the original for clarity
  /// flutter/test/material/app_test.dart

  testWidgets('MaterialApp.router works', (WidgetTester tester) async {
    final PlatformRouteInformationProvider provider =
        PlatformRouteInformationProvider(
      initialRouteInformation: const RouteInformation(
        location: 'initial',
      ),
    );
    final SimpleNavigatorRouterDelegate delegate =
        SimpleNavigatorRouterDelegate(
      builder: (BuildContext context, RouteInformation information) {
        return Text(information.location!);
      },
      onPopPage: (Route<void> route, void result,
          SimpleNavigatorRouterDelegate delegate) {
        delegate.routeInformation = const RouteInformation(
          location: 'popped',
        );
        return route.didPop(result);
      },
    );
    await tester.pumpWidget(BatCave.router(
      routeInformationProvider: provider,
      routeInformationParser: SimpleRouteInformationParser(),
      routerDelegate: delegate,
    ));
    expect(find.text('initial'), findsOneWidget);

    // Simulate android back button intent.
    final ByteData message =
        const JSONMethodCodec().encodeMethodCall(const MethodCall('popRoute'));
    await ServicesBinding.instance.defaultBinaryMessenger
        .handlePlatformMessage('flutter/navigation', message, (_) {});
    await tester.pumpAndSettle();
    expect(find.text('popped'), findsOneWidget);
  });

  testWidgets('MaterialApp.router route information parser is optional',
      (WidgetTester tester) async {
    final SimpleNavigatorRouterDelegate delegate =
        SimpleNavigatorRouterDelegate(
      builder: (BuildContext context, RouteInformation information) {
        return Text(information.location!);
      },
      onPopPage: (Route<void> route, void result,
          SimpleNavigatorRouterDelegate delegate) {
        delegate.routeInformation = const RouteInformation(
          location: 'popped',
        );
        return route.didPop(result);
      },
    );
    delegate.routeInformation = const RouteInformation(location: 'initial');
    await tester.pumpWidget(BatCave.router(
      routerDelegate: delegate,
    ));
    expect(find.text('initial'), findsOneWidget);

    // Simulate android back button intent.
    final ByteData message =
        const JSONMethodCodec().encodeMethodCall(const MethodCall('popRoute'));
    await ServicesBinding.instance.defaultBinaryMessenger
        .handlePlatformMessage('flutter/navigation', message, (_) {});
    await tester.pumpAndSettle();
    expect(find.text('popped'), findsOneWidget);
  });

  testWidgets(
      'MaterialApp.router throw if route information provider is provided but no route information parser',
      (WidgetTester tester) async {
    final SimpleNavigatorRouterDelegate delegate =
        SimpleNavigatorRouterDelegate(
      builder: (BuildContext context, RouteInformation information) {
        return Text(information.location!);
      },
      onPopPage: (Route<void> route, void result,
          SimpleNavigatorRouterDelegate delegate) {
        delegate.routeInformation = const RouteInformation(
          location: 'popped',
        );
        return route.didPop(result);
      },
    );
    delegate.routeInformation = const RouteInformation(location: 'initial');
    final PlatformRouteInformationProvider provider =
        PlatformRouteInformationProvider(
      initialRouteInformation: const RouteInformation(
        location: 'initial',
      ),
    );
    await tester.pumpWidget(BatCave.router(
      routeInformationProvider: provider,
      routerDelegate: delegate,
    ));
    expect(tester.takeException(), isAssertionError);
  });

  testWidgets(
      'MaterialApp.router throw if route configuration is provided along with other delegate',
      (WidgetTester tester) async {
    final SimpleNavigatorRouterDelegate delegate =
        SimpleNavigatorRouterDelegate(
      builder: (BuildContext context, RouteInformation information) {
        return Text(information.location!);
      },
      onPopPage: (Route<void> route, void result,
          SimpleNavigatorRouterDelegate delegate) {
        delegate.routeInformation = const RouteInformation(
          location: 'popped',
        );
        return route.didPop(result);
      },
    );
    delegate.routeInformation = const RouteInformation(location: 'initial');
    final RouterConfig<RouteInformation> routerConfig =
        RouterConfig<RouteInformation>(routerDelegate: delegate);
    await tester.pumpWidget(BatCave.router(
      routerDelegate: delegate,
      routerConfig: routerConfig,
    ));
    expect(tester.takeException(), isAssertionError);
  });

  testWidgets('MaterialApp.router router config works',
      (WidgetTester tester) async {
    final RouterConfig<RouteInformation> routerConfig =
        RouterConfig<RouteInformation>(
            routeInformationProvider: PlatformRouteInformationProvider(
              initialRouteInformation: const RouteInformation(
                location: 'initial',
              ),
            ),
            routeInformationParser: SimpleRouteInformationParser(),
            routerDelegate: SimpleNavigatorRouterDelegate(
              builder: (BuildContext context, RouteInformation information) {
                return Text(information.location!);
              },
              onPopPage: (Route<void> route, void result,
                  SimpleNavigatorRouterDelegate delegate) {
                delegate.routeInformation = const RouteInformation(
                  location: 'popped',
                );
                return route.didPop(result);
              },
            ),
            backButtonDispatcher: RootBackButtonDispatcher());
    await tester.pumpWidget(BatCave.router(
      routerConfig: routerConfig,
    ));
    expect(find.text('initial'), findsOneWidget);

    // Simulate android back button intent.
    final ByteData message =
        const JSONMethodCodec().encodeMethodCall(const MethodCall('popRoute'));
    await ServicesBinding.instance.defaultBinaryMessenger
        .handlePlatformMessage('flutter/navigation', message, (_) {});
    await tester.pumpAndSettle();
    expect(find.text('popped'), findsOneWidget);
  });

  testWidgets('MaterialApp.builder can build app without a Navigator',
      (WidgetTester tester) async {
    Widget? builderChild;
    await tester.pumpWidget(BatCave(
      builder: (BuildContext context, Widget? child) {
        builderChild = child;
        return Container();
      },
    ));
    expect(builderChild, isNull);
  });
}

typedef SimpleRouterDelegateBuilder = Widget Function(
    BuildContext, RouteInformation);
typedef SimpleNavigatorRouterDelegatePopPage<T> = bool Function(
    Route<T> route, T result, SimpleNavigatorRouterDelegate delegate);

class SimpleRouteInformationParser
    extends RouteInformationParser<RouteInformation> {
  SimpleRouteInformationParser();

  @override
  Future<RouteInformation> parseRouteInformation(RouteInformation information) {
    return SynchronousFuture<RouteInformation>(information);
  }

  @override
  RouteInformation restoreRouteInformation(RouteInformation configuration) {
    return configuration;
  }
}

class SimpleNavigatorRouterDelegate extends RouterDelegate<RouteInformation>
    with PopNavigatorRouterDelegateMixin<RouteInformation>, ChangeNotifier {
  SimpleNavigatorRouterDelegate({
    required this.builder,
    required this.onPopPage,
  });

  @override
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  RouteInformation get routeInformation => _routeInformation;
  late RouteInformation _routeInformation;
  set routeInformation(RouteInformation newValue) {
    _routeInformation = newValue;
    notifyListeners();
  }

  SimpleRouterDelegateBuilder builder;
  SimpleNavigatorRouterDelegatePopPage<void> onPopPage;

  @override
  Future<void> setNewRoutePath(RouteInformation configuration) {
    _routeInformation = configuration;
    return SynchronousFuture<void>(null);
  }

  bool _handlePopPage(Route<void> route, void data) {
    return onPopPage(route, data, this);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: <Page<void>>[
        // We need at least two pages for the pop to propagate through.
        // Otherwise, the navigator will bubble the pop to the system navigator.
        const MaterialPage<void>(
          child: Text('base'),
        ),
        MaterialPage<void>(
          key: ValueKey<String>(routeInformation.location!),
          child: builder(context, routeInformation),
        ),
      ],
    );
  }
}
