import 'package:absensi_qtera_mandiri/page/absensi/absensi_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class AbsensiView extends GetView<AbsensiController> {
  const AbsensiView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AbsensiController());
    return Scaffold(
        appBar: AppBar(
          title: Text('Absen'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          child: GetBuilder<AbsensiController>(builder: (c) {
            return ListView(
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Text(
                      c.isChoos == null ? 'Pilih Absen' : '${c.isChoos}',
                      style: TextStyle(
                          color: c.isChoos == null
                              ? Colors.white
                              : c.isChoos == 'Masuk'
                                  ? Colors.greenAccent
                                  : Colors.redAccent),
                    ),
                    PopupMenuButton(
                      icon: Icon(Icons.menu),
                      onSelected: (value) {
                        controller.choosen(value);
                      },
                      itemBuilder: (context) {
                        return c.listAbsen
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
                c.filePick != null
                    ? Container(
                        height: 250,
                        width: double.infinity,
                        child: Image.file(
                          c.finalImage,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(height: 250, color: Colors.grey[800]),
                ElevatedButton(
                  onPressed: () {
                    controller.pickImage();
                    // Get.to(CameraPage());
                    // controller.takePicture(context);
                    // controller.picImage();
                    // controller.drawTextOnImage();
                  },
                  child: Text('Ambil Gambar'),
                ),
                TextField(
                  controller: controller.descController,
                  decoration: InputDecoration(
                      hintText: 'Nama Tempat Kunjungan',
                      border: OutlineInputBorder()),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      controller.precense();
                    },
                    child: c.isLoading == true
                        ? Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text('Absen Sekarang')),
              ],
            );
          }),
        ));
  }
}
