import 'package:flutter/material.dart';
import 'package:noviindus_task3/driver_list_screen.dart';
import 'package:noviindus_task3/driver_provider.dart';
import 'package:noviindus_task3/home_provider.dart';
import 'package:noviindus_task3/home_screen.dart';
import 'package:noviindus_task3/login_screen.dart';
import 'package:provider/provider.dart';

import 'login_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => DriversProvider()),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:   LoginScreen(),
      ),
    );
  }
}

