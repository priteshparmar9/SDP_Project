import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sdp_project/Services/controller.dart';
import 'package:sdp_project/loadingPage.dart';
import 'package:sdp_project/pages/BookPage.dart';
import 'package:sdp_project/pages/UserHistory.dart';
import 'package:sdp_project/pages/admin_addFlight.dart';
import 'package:sdp_project/pages/home.dart';
import 'package:sdp_project/pages/login.dart';
import 'package:sdp_project/pages/main.dart';
import 'package:sdp_project/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  Get.testMode = true;
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  final box = GetStorage();
  Controller ctrl = new Controller();


  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // home:MyApp(),
    initialRoute: (ctrl.IsLoggedIn() == true)?'/home':'/login',
    // initialRoute: '/history',
    routes: {
      '/history': (context) => UserHistory(),
      '/bookNow': (context) => BookNow(),
      '/home': (context) => Home(),
      '/loading': (context) => Loading(),
      '/login': (context) => Login(),
      '/signup': (context) => SignUp(),
      '/mainPage': (context) => MainPage(),
      '/addFlight': (context) => AddFlight(),
    },
  ));
}



// void main(){
//   runApp(
//     Scaffold(
//       body: Loading(),
//     )
//   );
// }