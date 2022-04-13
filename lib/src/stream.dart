import 'package:flutter/material.dart';
import 'package:flutter_advanced/src/stream/product_bloc.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final productBloc = ProductBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Example',
      initialRoute: 'home',
      home: Scaffold(
        appBar: AppBar(
          title: StreamBuilder(
            stream: productBloc.productCount,
            builder: (_, AsyncSnapshot<int> snapshot) {
              return Text('Products : (${snapshot.data ?? 0})');
            },
          ),
        ),
        body: StreamBuilder(
          stream: productBloc.products,
          builder: (_, AsyncSnapshot<List<String>> asyncSnapshot) {
            final products = asyncSnapshot.data ?? []; // Valid Null
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (_, i) {
                return ListTile(
                  title: Text(products[i]),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
