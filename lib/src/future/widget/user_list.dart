import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class UserList extends StatelessWidget {
  final List<User> users;

  const UserList({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return FadeInDownBig(
          delay: Duration(milliseconds: 100 * index),
          child: ListTile(
            title: Text('${user.firstName} ${user.lastName}'),
            subtitle: Text(user.email),
            trailing: Image.network(user.avatar),
          ),
        );
      },
    );
  }
}
