import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ItemSick extends StatelessWidget {
  const ItemSick({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sakit',
              style: TextStyle(fontSize: 18, color: Colors.redAccent),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Icon(Icons.file_present),
                SizedBox(
                  width: 10,
                ),
                Text('SuratSakit.pdf')
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Icon(Icons.file_present),
                SizedBox(
                  width: 10,
                ),
                Text('Kuitansi.pdf')
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Icon(Icons.file_present),
                SizedBox(
                  width: 10,
                ),
                Text('Resepdokter.pdf')
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Tanggal Pengajuan : ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Text('Senin, 23 Maret 2023'),
            SizedBox(
              height: 10,
            ),
            Text(
              'Keterangan : ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Text('asjjaskjasnakjnsaknsa')
          ],
        ),
      ),
    );
  }
}
