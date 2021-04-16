import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_boilerplate/models/models.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthAppInitEvent extends AuthEvent {}

class AuthRegisterEvent extends AuthEvent {
  final RegisterRequest registerRequest;

  const AuthRegisterEvent({@required this.registerRequest});

  @override
  List<Object> get props => [registerRequest];
}

class AuthLoginEvent extends AuthEvent {
  final LoginRequest loginRequest;

  const AuthLoginEvent({@required this.loginRequest});

  @override
  List<Object> get props => [loginRequest];
}

class AuthSignoutEvent extends AuthEvent {}
