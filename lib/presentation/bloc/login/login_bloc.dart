import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:logger/logger.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:sgu_portable/core/service/context_service.dart';
import 'package:sgu_portable/domain/usecases/login_usecase.dart';
import 'package:sgu_portable/injection_container.dart';
import 'package:sgu_portable/presentation/bloc/login/login_event.dart';
import 'package:sgu_portable/presentation/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase;
  LoginBloc(this.loginUsecase) : super(LoginInitial()) {
    on<StartLogin>(_onLogin);
  }
  final formKey = GlobalKey<FormBuilderState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> _onLogin(StartLogin event, Emitter<LoginState> emit) async {
    try {
      if (formKey.currentState?.validate() == true) {
        emit(LoginLoading(isLoading: true));
        await loginUsecase
            .call(Params(username: event.username, password: event.password));
        emit(LoginSuccess());
      }
    } on DioException catch (e) {
      emit(LoginLoading(isLoading: false));
      QuickAlert.show(
          context: sl<ContextService>().key.currentContext!,
          type: QuickAlertType.error,
          title: e.response?.data["message"]);
    }
  }
}
