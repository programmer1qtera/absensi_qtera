import 'package:absensi_qtera_mandiri/page/precense/precense_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class ExpandFab extends StatelessWidget {
  VoidCallback onTap1;
  VoidCallback onTap2;
  ExpandFab({required this.onTap1, required this.onTap2, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTap1,
          child: CircleAvatar(
            backgroundColor: Colors.greenAccent,
            maxRadius: 30,
            child: Icon(
              Icons.present_to_all,
              color: Colors.black,
              size: 30,
            ),
          ),
        ),
        SizedBox(
          width: 30,
        ),
        InkWell(
          onTap: onTap2,
          child: CircleAvatar(
            backgroundColor: Colors.greenAccent,
            maxRadius: 30,
            child: Icon(
              Icons.leave_bags_at_home,
              color: Colors.black,
              size: 30,
            ),
          ),
        )
      ],
    );
  }
}
