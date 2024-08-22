class LoginEvent {}

class StartLogin extends LoginEvent {
  final String username;
  final String password;

  StartLogin({required this.username, required this.password});
}
