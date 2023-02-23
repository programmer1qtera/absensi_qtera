import 'dart:convert';
import 'dart:io';

import 'package:absensi_qtera_mandiri/page/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:http/http.dart' as http;

class PrecenseController extends GetxController {
  var ctrl = Get.put(HomeController());
  TextEditingController descController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  List<String> listAbsen = ['Masuk', 'Keluar'];
  Map<String, dynamic>? dataLocationRes;
  List<Placemark>? placeMarks;
  bool isLoading = false;
  bool cameraLoad = false;

  Position? position;
  String? address;
  var finalImage;
  XFile? filePick;
  String? isChoos;

  void choosen(dynamic value) {
    isChoos = value;
    print(isChoos);
    update();
  }

  Future<void> pickImage() async {
    cameraLoad = true;
    update();
    try {
      filePick = await _imagePicker.pickImage(
          imageQuality: 50, source: ImageSource.camera);
      dataLocationRes = await determinePosition();
      if (dataLocationRes!['error'] != true) {
        if (filePick != null) {
          position = await dataLocationRes!['position'];
          placeMarks = await placemarkFromCoordinates(
              position!.latitude, position!.longitude);
          print(placeMarks);
          address =
              '${placeMarks![1].street!.length > 10 ? placeMarks![1].street : placeMarks![0].street},\n${placeMarks![0].subLocality},\n${placeMarks![0].locality},\n${placeMarks![0].subAdministrativeArea},\n${placeMarks![0].country}';

          var decodeImg =
              img.decodeImage(File(filePick!.path).readAsBytesSync());
          img.drawString(decodeImg!, address!,
              font: img.arial48, x: 50, wrap: true);
          var encodeImage = img.encodeJpg(decodeImg);
          finalImage = File(filePick!.path)..writeAsBytesSync(encodeImage);
          print(finalImage);
          print(filePick!.path);
          cameraLoad = false;
          update();
        } else {
          // return;
          // Get.snackbar(
          //     'Kesalahan Camera', 'Tejadi kesalahan saat pengambilan gambar');
          cameraLoad = false;
          update();
        }
      } else {
        Get.snackbar('Kesalahan GPS', dataLocationRes!['message']);
        cameraLoad = false;
        update();
      }
    } on PlatformException catch (e) {
      Get.snackbar('Terjadi Kesalahan', '$e');
      cameraLoad = false;
      update();
    }
  }

  Future<void> precense() async {
    isLoading = true;
    update();
    dataLocationRes = await determinePosition();
    DateTime now = DateTime.now();
    String getDateHours = DateFormat.Hm().format(now).replaceAll('/', '-');

    if (dataLocationRes!['error'] != true) {
      position = await dataLocationRes!['position'];
      placeMarks = await placemarkFromCoordinates(
          position!.latitude, position!.longitude);
      address =
          '${placeMarks![1].street!.length > 7 ? placeMarks![1].street : placeMarks![0].street}, ${placeMarks![0].subLocality},${placeMarks![0].locality}.${placeMarks![0].subAdministrativeArea}, ${placeMarks![0].country}';

      print(position!.latitude);
      print(address);
      if (position!.isMocked == true) {
        Get.snackbar('Terjadi Kesalahan', 'Matikan Aplikasi Pihak ke 3');
      } else {
        await uploadData(position!, address!, getDateHours, now);
      }
      isLoading = false;
      update();
      // print('${address}');
    } else {
      Get.snackbar('Kesalahan GPS', dataLocationRes!['message']);
      isLoading = false;
      update();
    }
  }

  Future<dynamic> uploadData(
      Position position, String address, String time, DateTime now) async {
    // var stream = http.ByteStream(finalImage!.openRead());
    // stream.cast();
    // var lenght = await finalImage!.length();
    // var multipart =
    //     http.MultipartFile('image', stream, lenght, filename: filePick!.name);
    // final url = Uri.parse('http://192.168.88.66:5000/mobile_absensi/add');
    // var request = http.MultipartRequest('POST', url);
    // // request.headers[]
    // request.fields['lat'] = '${position.latitude}';
    // request.fields['long'] = '${position.longitude}';
    // request.fields['address'] = address;
    // request.fields['in'] = time;
    // request.fields['place'] = descController.text;
    // request.fields['date'] = now.toIso8601String();
    // request.fields['status'] = isChoos!;
    // request.files.add(multipart);

    // var response = await request.send();
    // print(response.statusCode);
    // response.stream.transform(utf8.decoder).listen((value) {
    //   print(value);
    // });
    // if (response.statusCode == 200) {
    //   Get.snackbar('Sukses', 'Anda telah berhasil absen');
    // } else {
    //   Get.snackbar('Kesalahan Absen',
    //       'Terjadi kesalahan saat absensi, pastikan iternet anda aktif');
    // }
    // print(response.request);
    final box = GetStorage();
    var userLog = box.read('userData');
    var getToken = userLog['token'];

    try {
      final url = Uri.parse('http://192.168.88.205:4029/api/precense/create');
      final response = await http.post(url, headers: {
        "tokens": getToken
      }, body: {
        'lat': '${position.latitude}',
        'long': '${position.longitude}',
        // 'image': '$finalImage',
        'address': address,
        'in': time,
        'place': descController.text,
        'date': now.toIso8601String(),
        'status': isChoos
      });
      // {
      // 'lat': '${position.latitude}',
      // 'long': '${position.longitude}',
      // 'image': '$finalImage',
      // 'address': address,
      // 'in': getDateHours,
      // 'place': descController.text,
      // 'date': now.toIso8601String(),
      // 'status': isChoos
      // }
      if (response.statusCode == 200) {
        print(response.statusCode);
        // print('dapet nilai captcha getId $getIdCaptcha');
        print(response.body);

        isLoading = false;
        ctrl.getPrecense();
        // Get.to(const MainPage());
      } else {
        isLoading = false;

        // print('dapet nilai captcha getId $getIdCaptcha');

        print(response.statusCode);
        print(response.body);
        var message = jsonDecode(response.body);
        print(message['message']);
      }
    } catch (e) {
      throw Exception(e);
    }
    // http://192.168.88.66:5000/auth/login/mobile

    // print(Random().nextInt(10000).toString());
    // print(controllerEmail.text);
  }

  Future<Map<String, dynamic>> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return {
        'message': 'Tidak di dapat untuk mengambil GPS dari devaces ini',
        'error': true,
      };
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return {
          'message': 'Izin di tolak',
          'error': true,
        };
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return {
        'message': 'Tidak di izinkan untuk mangakses gps',
        'error': true,
      };
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position positionCurrent = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return {
      'position': positionCurrent,
      'message': 'berhasil mendapatkan posisi',
      'error': false,
    };
  }
}
