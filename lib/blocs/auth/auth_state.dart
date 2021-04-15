import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitState extends AuthState {}

class AuthSuccessState extends AuthState {}

class AuthFailState extends AuthState {}

class AuthAppFailureState extends AuthState {
  final String message;

  AuthAppFailureState({@required this.message});

  @override
  List<Object> get props => [message];
}
