class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {
  bool isLoading;
  LoginLoading({required this.isLoading});
}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {}
