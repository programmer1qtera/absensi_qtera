import 'dart:convert';

import 'package:absensi_qtera_mandiri/model/user_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class UserServices {
  static Future<UserModel> userServices() async {
    final box = GetStorage();
    var userLog = box.read('userData');
    var getToken = userLog['token'];

    final url = Uri.parse('http://192.168.88.205:4029/api/user/id');
    final response = await http.get(url, headers: {"tokens": getToken});

    if (response.statusCode == 200) {
      // print(response.body);

      final dataIn = jsonDecode(response.body);
      print(dataIn);
      return UserModel.fromJson(dataIn['data']);
    } else {
      throw Exception('error');
    }
  }
}
