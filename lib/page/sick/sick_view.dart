import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class SickView extends GetView {
  const SickView({super.key});

  @override
  Widget build(BuildContext context) {
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
                  ElevatedButton(onPressed: () {}, child: Text('Pilih File'))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Surat_copy_resep.pdf'),
                  ElevatedButton(onPressed: () {}, child: Text('Pilih File'))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Surat_dokter.pdf'),
                  ElevatedButton(onPressed: () {}, child: Text('Pilih File'))
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
                  Text('02/03/2023'),
                  IconButton(onPressed: () {}, icon: Icon(Icons.date_range))
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
