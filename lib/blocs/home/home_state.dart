import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_boilerplate/models/response/users_response.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitState extends HomeState {}

class HomeLoadUsersSuccessState extends HomeState {
  final List<Datum> users;

  HomeLoadUsersSuccessState({@required this.users});

  @override
  List<Object> get props => [users];
}

class HomeLoadUsersFailState extends HomeState {
  final String message;

  HomeLoadUsersFailState({@required this.message});

  @override
  List<Object> get props => [message];
}

class HomeGetUserSuccessState extends HomeState {
  final Datum user;

  HomeGetUserSuccessState({@required this.user});

  @override
  List<Object> get props => [user];
}

class HomeGetUserFailState extends HomeState {
  final String message;

  HomeGetUserFailState({@required this.message});

  @override
  List<Object> get props => [message];
}

class HomeFailureState extends HomeState {
  final String message;

  HomeFailureState({@required this.message});

  @override
  List<Object> get props => [message];
}
