import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_event.dart';

part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  InternetBloc() : super(InternetInitial()) {
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
    on<InternetGainedEvent>((event, emit) => emit(InternetGainState()));
    checkInternetConnectivity();
  }

  StreamSubscription? connectionSubscription;

  Connectivity connectivity = Connectivity();

  checkInternetConnectivity() async {
    connectionSubscription = connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.mobile ||
          event == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      } else {
        add(InternetLostEvent());
      }
    }, onError: (e) {
      add(InternetLostEvent());
    });
  }

  @override
  Future<void> close() {
    connectionSubscription?.cancel();
    return super.close();
  }
}
