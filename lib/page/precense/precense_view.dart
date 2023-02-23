import 'package:absensi_qtera_mandiri/page/main_page/main_page.dart';
import 'package:absensi_qtera_mandiri/page/precense/precense_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrecenseView extends GetView<PrecenseController> {
  const PrecenseView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PrecenseController());
    return Scaffold(
        appBar: AppBar(
          title: Text('Absen'),
          leading: IconButton(
              onPressed: () {
                Get.offAll(MainPage());
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: GetBuilder<PrecenseController>(builder: (c) {
          return ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Column(
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
                                .map<PopupMenuItem>((e) =>
                                    PopupMenuItem(value: e, child: Text(e)))
                                .toList();
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    c.cameraLoad == true
                        ? Container(
                            height: 250,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : c.finalImage != null
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
                        if (c.cameraLoad == true) {
                          Get.snackbar('Tunggu', 'Sedang pengambilan gambar');
                        } else {
                          controller.pickImage();
                        }
                        // Get.to(CameraPage());
                        // controller.takePicture(context);
                        // controller.picImage();
                        // controller.drawTextOnImage();
                      },
                      child: Text('Ambil Gambar'),
                    ),
                    SizedBox(
                      height: 10,
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
                          if (c.isChoos == null ||
                              c.finalImage == null ||
                              controller.descController.text == '') {
                            Get.snackbar('Data Kosong',
                                'Isi Semua data yang di butuhkan');
                          } else {
                            if (c.isLoading == true) {
                              Get.snackbar('Tunggu', 'Sedang prosess absensi');
                            } else {
                              controller.precense();
                            }
                          }
                        },
                        child: c.isLoading == true
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : Text('Absen Sekarang')),
                  ],
                ),
              ),
            ],
          );
        }));
  }
}
