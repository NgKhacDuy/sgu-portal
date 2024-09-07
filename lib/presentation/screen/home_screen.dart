import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:sgu_portable/components/app_dropdown_list_semester.dart';
import 'package:sgu_portable/components/app_dropdown_type_semester.dart';
import 'package:sgu_portable/injection_container.dart';
import 'package:sgu_portable/presentation/bloc/home/home_event.dart';
import 'package:sgu_portable/presentation/bloc/home/home_state.dart';
import '../bloc/home/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => sl()..add(HomeInitEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return AdvancedDrawer(
            controller: context.read<HomeBloc>().advancedDrawerController,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 300),
            animateChildDecoration: true,
            rtlOpening: false,
            // openScale: 1.0,
            disabledGestures: false,
            drawer: SafeArea(
              child: ListTileTheme(
                textColor: Colors.white,
                iconColor: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 128.0,
                      height: 128.0,
                      margin: const EdgeInsets.only(
                        top: 24.0,
                        bottom: 64.0,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        color: Colors.black26,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.person),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.home),
                      title: const Text('Home'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.account_circle_rounded),
                      title: const Text('Profile'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.favorite),
                      title: const Text('Favourites'),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.settings),
                      title: const Text('Settings'),
                    ),
                    ListTile(
                      onTap: () async => context.read<HomeBloc>().onLogout(),
                      leading: const Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                      title: const Text('Đăng xuất',
                          style: TextStyle(color: Colors.red)),
                    ),
                    const Spacer(),
                    DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white54,
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 16.0,
                        ),
                        child: const Text('Terms of Service | Privacy Policy'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            backdrop: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
                ),
              ),
            ),
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Advanced Drawer Example'),
                leading: IconButton(
                  onPressed: context.read<HomeBloc>().handleMenuButtonPressed,
                  icon: ValueListenableBuilder<AdvancedDrawerValue>(
                    valueListenable:
                        context.read<HomeBloc>().advancedDrawerController,
                    builder: (_, value, __) {
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),
                        child: Icon(
                          value.visible ? Icons.clear : Icons.menu,
                          key: ValueKey<bool>(value.visible),
                        ),
                      );
                    },
                  ),
                ),
              ),
              body: Center(
                child: Column(
                  children: [
                    if (state is HomeLoaded) ...[
                      AppDropdownTypeSemester(
                        value: state.selectedTypeSemester,
                        model: state.typeSemesters,
                        onChanged: (value) {
                          context.read<HomeBloc>().add(
                                HomeChangeTypeSemester(
                                  typeSemester: value!,
                                ),
                              );
                        },
                      ),
                      const Gap(16),
                      AppDropdownListSemester(
                        value: state.selectedListSemester,
                        model: state.semester,
                        onChanged: (value) {
                          context.read<HomeBloc>().add(
                                HomeChangeListSemester(
                                  semester: value!,
                                ),
                              );
                        },
                      ),
                    ]
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
