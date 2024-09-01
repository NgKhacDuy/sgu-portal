import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sgu_portable/core/error/exceptions.dart';
import 'package:sgu_portable/domain/usecases/time_table/get_semester_usecase.dart';
import 'package:sgu_portable/presentation/bloc/home/home_event.dart';
import 'package:sgu_portable/presentation/bloc/home/home_state.dart';
import 'package:sgu_portable/presentation/navigation/app_navigation.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetListSemesterUsecase getListSemesterUsecase;
  HomeBloc(this.getListSemesterUsecase) : super(HomeState()) {
    on<HomeInitEvent>(onInit);
  }

  final advancedDrawerController = AdvancedDrawerController();

  void handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    advancedDrawerController.showDrawer();
  }

  Future<void> onLogout() async {
    advancedDrawerController.hideDrawer();
    GetStorage().remove("token");
    AppNavigation.router.go("/login");
  }

  Future<void> onInit(HomeInitEvent event, Emitter<HomeState> emit) async {
    try {
      await getListSemesterUsecase.call();
    } on ServerException catch (e) {
      e.detect();
    }
  }
}
