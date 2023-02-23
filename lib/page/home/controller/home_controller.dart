import 'package:absensi_qtera_mandiri/model/precense_model.dart';
import 'package:absensi_qtera_mandiri/services/precense_services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  bool isPrecense = false;
  bool isSick = false;
  bool isLoading = false;

  @override
  void onInit() {
    // TODO: implement onInit
    getPrecense();
    super.onInit();
  }

  late PrecenseModel _precenseModel;
  PrecenseModel get results => _precenseModel;

  Future<dynamic> getPrecense() async {
    try {
      isLoading = true;
      update();
      var dataPrecense = await PrecenseServices.precenseServices();
      if (dataPrecense != null) {
        _precenseModel = dataPrecense;
        print('data from controller $dataPrecense');
        isLoading = false;
        update();
      } else {
        print('Data user kosong');
        isLoading = false;
        update();
      }
    } catch (e) {
      print(e);
      isLoading = false;
      update();
    }
  }

  void showAllPrecense() {
    isPrecense = !isPrecense;
    update();
  }

  void showAllSick() {
    isSick = !isSick;
    update();
  }
}
