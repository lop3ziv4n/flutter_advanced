import 'dart:async';

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stream Example',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _colorStream = StreamController<Color>();

  int _index = -1;
  final List<Color> _colors = [
    Colors.blue,
    Colors.amber,
    Colors.pink,
    Colors.green,
    Colors.red,
    Colors.indigo
  ];

  @override
  void dispose() {
    _colorStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Example'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _colorStream.stream,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (!snapshot.hasData) {
              return const LoadingWidget();
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return const Text('End Stream');
            }
            return Container(
              width: 150,
              height: 150,
              color: snapshot.data,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _index++;
          if (_index < _colors.length) {
            _colorStream.sink.add(_colors[_index]);
          } else {
            _colorStream.close();
          }
        },
        child: const Icon(Icons.color_lens),
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text('waiting clicks'),
        SizedBox(height: 20),
        CircularProgressIndicator(),
      ],
    );
  }
}
