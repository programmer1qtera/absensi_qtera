// import 'package:absensi_qtera_mandiri/page/main_page/widget/expand_fab.dart';
import 'package:absensi_qtera_mandiri/page/login/view/login_view.dart';
import 'package:absensi_qtera_mandiri/page/main_page/widget/expand_widget.dart';
import 'package:absensi_qtera_mandiri/page/precense/precense_view.dart';
import 'package:absensi_qtera_mandiri/page/home/view/home_view.dart';
import 'package:absensi_qtera_mandiri/page/izin/izin_view.dart';
import 'package:absensi_qtera_mandiri/page/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
              : IconButton(
                  onPressed: () {
                    final box = GetStorage();
                    box.erase();
                    Get.offAll(LoginView());
                    // Navigator.o(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => LoginView(),
                    //     ));
                  },
                  icon: Icon(Icons.logout))
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
          // ExpandFab();
          showDialog(
            barrierColor: Colors.transparent,
            context: context,
            builder: (context) {
              return Dialog(
                elevation: 0,
                shadowColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                insetPadding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.60,
                ),
                child: ExpandFab(
                  onTap1: () {
                    Get.to(PrecenseView());
                  },
                  onTap2: () {
                    Get.to(IzinView());
                  },
                ),
              );
            },
          );
          // setState(() {
          //   isExpand = !isExpand;
          // });
        },
        child: Icon(Icons.calendar_today),
        // child: Material(
        //   color: Colors.transparent,
        //   child: PopupMenuButton(
        //       onSelected: (value) {
        //         if (value == 1) {
        //           Get.to(PrecenseView());
        //         }
        //         if (value == 2) {
        //           Get.to(IzinView());
        //         }
        //       },
        //       offset: const Offset(50, -130),
        //       color: const Color(0xff48525e),
        //       itemBuilder: (context) => [
        //             PopupMenuItem(
        //               value: 1,
        //               child: Text('Absen'),
        //             ),
        //             PopupMenuItem(
        //               value: 2,
        //               child: Text('Izin'),
        //             ),
        //           ],
        //       child: Container(
        //         color: Colors.transparent,
        //         child: const Icon(
        //           Icons.calendar_today,
        //           size: 30,
        //         ),
        //       )),
        // ),
      ),
    );
  }
}
