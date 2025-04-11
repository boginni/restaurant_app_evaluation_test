import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/restaurant_list_bloc.dart';
import 'bloc/restaurant_list_bloc_events.dart';
import 'bloc/restaurant_list_bloc_states.dart';

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
  bool favorites = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        init();
      },
    );
  }

  void init() {
    bloc.add(
      GetRestaurantsEvent(
        offset,
        favorites,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RestaurantListBloc, RestaurantListBlocState>(
        bloc: bloc,
        builder: (context, state) {
          return NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) => [
              const SliverAppBar(
                title: Text('Restaurants'),
                floating: true,
                pinned: true,
                snap: true,
              ),
              SliverPersistentHeader(
                delegate: FavoritesBarDelegate(
                  onRefresh: () {
                    init();
                  },
                ),
              ),
            ],
            body: switch (state) {
              LoadingRestaurantListState() => const Center(
                  child: CircularProgressIndicator(),
                ),
              LoadedRestaurantListState(
                result: final result,
                isLoadingMore: final isLoadingMore
              ) =>
                ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return const ListTile(
                      title: Text("Test"),
                    );
                  },
                ),
              ErrorRestaurantListState() => const Center(
                  child: Text('Error loading restaurants'),
                ),
            },
          );
        },
      ),
    );
  }
}

class FavoritesBarDelegate extends SliverPersistentHeaderDelegate {
  const FavoritesBarDelegate({required this.onRefresh});

  final VoidCallback onRefresh;

  @override
  double get maxExtent => 64;

  @override
  double get minExtent => 64;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      height: 64,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Favorites'),
          IconButton(
            icon: const Icon(Icons.sync),
            onPressed: onRefresh,
          ),
        ],
      ),
    );
  }
}
