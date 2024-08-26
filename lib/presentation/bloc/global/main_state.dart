import 'package:sgu_portable/domain/entities/login_entity.dart';

class MainState {}

class MainInitial extends MainState {
  final LoginEntity? loginEntity;

  MainInitial({required this.loginEntity});
}
