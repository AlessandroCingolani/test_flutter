import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/RouteGenerator.dart';
import 'package:test_flutter/providers/like.dart';

import 'package:test_flutter/screens/SplashScreen.dart';


void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => Like())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(148, 255, 45,0)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}


