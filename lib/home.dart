import 'dart:async';

import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  with WidgetsBindingObserver{


  scanMethod() async{
    try {
      await FlutterBluePlus.startScan(timeout: const Duration(minutes: 2), androidUsesFineLocation: false);
      late String data = "";
      FlutterBluePlus.scanResults.listen(
            (results) async {
          for (ScanResult r in results) {
            print('----${r.device.remoteId}');
            if(r.device.remoteId.toString() == "AC:98:B1:11:1D:C6"){
              if(data.isEmpty){
                data = r.device.remoteId.toString();
                r.device.connect();
                // final snackBar = snackBarGood("Connect: Success");
                // snackBarKeyC.currentState?.removeCurrentSnackBar();
                // snackBarKeyC.currentState?.showSnackBar(snackBar);
              }
            }
            // FlutterBluePlus.scanResults.length;
            print('----Data-${await FlutterBluePlus.scanResults.length}');
            // if (seen.contains(r.device.remoteId) == false) {
            //   print('${r.device.remoteId}: "${r.device.localName}" found! rssi: ${r.rssi}');
            //   seen.add(r.device.remoteId);
            // }
          }
        },

        // onError(e) => print(e);
      );
      // var data1 = FlutterBluePlus.scanResults;
      print('----Data-$data');

      // print('===========data ====${await FlutterBluePlus.scanResults.length}');


      // print('====================$data');
    } catch (e) {
      // final snackBar = snackBarFail(prettyException("Start Scan Error:", e));
      // snackBarKeyB.currentState?.removeCurrentSnackBar();
      // snackBarKeyB.currentState?.showSnackBar(snackBar);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(child: Center(child: Text("fgfhfghfggfhghfgfghfgh"),),),
    );
  }
}
