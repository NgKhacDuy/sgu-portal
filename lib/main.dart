import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgu_portable/core/service/context_service.dart';
import 'package:sgu_portable/presentation/bloc/global/main_bloc.dart';
import 'package:sgu_portable/presentation/bloc/global/main_event.dart';
import 'package:sgu_portable/presentation/bloc/global/main_state.dart';
import 'package:sgu_portable/presentation/navigation/app_navigation.dart';

import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initInjection();
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainBloc>(
      create: (context) => MainBloc(sl())..add(MainEventGetData()),
      child: Builder(builder: (context) {
        return BlocListener<MainBloc, MainState>(
          listener: (context, state) {},
          child: MaterialApp.router(
            key: sl<ContextService>().key,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            routerConfig: AppNavigation.router,
          ),
        );
      }),
    );
  }
}
