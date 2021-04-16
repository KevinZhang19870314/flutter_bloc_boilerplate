import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeInitEvent extends HomeEvent {}

class HomeLoadUsersEvent extends HomeEvent {}

class HomeGetUserEvent extends HomeEvent {}
