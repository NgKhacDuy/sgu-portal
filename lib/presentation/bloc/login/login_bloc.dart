import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgu_portable/domain/usecases/login_usecase.dart';
import 'package:sgu_portable/presentation/bloc/login/login_event.dart';
import 'package:sgu_portable/presentation/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase;
  LoginBloc(this.loginUsecase) : super(LoginInitial()) {
    on<LoginEvent>(_onLogin);
  }

  void _onLogin(LoginEvent event, Emitter<LoginState> emit) {
    emit(LoginLoading());
    loginUsecase
        .call(const Params(username: "3120410094", password: "2002khacduy"))
        .then((value) {
      print(value);
      emit(LoginSuccess());
    }).catchError((error) {
      emit(LoginFailure());
    });
  }
}
