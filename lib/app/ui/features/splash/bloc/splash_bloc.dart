import 'package:bloc/bloc.dart';

import 'splash_bloc_events.dart';
import 'splash_bloc_states.dart';

class SplashBloc extends Bloc<SplashBlocEvents, SplashBlocStates> {
  SplashBloc() : super(const SplashLoadingState()) {
    // TODO(me): implement bloc events
  }
}
