import 'package:flutter_bloc/flutter_bloc.dart';

import 'splash.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitState());

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
