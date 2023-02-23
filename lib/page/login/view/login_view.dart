import 'package:absensi_qtera_mandiri/page/home/view/home_view.dart';
import 'package:absensi_qtera_mandiri/page/login/controller/login_controller.dart';
import 'package:absensi_qtera_mandiri/page/main_page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Stack(
        children: [
          // WebViewWidget(controller: controller.controllerWeb),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller.controllerEmail,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: controller.controllerPassword,
                decoration: const InputDecoration(hintText: 'Password'),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  controller.getCAptcha();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Saya Bukan Robot'),
                    Icon(Icons.person_3),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // ElevatedButton(
              //     onPressed: () {
              //       // Get.off(MainPage());
              //       controller.login();
              //     },
              //     child: Text('Login')),
              GetBuilder<LoginController>(builder: (c) {
                return c.isLoading == true
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          controller.login();
                        },
                        child: const Text('Login'));
              }),
            ],
          ),
        ],
      ),
    );
  }
}
