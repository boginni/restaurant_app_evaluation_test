import 'package:go_router/go_router.dart';

class AppRouter {
  static const String home = '/home';
  static const String splash = '/splash';

  GoRouter get router => GoRouter(
        routes: [
          GoRoute(path: splash),
          GoRoute(path: home),
        ],
      );
}
