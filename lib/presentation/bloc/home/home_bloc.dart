import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:sgu_portable/core/error/exceptions.dart';
import 'package:sgu_portable/domain/usecases/time_table/get_semester_usecase.dart';
import 'package:sgu_portable/domain/usecases/time_table/get_type_semester_usecase.dart';
import 'package:sgu_portable/presentation/bloc/home/home_event.dart';
import 'package:sgu_portable/presentation/bloc/home/home_state.dart';
import 'package:sgu_portable/presentation/navigation/app_navigation.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetListSemesterUsecase getListSemesterUsecase;
  final GetTypeSemesterUsecase getTypeSemesterUsecase;
  HomeBloc(this.getListSemesterUsecase, this.getTypeSemesterUsecase)
      : super(HomeState()) {
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
      final typeSemester = await getTypeSemesterUsecase.call();
      final listSemester = await getListSemesterUsecase.call();
      emit(HomeLoaded(
        semester: listSemester,
        typeSemesters: typeSemester,
      ));
    } on ServerException catch (e) {
      Logger().e(e);
      e.detect();
    }
  }
}
