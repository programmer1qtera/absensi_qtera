import 'package:absensi_qtera_mandiri/page/absensi/absensi_view.dart';
import 'package:absensi_qtera_mandiri/page/home/view/home_view.dart';
import 'package:absensi_qtera_mandiri/page/izin/izin_view.dart';
import 'package:absensi_qtera_mandiri/page/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _curentIdx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_curentIdx == 0 ? 'Home' : 'Profile'),
        actions: [
          _curentIdx == 0
              ? Container()
              : IconButton(onPressed: () {}, icon: Icon(Icons.logout))
        ],
      ),
      body: _curentIdx == 0 ? HomeView() : ProfileView(),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey[800],
          type: BottomNavigationBarType.fixed,
          currentIndex: _curentIdx,
          onTap: (value) {
            setState(() {
              _curentIdx = value;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person)),
          ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Take button');
        },
        child: Material(
          color: Colors.transparent,
          child: PopupMenuButton(
              onSelected: (value) {
                if (value == 1) {
                  Get.to(AbsensiView());
                }
                if (value == 2) {
                  Get.to(IzinView());
                }
              },
              offset: const Offset(50, -130),
              color: const Color(0xff48525e),
              itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: Text('Absen'),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Text('Izin'),
                    ),
                  ],
              child: Container(
                color: Colors.transparent,
                child: const Icon(
                  Icons.calendar_today,
                  size: 30,
                ),
              )),
        ),
      ),
    );
  }
}
