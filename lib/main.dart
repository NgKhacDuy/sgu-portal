import 'package:flutter/material.dart';
import 'package:sgu_portable/presentation/navigation/AppNavigation.dart';

import 'injection_container.dart';

Future<void> main() async {
  await initInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: AppNavigation.router,
    );
  }
}
