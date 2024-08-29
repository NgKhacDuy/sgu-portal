import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgu_portable/domain/entities/login_entity.dart';
import 'package:sgu_portable/presentation/bloc/global/main_event.dart';
import 'package:sgu_portable/presentation/bloc/global/main_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final SharedPreferences sharedPreferences;
  MainBloc(this.sharedPreferences) : super(MainState()) {
    on<MainEventGetData>(onGetData);
  }
  late LoginEntity infoUser;

  Future<void> onGetData(MainEvent event, Emitter<MainState> emit) async {
    // final getUser = LoginEntity.fromJson(
    //     json.decode(sharedPreferences.getString("infoUser").toString()));
    // infoUser = getUser;
  }
}
