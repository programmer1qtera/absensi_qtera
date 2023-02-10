import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class IzinView extends StatelessWidget {
  const IzinView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Izin'),
      ),
      body: Center(
        child: Text('Izin'),
      ),
    );
  }
}
