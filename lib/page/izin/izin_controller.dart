import 'package:get/get.dart';

class IzinControler extends GetxController {
  var listIzin = ['Sakit', 'Cuti'];
  bool? isSick;
  String? isChoos;

  void choosen(dynamic value) {
    isChoos = value;
    if (isChoos == 'Sakit') {
      isSick = true;
    } else {
      isSick = false;
    }
    update();
  }
}
