import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/hero_info.dart';
import '../providers/villain_info.dart';

class SuperFloatingAction extends StatelessWidget {
  const SuperFloatingAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heroInfo = Provider.of<HeroInfo>(context);
    final villainInfo = Provider.of<VillainInfo>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          child: const Icon(Icons.accessibility),
          backgroundColor: Colors.red,
          onPressed: () {
            heroInfo.hero = 'Ironman';
            villainInfo.villain = 'El Mandarín';
          },
        ),
        const SizedBox(height: 10.0),
        FloatingActionButton(
          child: const Icon(Icons.add_moderator),
          backgroundColor: Colors.blue,
          onPressed: () {
            heroInfo.hero = 'Capitán América';
            villainInfo.villain = 'Red Skull';
          },
        ),
      ],
    );
  }
}
