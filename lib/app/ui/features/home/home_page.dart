import 'package:flutter/material.dart';

import 'bloc/restaurant_list_bloc.dart';
import 'bloc/restaurant_list_bloc_events.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.restaurantListBloc,
  });

  final RestaurantListBloc restaurantListBloc;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RestaurantListBloc get bloc => widget.restaurantListBloc;

  int offset = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        bloc.add(
          GetRestaurantsEvent(
            offset,
            false,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Restaurant Tour'),
            ElevatedButton(
              child: const Text('Fetch Restaurants'),
              onPressed: () async {
                bloc.add(
                  GetRestaurantsEvent(
                    offset,
                    false,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
