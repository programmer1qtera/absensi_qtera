import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ItemPrecense extends StatelessWidget {
  const ItemPrecense({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Masuk',
              style: TextStyle(fontSize: 18, color: Colors.greenAccent),
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
                          Expanded(child: Text('Qtera Mandiri'))
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
                          Text('01 : 25')
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
                          Expanded(child: Text('Kamis, 23 Juli 2023'))
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text('Alamat'),
                          SizedBox(
                            width: 49,
                          ),
                          Text(':'),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Kelapa Gading')
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