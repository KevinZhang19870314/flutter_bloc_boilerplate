import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boilerplate/api/api.dart';
import 'package:flutter_bloc_boilerplate/shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitState());

  final ApiRepository _apiRepository =
      ApiRepository(apiProvider: new ApiProvider());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthAppInitEvent) {
      yield* _mapAuthAppInitState(event);
    }
  }

  Stream<AuthState> _mapAuthAppInitState(AuthAppInitEvent event) async* {
    try {
      await Future.delayed(Duration(milliseconds: 2000)); // a simulated delay
      final SharedPreferences sharedPreferences = await prefs;
      if (sharedPreferences.getString(StorageConstants.token) != null) {
        yield AuthSuccessState();
      } else {
        yield AuthFailState();
      }
    } catch (e) {
      yield AuthAppFailureState(
          message: e.message ?? 'An unknown error occurred');
    }
  }
}
