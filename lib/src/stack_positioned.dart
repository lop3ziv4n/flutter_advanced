import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stack Positioned  Example',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        width: 350,
        height: 350,
        color: Colors.blue,
        child: Stack(
          children: const [
            Positioned.fill(top: 10, right: 10, child: PinkBox())

            // Positioned(
            //   top: 0,
            //   bottom: 0,
            //   left: 0,
            //   right: 0,
            //   // width: 150,
            //   // height: 150,
            //   child: PinkBox()
            // ),

            // Positioned(
            //   // top: 5,
            //   bottom: 20,
            //   // left: 5,
            //   right: 20,
            //   width: 150,
            //   height: 150,
            //   child: GreenBox()
            // ),
          ],
        ),
      )),
    );
  }
}

class PinkBox extends StatelessWidget {
  const PinkBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.pink,
    );
  }
}

class GreenBox extends StatelessWidget {
  const GreenBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.green,
    );
  }
}
