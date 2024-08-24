class LoginEvent {}

class LoginInitEvent extends LoginEvent {}

class StartLogin extends LoginEvent {
  final String username;
  final String password;

  StartLogin({required this.username, required this.password});
}

class ChangeCheckbox extends LoginEvent {
  final bool value;

  ChangeCheckbox({required this.value});
}
