import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgu_portable/injection_container.dart';
import 'package:sgu_portable/presentation/bloc/home/home_event.dart';
import 'package:sgu_portable/presentation/bloc/home/home_state.dart';
import 'package:sgu_portable/presentation/navigation/app_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState());

  final advancedDrawerController = AdvancedDrawerController();

  void handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    advancedDrawerController.showDrawer();
  }

  Future<void> onLogout() async {
    advancedDrawerController.hideDrawer();
    await sl<SharedPreferences>().setString("token", "");
    AppNavigation.router.go("/login");
  }
}
