import 'package:flutter/material.dart';

class LoginState {}

class LoginInitial extends LoginState {
  bool isRemember;
  TextEditingController usernameController;
  TextEditingController passwordController;
  LoginInitial(
      {required this.isRemember,
      required this.usernameController,
      required this.passwordController});
}

class LoginLoading extends LoginState {
  bool isLoading;
  LoginLoading({required this.isLoading});
}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {}

class CheckBoxState extends LoginState {
  bool value;
  CheckBoxState({required this.value});
}
