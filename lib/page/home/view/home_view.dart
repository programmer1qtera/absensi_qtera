import 'package:absensi_qtera_mandiri/page/precense/precense_view.dart';
import 'package:absensi_qtera_mandiri/page/home/controller/home_controller.dart';
import 'package:absensi_qtera_mandiri/page/home/widget/item_paid_leave.dart';
import 'package:absensi_qtera_mandiri/page/home/widget/item_precense.dart';
import 'package:absensi_qtera_mandiri/page/home/widget/item_sick.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: GetBuilder<HomeController>(builder: (c) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('User Test'),
                        Text(
                          '172661552',
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                    Text(
                      '12',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Daftar Absen Kehadiran'),
                InkWell(
                    onTap: () {
                      c.showAllPrecense();
                    },
                    child: Icon(c.isPrecense == false
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            c.isLoading == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : c.results.dataPrecense == null
                    ? Center(
                        child: Text('Belum Absen sama sekali'),
                      )
                    : ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: c.isPrecense == true
                            ? c.results.dataPrecense!.length
                            : 1,
                        itemBuilder: (context, index) {
                          var dataPrecense =
                              controller.results.dataPrecense![index];
                          return ItemPrecense(
                            dataPrecenses: dataPrecense,
                          );
                        },
                      ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Daftar Izin Sakit'),
                InkWell(
                    onTap: () {
                      c.showAllSick();
                    },
                    child: Icon(c.isSick == false
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: c.isSick == false ? 1 : 5,
              itemBuilder: (context, index) {
                return ItemSick();
              },
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Cuti'), Icon(Icons.arrow_drop_down_circle)],
            ),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return ItemPaidLeave();
              },
            ),
          ],
        );
      }),
    ));
  }
}
