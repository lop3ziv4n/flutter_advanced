import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/hero_info.dart';
import '../providers/villain_info.dart';

class SuperText extends StatelessWidget {
  const SuperText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final heroInfo = Provider.of<HeroInfo>(context);
    final villainInfo = Provider.of<VillainInfo>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Consumer<HeroInfo>(
        //   builder: (context, heroInfo, _ ) => Text( heroInfo.hero,
        //     style: TextStyle(
        //       fontSize: 30.0,
        //       color: heroInfo.colorBase
        //     ),
        //   )
        // )
        Text(
          heroInfo.hero,
          style: TextStyle(fontSize: 30.0, color: heroInfo.colorBase),
        ),
        Text(
          villainInfo.villain,
          style: const TextStyle(fontSize: 25.0),
        )
      ],
    );
  }
}
