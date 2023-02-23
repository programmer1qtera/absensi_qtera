import 'package:absensi_qtera_mandiri/model/precense_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ItemPrecense extends StatelessWidget {
  PrecenseItem dataPrecenses;
  ItemPrecense({super.key, required this.dataPrecenses});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${dataPrecenses.status}',
              style: TextStyle(
                  fontSize: 18,
                  color: dataPrecenses.status == 'Masuk'
                      ? Colors.greenAccent
                      : Colors.red),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Nama Tempat'),
                          SizedBox(
                            width: 5,
                          ),
                          Text(':'),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(child: Text('${dataPrecenses.place}'))
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text('In'),
                          SizedBox(
                            width: 82,
                          ),
                          Text(':'),
                          SizedBox(
                            width: 5,
                          ),
                          Text('${dataPrecenses.inn}')
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Tanggal'),
                          SizedBox(
                            width: 44,
                          ),
                          Text(':'),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(child: Text('${dataPrecenses.date}'))
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Lokasi'),
                          SizedBox(
                            width: 55,
                          ),
                          Text(':'),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(child: Text('${dataPrecenses.addres}'))
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
