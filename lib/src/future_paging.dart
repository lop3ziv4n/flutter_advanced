import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'future/models/character.dart';
import 'future/providers/character_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'FutureBuilder Paging Example',
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _page = 1;
  final CharacterProvider _characterProvider = CharacterProvider();
  late Future<ResponseData> _responseData;
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    _responseData = _getData();
    super.initState();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        setState(() {
          _responseData = _getData(loadMore: true);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureBuilder Paging Example'),
      ),
      body: FutureBuilder(
        future: _responseData,
        builder: (BuildContext context, AsyncSnapshot<ResponseData> snapshot) {
          //print(snapshot.connectionState);
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Error"));
          }
          if (!snapshot.hasData) {
            return const Center(child: Text("Error"));
          }
          var characters = snapshot.data?.results ?? [];
          return ListView.builder(
            controller: _controller,
            itemCount: characters.length,
            itemBuilder: (context, index) {
              final character = characters[index];
              return FadeInUpBig(
                delay: Duration(milliseconds: 100 * index),
                child: Card(
                  child: ListTile(
                    title: Text(character.name),
                    subtitle: Text(character.type),
                    trailing: Image.network(character.image),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<ResponseData> _getData({loadMore = false}) {
    if (loadMore) {
      _page += 1;
    }
    return _characterProvider.getCharacters(page: _page);
  }
}
