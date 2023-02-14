import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Text(
        'User Test',
        style: TextStyle(fontSize: 20),
      ),
      Text(
        '046355521',
        style: TextStyle(fontSize: 18),
      ),
      SizedBox(
        height: 10,
      ),
      Text('089726355199'),
      Text('Depok')
    ]);
  }
}
