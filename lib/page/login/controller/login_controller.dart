import 'dart:convert';

import 'package:absensi_qtera_mandiri/page/home/view/home_view.dart';
import 'package:absensi_qtera_mandiri/page/main_page/main_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grecaptcha/grecaptcha.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  bool isLoading = false;

  String? getIdCaptcha;

  // void getGrecaptcha() async {
  //   String captchaSite = '6LdunUckAAAAAD9EayEGboTmLMl55jr61TeTBDVm';
  //   try {
  //     var tokentResult = await GCaptcha.reCaptcha(captchaSite);
  //     print('token : $tokentResult');
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  void getCAptcha() async {
    try {
      var greGet = Grecaptcha();

      greGet
          .verifyWithRecaptcha('6LdunUckAAAAAD9EayEGboTmLMl55jr61TeTBDVm')
          .then((result) {
        if (result != null) {
          print(result);
          getIdCaptcha = result;
          update();
          // print(getIdCaptcha);
        } else {
          print('Terjadi Kesalahan');
        }
        // print(result);
      }, onError: (e, s) {
        getIdCaptcha = null;
        Get.back();
        if (kDebugMode) {
          print("Could not verify:\n$e at $s");
        }
      });
    } catch (e) {
      getIdCaptcha = null;
      throw Exception(e);
    }
  }

  // void fakeGps() async {
  //   Location location = Location();
  //   LocationData? locationData;
  //   locationData = await location.getLocation();
  //   print(locationData.isMock);
  // }

  void login() async {
    isLoading = true;
    update();
    // http://192.168.88.66:5000/auth/login/mobile
    // http://192.168.88.44:5000/api/user/login'
    final url = Uri.parse('http://192.168.88.205:4029/api/user/login');
    final response = await http.post(url, body: {
      'email': controllerEmail.text,
      'password': controllerPassword.text,
      // 'token': getIdCaptcha
    });

    if (response.statusCode == 200) {
      print(response.statusCode);
      // print('dapet nilai captcha getId $getIdCaptcha');
      print(jsonDecode(response.body));
      final dataIn = jsonDecode(response.body);
      // print(dataIn['data']['_id']);
      final box = GetStorage();

      box.write('userData', {
        "id": dataIn['data']['_id'],
        "name": dataIn['data']['name'],
        "token": dataIn['data']['token'],
      });

      print(box.read('userData'));
      isLoading = false;
      update();
      Get.offAll(const MainPage());
    } else {
      isLoading = false;
      update();
      // print('dapet nilai captcha getId $getIdCaptcha');

      print(response.statusCode);
      var message = jsonDecode(response.body);
      print(message['message']);
    }
    // print(Random().nextInt(10000).toString());
    print(controllerEmail.text);
  }

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
