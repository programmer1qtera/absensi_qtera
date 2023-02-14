import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:http/http.dart' as http;

class AbsensiController extends GetxController {
  TextEditingController descController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  List<String> listAbsen = ['Masuk', 'Keluar'];
  Map<String, dynamic>? dataLocationRes;
  List<Placemark>? placeMarks;
  bool isLoading = false;
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

  void pickImage() async {
    filePick = await _imagePicker.pickImage(
        imageQuality: 50, source: ImageSource.camera);
    dataLocationRes = await determinePosition();
    if (dataLocationRes!['error'] != true) {
      if (filePick != null) {
        position = dataLocationRes!['position'];
        placeMarks = await placemarkFromCoordinates(
            position!.latitude, position!.longitude);
        address =
            '${placeMarks![1].street!.length > 7 ? placeMarks![1].street : placeMarks![0].street}, ${placeMarks![0].subLocality},${placeMarks![0].locality}.${placeMarks![0].subAdministrativeArea}, ${placeMarks![0].country}';

        var decodeImg = img.decodeImage(File(filePick!.path).readAsBytesSync());
        img.drawString(decodeImg!, address!, font: img.arial48);
        var encodeImage = img.encodeJpg(decodeImg);
        finalImage = File(filePick!.path)..writeAsBytesSync(encodeImage);
        print(finalImage);
        print(filePick!.path);
      } else {
        Get.snackbar(
            'Kesalahan Camera', 'Tejadi kesalahan saat pengambilan gambar');
      }
    } else {
      Get.snackbar('Kesalahan GPS', dataLocationRes!['message']);
    }

    update();
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
    var stream = http.ByteStream(finalImage!.openRead());
    stream.cast();
    var lenght = await finalImage!.length();
    var multipart =
        http.MultipartFile('image', stream, lenght, filename: filePick!.name);
    final url = Uri.parse('http://192.168.88.66:5000/mobile_absensi/add');
    var request = http.MultipartRequest('POST', url);
    request.fields['lat'] = '${position.latitude}';
    request.fields['long'] = '${position.longitude}';
    request.fields['address'] = address;
    request.fields['in'] = time;
    request.fields['place'] = descController.text;
    request.fields['date'] = now.toIso8601String();
    request.fields['status'] = isChoos!;
    request.files.add(multipart);

    var response = await request.send();
    print(response.statusCode);
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
    // print(response.request);

    // try {
    // final url = Uri.parse('http://192.168.88.66:5000/mobile_absensi/add');
    //   final response = await http.post(url, body: map);
    //   // {
    //   //   'lat': '${position.latitude}',
    //   //   'long': '${position.longitude}',
    //   //   'image': '$finalImage',
    //   //   'address': address,
    //   //   'in': getDateHours,
    //   //   'place': descController.text,
    //   //   'date': now.toIso8601String(),
    //   //   'status': isChoos
    //   // }
    //   if (response.statusCode == 200) {
    //     print(response.statusCode);
    //     // print('dapet nilai captcha getId $getIdCaptcha');
    //     print(response.body);

    //     isLoading = false;

    //     // Get.to(const MainPage());
    //   } else {
    //     isLoading = false;

    //     // print('dapet nilai captcha getId $getIdCaptcha');

    //     print(response.statusCode);
    //     print(response.body);
    //     var message = jsonDecode(response.body);
    //     print(message['message']);
    //   }
    // } catch (e) {
    //   throw Exception(e);
    // }
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
