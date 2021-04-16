import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_boilerplate/api/api.dart';
import 'package:flutter_bloc_boilerplate/models/response/users_response.dart';
import 'package:flutter_bloc_boilerplate/shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitState());

  final ApiRepository _apiRepository =
      ApiRepository(apiProvider: new ApiProvider());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeLoadUsersEvent) {
      yield* _mapHomeLoadUsersState(event);
    }

    if (event is HomeGetUserEvent) {
      yield* _mapHomeGetUserState(event);
    }
  }

  Stream<HomeState> _mapHomeLoadUsersState(HomeLoadUsersEvent event) async* {
    try {
      final res = await _apiRepository.getUsers();
      if (res.data.length > 0) {
        _saveUserInfo(res);
        yield HomeLoadUsersSuccessState(users: res.data);
      } else {
        yield HomeLoadUsersFailState(message: '');
      }
    } catch (e) {
      yield HomeFailureState(message: e.message ?? 'An unknown error occurred');
    }
  }

  Stream<HomeState> _mapHomeGetUserState(HomeGetUserEvent event) async* {
    try {
      final SharedPreferences sharedPreferences = await prefs;
      var user = sharedPreferences.getString(StorageConstants.userInfo);
      var userObj = Datum.fromRawJson(user);
      yield HomeGetUserSuccessState(user: userObj);
    } catch (e) {
      yield HomeFailureState(message: e.message ?? 'An unknown error occurred');
    }
  }

  void _saveUserInfo(UsersResponse users) async {
    final SharedPreferences sharedPreferences = await prefs;
    var random = new Random();
    var index = random.nextInt(users.data.length);
    sharedPreferences.setString(
      StorageConstants.userInfo,
      users.data[index].toRawJson(),
    );

    // var userInfo = prefs.getString(StorageConstants.userInfo);
    // var userInfoObj = Datum.fromRawJson(xx!);
    // print(userInfoObj);
  }
}
