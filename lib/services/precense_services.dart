import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../model/precense_model.dart';

class PrecenseServices {
  static Future<PrecenseModel> precenseServices() async {
    final box = GetStorage();
    var userLog = box.read('userData');
    var getToken = userLog['token'];

    final url = Uri.parse('http://192.168.88.205:4029/api/precense/');
    final response = await http.get(url, headers: {'tokens': getToken});

    if (response.statusCode == 200) {
      // print(response.body);

      final dataIn = jsonDecode(response.body);
      print(dataIn);
      return PrecenseModel.fromJson(dataIn);
    } else {
      throw Exception('error');
    }
  }
}
