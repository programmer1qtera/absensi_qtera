import 'package:absensi_qtera_mandiri/page/sick/sick_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SickView extends GetView<SickController> {
  const SickView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SickController());
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upload File :',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Surat_sakit.pdf'),
                  ElevatedButton(
                      onPressed: () {
                        controller.getFile();
                      },
                      child: Text('Pilih File'))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Surat_copy_resep.pdf'),
                  ElevatedButton(
                      onPressed: () {
                        controller.getFile2();
                      },
                      child: Text('Pilih File'))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Surat_dokter.pdf'),
                  ElevatedButton(
                      onPressed: () {
                        controller.getFile3();
                      },
                      child: Text('Pilih File'))
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tanggal Pengajuan Sakit :',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GetBuilder<SickController>(builder: (c) {
                    return Text(c.getDateTime == null
                        ? 'Pilih Tanggal Pengajuan'
                        : '${c.getDateTime}');
                  }),
                  IconButton(
                      onPressed: () {
                        controller.getCalender(context);
                      },
                      icon: Icon(Icons.date_range))
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            maxLines: 5,
            decoration: InputDecoration(
              hintText: 'Keterangan',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: () {}, child: Text('Ajukan Sakit'))
        ],
      ),
    );
  }
}
