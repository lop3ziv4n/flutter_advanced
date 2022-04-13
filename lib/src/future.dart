import 'package:flutter/material.dart';
import 'package:flutter_advanced/src/future/models/user.dart';
import 'package:flutter_advanced/src/future/providers/user_provider.dart';
import 'package:flutter_advanced/src/future/widget/user_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FutureBuilder Example',
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final UserProvider userProvider = UserProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureBuilder Example'),
      ),
      body: FutureBuilder(
        future: userProvider.getUsers(),
        builder: (BuildContext context, AsyncSnapshot<ResponseData> snapshot) {
          //print(snapshot.connectionState);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return UserList(users: snapshot.data?.users ?? []);
          }
        },
      ),
    );
  }
}
