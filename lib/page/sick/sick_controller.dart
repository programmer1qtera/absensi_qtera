import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SickController extends GetxController {
  String? getDateTime;

  File? file1;
  String? fileName1;
  File? file2;
  String? fileName2;
  File? file3;
  String? fileName3;

  void getFile() async {
    FilePickerResult? resultFile = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (resultFile != null) {
      file1 = File(resultFile.files.single.path!);
      fileName1 = resultFile.files.single.name;
      print(file1);
      print(fileName1);
    } else {
      return;
    }
  }

  void getFile2() async {
    FilePickerResult? resultFile = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (resultFile != null) {
      file2 = File(resultFile.files.single.path!);
      fileName2 = resultFile.files.single.name;
      print(file2);
      print(fileName2);
    } else {
      return;
    }
  }

  void getFile3() async {
    FilePickerResult? resultFile = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (resultFile != null) {
      file3 = File(resultFile.files.single.path!);
      fileName3 = resultFile.files.single.name;
      print(file3);
      print(fileName3);
    } else {
      return;
    }
  }

  void getCalender(context) async {
    DateTime date = DateTime.now();

    final rangeDate = DateTime(date.year, date.month, date.day - 2);

    DateTime? getNewDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: rangeDate,
        lastDate: DateTime.now());
    if (getNewDate != null) {
      String getDay = DateFormat.EEEE().format(getNewDate);
      String inday;
      if (getDay == 'Saturday' || getDay == 'Sunday') {
        if (getDay == 'Saturday') {
          inday = 'Sabtu';
          Get.snackbar('Hari Libur', 'Anda yakin libur di hari $inday');
        } else {
          inday = 'Minggu';
          Get.snackbar('Hari Libur', 'Anda yakin libur di hari $inday ');
        }
        getDateTime = null;
      } else {
        getDateTime = DateFormat.yMMMMEEEEd().format(getNewDate);
      }
    } else {
      getDateTime = null;

      print('TGL date kosong');
    }
    update();
  }
}
