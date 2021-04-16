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

    if (event is AuthRegisterEvent) {
      yield* _mapAuthRegisterState(event);
    }

    if (event is AuthLoginEvent) {
      yield* _mapAuthLoginState(event);
    }

    if (event is AuthSignoutEvent) {
      yield* _mapAuthSignoutState(event);
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

  Stream<AuthState> _mapAuthRegisterState(AuthRegisterEvent event) async* {
    try {
      final SharedPreferences sharedPreferences = await prefs;
      final res = await _apiRepository.register(event.registerRequest);
      if (res.token.isNotEmpty) {
        sharedPreferences.setString(StorageConstants.token, res.token);
        yield AuthRegisterSuccessState();
      } else {
        yield AuthRegisterFailState(message: 'AuthRegisterFailState');
      }
    } catch (e) {
      yield AuthAppFailureState(
          message: e.message ?? 'An unknown error occurred');
    }
  }

  Stream<AuthState> _mapAuthLoginState(AuthLoginEvent event) async* {
    try {
      final SharedPreferences sharedPreferences = await prefs;
      final res = await _apiRepository.login(event.loginRequest);
      if (res.token.isNotEmpty) {
        sharedPreferences.setString(StorageConstants.token, res.token);
        yield AuthLoginSuccessState();
      } else {
        yield AuthLoginFailState(message: 'AuthLoginFailState');
      }
    } catch (e) {
      yield AuthAppFailureState(
          message: e.message ?? 'An unknown error occurred');
    }
  }

  Stream<AuthState> _mapAuthSignoutState(AuthSignoutEvent event) async* {
    try {
      final SharedPreferences sharedPreferences = await prefs;
      sharedPreferences.clear();

      yield AuthSignoutState();
    } catch (e) {
      yield AuthAppFailureState(
          message: e.message ?? 'An unknown error occurred');
    }
  }
}
