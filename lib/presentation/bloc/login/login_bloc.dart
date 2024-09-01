import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:sgu_portable/core/params/login_param.dart';
import 'package:sgu_portable/core/service/context_service.dart';
import 'package:sgu_portable/domain/usecases/login_usecase.dart';
import 'package:sgu_portable/injection_container.dart';
import 'package:sgu_portable/presentation/bloc/login/login_event.dart';
import 'package:sgu_portable/presentation/bloc/login/login_state.dart';
import 'package:sgu_portable/presentation/navigation/app_navigation.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase;
  LoginBloc(this.loginUsecase) : super(LoginState()) {
    on<StartLogin>(_onLogin);
    on<ChangeCheckbox>(onChangeCheckbox);
    on<LoginInitEvent>(onInit);
  }
  final formKey = GlobalKey<FormBuilderState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final currentContext = sl<ContextService>().key.currentContext;
  bool isRemember = false;

  Future<void> _onLogin(StartLogin event, Emitter<LoginState> emit) async {
    try {
      if (formKey.currentState?.validate() == true) {
        emit(LoginLoading(isLoading: true));
        final infoUser = await loginUsecase.call(
            params:
                LoginParam(username: event.username, password: event.password));
        if (isRemember) {
          GetStorage().write("isRemember", true);
          GetStorage().write("mssv", usernameController.text);
          GetStorage().write("password", passwordController.text);
        } else {
          GetStorage().write("isRemember", false);
        }
        GetStorage().write("token", infoUser.accessToken!);
        AppNavigation.router.go("/home");
      }
    } on DioException catch (e) {
      emit(LoginLoading(isLoading: false));
      QuickAlert.show(
          context: sl<ContextService>().key.currentContext!,
          type: QuickAlertType.error,
          title: e.response?.data["message"]);
    }
  }

  Future<void> onChangeCheckbox(
      ChangeCheckbox event, Emitter<LoginState> emit) async {
    isRemember = event.value;
    emit(CheckBoxState(value: event.value));
  }

  Future<void> onInit(LoginInitEvent event, Emitter<LoginState> emit) async {
    final getIsRemember = GetStorage().read<bool>("isRemember");
    if (getIsRemember != null && getIsRemember) {
      final mssv = GetStorage().read("mssv");
      final password = GetStorage().read("password");
      if (mssv != null && password != null) {
        isRemember = getIsRemember;
        usernameController.text = mssv;
        passwordController.text = password;
        emit(CheckBoxState(value: true));
        emit(LoginInitial(
            isRemember: isRemember,
            usernameController: usernameController,
            passwordController: passwordController));
      }
    }
  }
}
