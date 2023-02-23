import 'package:absensi_qtera_mandiri/page/paid_leave/paid_leave_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class PaidLeaveView extends GetView {
  const PaidLeaveView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(PaidLeaveController());
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
                  Text('Surat_Cuti.pdf'),
                  ElevatedButton(
                      onPressed: () {
                        controller.getFile();
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
                'Tanggal Pengajuan Cuti :',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GetBuilder<PaidLeaveController>(builder: (c) {
                    return Text(c.getDateTime == null
                        ? 'Pilih Tanggal'
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
          ElevatedButton(onPressed: () {}, child: Text('Ajukan Cuti'))
        ],
      ),
    );
  }
}
