import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../app/app_router.dart';

class HomeRoute {
  late final GoRoute route = GoRoute(
    path: AppRouter.home,
    builder: builder,
  );

  Widget builder(BuildContext context, GoRouterState state) {
    // return const HomePage(
    //
    // );
  }
}
