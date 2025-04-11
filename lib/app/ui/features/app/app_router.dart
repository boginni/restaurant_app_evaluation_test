import 'package:go_router/go_router.dart';

import '../home/home_route.dart';
import '../splash/splash_page.dart';

class AppRouter {
  static const String home = '/home';
  static const String splash = '/splash';

  late final router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => const SplashPage(),
      ),
      HomeRoute().route,
    ],
  );
}
