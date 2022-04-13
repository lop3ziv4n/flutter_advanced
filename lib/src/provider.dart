import 'package:flutter/material.dart';
import 'package:flutter_advanced/src/provider/screens/home_screen.dart';
import 'package:flutter_advanced/src/provider/providers/hero_info.dart';
import 'package:flutter_advanced/src/provider/providers/villain_info.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {

  //   return ChangeNotifierProvider(
  //     create: (context) => HeroInfo(),
  //     child: MaterialApp(
  //       title: 'Material App',
  //       initialRoute: 'home',
  //       routes: {
  //         'home' : (context) => HomeScreen()
  //       },
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HeroInfo>(
          create: (context) => HeroInfo(),
        ),
        ChangeNotifierProvider<VillainInfo>(
          create: (context) => VillainInfo(),
        ),
      ],
      child: MaterialApp(
        title: 'Material App',
        initialRoute: 'home',
        routes: {'home': (context) => const HomeScreen()},
      ),
    );
  }
}
