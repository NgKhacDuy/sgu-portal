import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:sgu_portable/core/error/exceptions.dart';
import 'package:sgu_portable/domain/entities/time_table/type_semester_entity.dart';
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
    on<HomeChangeTypeSemester>(onChangeTypeSemester);
    on<HomeChangeListSemester>(onChangeListSemester);
  }
  late final advancedDrawerController = AdvancedDrawerController();

  void handleMenuButtonPressed() {
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
        selectedListSemester: listSemester.dsHocKy!.first.hocKy!,
        selectedTypeSemester: typeSemester.dsDoiTuongTkb!.first.loaiDoiTuong!,
        semester: listSemester,
        typeSemesters: typeSemester,
      ));
    } on ServerException catch (e) {
      Logger().e(e);
      e.detect();
    }
  }

  void onChangeTypeSemester(
      HomeChangeTypeSemester event, Emitter<HomeState> emit) {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      emit(HomeLoaded(
          semester: currentState.semester,
          typeSemesters: currentState.typeSemesters,
          selectedTypeSemester: event.typeSemester,
          selectedListSemester: currentState.selectedListSemester));
    }
  }

  void onChangeListSemester(
      HomeChangeListSemester event, Emitter<HomeState> emit) {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      emit(HomeLoaded(
          semester: currentState.semester,
          typeSemesters: currentState.typeSemesters,
          selectedTypeSemester: currentState.selectedTypeSemester,
          selectedListSemester: event.semester));
    }
  }
}
