import 'dart:math';

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SliverGrid SliverAppBar  Example',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> items =
        List.generate(100, (index) => Square(index: index));

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('SliverGrid'),
            floating: true,
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: Image.network(
              'https://cdn.fstoppers.com/media/2020/11/25/90_of_landscape_photography_in_only_20_minutes_03.jpg',
              fit: BoxFit.cover,
            ),
          ),
          /*SliverGrid.count(
            crossAxisCount: 4,
            children: items,
          ),*/
          SliverGrid.extent(
            maxCrossAxisExtent: 90,
            children: items,
          ),
        ],
      ),
    );
  }
}

class Square extends StatelessWidget {
  final int index;

  const Square({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final random = Random();

    final red = random.nextInt(255);
    final green = random.nextInt(255);
    final blue = random.nextInt(255);

    return Container(
      child: Center(
        child: Text(
          '$index',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      width: 150,
      height: 150,
      decoration: BoxDecoration(color: Color.fromRGBO(red, green, blue, 1)),
    );
  }
}
