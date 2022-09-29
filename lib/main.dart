import 'package:firebase_core/firebase_core.dart';
import 'package:sdp_project/controllers/auth_controller.dart';
import 'package:sdp_project/pages/loading.dart';
import 'package:sdp_project/pages/login.dart';
import 'package:sdp_project/pages/signup.dart';
import 'package:flutter/material.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // await Firebase.initializeApp().then((value)=>Get.put(AuthController()));
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//       // home:MyApp(),
//     initialRoute: '/loading',
//     routes: {
//         '/loading':(context)=>Loading(),
//         '/login': (context)=>Login(),
//         '/signup': (context)=>SignUp(),
//     },
//   ));
// }


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/loading',
    routes: {
      '/loading':(context)=>Loading(),
      '/login': (context)=>Login(),
      '/signup': (context)=>SignUp(),
    },
  ));
}
