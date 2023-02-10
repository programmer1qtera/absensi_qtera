import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AbsensiView extends StatelessWidget {
  const AbsensiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Absen'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          child: ListView(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Text(
                    'Pilih Absen',
                  ),
                  // PopupMenuButton(
                  //   icon: Icon(Icons.arrow_drop_down),
                  //   onSelected: (value) {
                  //     controller.isPilihan(value);
                  //   },
                  //   itemBuilder: (context) {
                  //     return controller.itemAbsenLog
                  //         .map<PopupMenuItem>((String e) =>
                  //             PopupMenuItem(value: e, child: Text(e)))
                  //         .toList();
                  //   },
                  // )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(height: 250, color: Colors.grey[800]),
              ElevatedButton(
                onPressed: () {
                  // Get.to(CameraPage());
                  // controller.takePicture(context);
                  // controller.picImage();
                  // controller.drawTextOnImage();
                },
                child: Text('Ambil Gambar'),
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: 'Nama Tempat Kunjungan',
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(onPressed: () {}, child: Text('Absen Sekarang')),
            ],
          ),
        ));
  }
}
