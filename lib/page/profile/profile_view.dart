import 'package:absensi_qtera_mandiri/page/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return GetBuilder<ProfileController>(builder: (c) {
      return c.isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(children: [
              Text(
                '${c.result.name}',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '${c.result.email}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Text('089726355199'),
              Text('Depok')
            ]);
    });
  }
}
