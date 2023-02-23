import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PaidLeaveController extends GetxController {
  String? getDateTime;
  File? filePdf;
  String? fileNamePdf;

  void getFile() async {
    FilePickerResult? resultFile = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (resultFile != null) {
      filePdf = File(resultFile.files.single.path!);
      fileNamePdf = resultFile.files.single.name;
      print(filePdf);
      print(fileNamePdf);
    } else {
      return;
    }
  }

  void getCalender(context) async {
    DateTime now = DateTime.now();
    final rangeDate = DateTime(now.year, now.month, now.day + 6);

    DateTime? getNewDate = await showDatePicker(
        initialEntryMode: DatePickerEntryMode.calendar,
        context: context,
        initialDate: now,
        firstDate: now,
        lastDate: rangeDate);

    if (getNewDate != null) {
      String day = DateFormat.EEEE().format(getNewDate);
      String inDay;
      if (day == 'Saturday' || day == 'Sunday') {
        if (day == 'Saturday') {
          inDay = 'Sabtu';
          Get.snackbar('Hari Libur', 'Anda yakin libur di hari $inDay');
        } else {
          inDay = 'Minggu';
          Get.snackbar('Hari Libur', 'Anda yakin libur di hari $inDay');
        }
      } else {
        getDateTime = DateFormat.yMMMMEEEEd().format(getNewDate);
        update();
      }
    } else {
      print('Data TGL kosong');
    }
  }
}
