import 'package:flutter/material.dart';
import 'package:flutter_advanced/src/future/models/user.dart';
import 'package:flutter_advanced/src/future/providers/user_provider.dart';
import 'package:flutter_advanced/src/future/widget/user_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'RefreshIndicator Example',
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
  final UserProvider _userProvider = UserProvider();
  late Future<ResponseData> _responseData;

  @override
  void initState() {
    super.initState();
    _responseData = _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RefreshIndicator Example'),
      ),
      body: FutureBuilder(
        future: _responseData,
        builder: (BuildContext context, AsyncSnapshot<ResponseData> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Center(child: Text('Press button to start.'));
            case ConnectionState.active:
            case ConnectionState.waiting:
              return const Center(child: Text('Awaiting result...'));
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              return RefreshIndicator(
                color: Colors.blue,
                onRefresh: () async {
                  setState(() {
                    _responseData = _refresh(loadMore: true);
                  });
                },
                child: UserList(users: snapshot.data?.users ?? []),
              );
            default:
              return const Center(child: Text('Press button to start.'));
          }
        },
      ),
    );
  }

  Future<ResponseData> _refresh({loadMore = false}) {
    if (loadMore) {
      _page += 1;
    }
    return _userProvider.getUsers(page: _page);
  }
}
