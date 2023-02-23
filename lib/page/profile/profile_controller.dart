import 'package:absensi_qtera_mandiri/model/user_model.dart';
import 'package:absensi_qtera_mandiri/services/user_services.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  bool isLoading = false;

  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  late UserModel _getFinalUser;
  UserModel get result => _getFinalUser;

  Future<dynamic> getUser() async {
    try {
      isLoading = true;
      update();
      var dataUser = await UserServices.userServices();
      if (dataUser != null) {
        _getFinalUser = dataUser;
        print('data from controller $dataUser');
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
}
