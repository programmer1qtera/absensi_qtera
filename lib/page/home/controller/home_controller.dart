import 'package:get/get.dart';

class HomeController extends GetxController {
  bool isPrecense = false;
  bool isSick = false;

  void showAllPrecense() {
    isPrecense = !isPrecense;
    update();
  }

  void showAllSick() {
    isSick = !isSick;
    update();
  }
}
