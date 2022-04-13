import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/hero_info.dart';
import '../widgets/super_floating_action.dart';
import '../widgets/super_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heroesInfo = Provider.of<HeroInfo>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(heroesInfo.hero),
      ),
      body: const Center(child: SuperText()),
      floatingActionButton: const SuperFloatingAction(),
    );
  }
}
