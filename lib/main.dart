import 'package:absensi_qtera_mandiri/page/main_page/main_page.dart';
import 'package:absensi_qtera_mandiri/theme/costume_theme.dart';
import 'package:absensi_qtera_mandiri/page/login/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final alredyLogin = box.read('userData');
    return GetMaterialApp(
        title: 'Absen Qtera',
        theme: darkTheme,
        home: alredyLogin == null ? LoginView() : MainPage());
  }
}
