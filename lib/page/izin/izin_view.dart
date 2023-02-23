import 'package:absensi_qtera_mandiri/page/home/controller/home_controller.dart';
import 'package:absensi_qtera_mandiri/page/izin/izin_controller.dart';
import 'package:absensi_qtera_mandiri/page/main_page/main_page.dart';
import 'package:absensi_qtera_mandiri/page/paid_leave/paid_leave_view.dart';
import 'package:absensi_qtera_mandiri/page/sick/sick_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class IzinView extends GetView<IzinControler> {
  IzinView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(IzinControler());
    return Scaffold(
        appBar: AppBar(
          title: Text('Izin'),
          leading: IconButton(
              onPressed: () {
                Get.offAll(MainPage());
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: GetBuilder<IzinControler>(builder: (c) {
          return ListView(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    child: Text(c.isChoos == null
                        ? 'Pilih Tidak Kehadiran'
                        : '${c.isChoos}'),
                  ),
                  PopupMenuButton(
                    icon: Icon(Icons.menu),
                    onSelected: (value) {
                      controller.choosen(value);
                    },
                    itemBuilder: (context) {
                      return c.listIzin
                          .map<PopupMenuItem>(
                              (e) => PopupMenuItem(value: e, child: Text(e)))
                          .toList();
                    },
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              c.isChoos == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.5,
                        ),
                        Text('Pilih Salah Satu Tidak Kehadiran'),
                      ],
                    )
                  : c.isSick == true
                      ? SickView()
                      : PaidLeaveView()
            ],
          );
        }));
  }
}
